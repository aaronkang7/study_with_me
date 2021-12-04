//
//  SearchVC.swift
//  ios-frontend
//
//  Created by Aaron Kang on 11/19/21.
//

import Foundation
import UIKit



class ResultsVC : UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPink //for testing purposes
    }
}

class SearchVC : UIViewController, UISearchResultsUpdating, UISearchControllerDelegate{

    
    
    let searchController = UISearchController(searchResultsController: ResultsVC())
    let searchBar = UISearchBar();
    
    var courseCollectionView: UICollectionView!
    var courseData: [Course] = []
    
    let reuseIdentifier = "courseCellReuse"
    let cellHeight: CGFloat = 110
    var courses: [Course]!
    
    var filtered: [Course] = []
    
    
    let headerReuseIdentifier = "headerReuseIdentifier"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.backgroundColor = .white
        title = "Search"
        
        
        self.navigationItem.searchController = searchController

        searchController.loadViewIfNeeded()
        searchController.delegate = self
        searchController.searchResultsUpdater = self
        self.navigationItem.searchController?.searchBar.isHidden = false
        searchController.searchBar.enablesReturnKeyAutomatically = false
        searchController.searchBar.returnKeyType = UIReturnKeyType.done
 
        
        courses = [Course(id: 0,name: "Intro to Python", class_code: "CS1110", department: "Computer Science", enrollment: 300, professor: "White"),Course(id: 1, name: "Discrete Structs", class_code: "CS2800", department: "Computer Science", enrollment: 30, professor: "van Zuylen"), Course(id: 2, name: "Multi Calculus", class_code: "MATH1920", department: "Math", enrollment: 285, professor: "Prof1"), Course(id: 3, name: "IOS Development", class_code: "CS1998", department: "Computer Science", enrollment: 15, professor: "Prof2"), Course(id: 4, name: "Intro Micro", class_code: "ECON1110", department: "Economics", enrollment: 100, professor: "Wissink"), Course(id: 5, name: "Gen Chem 1", class_code: "CHEM2090", department: "Chemistry", enrollment: 150, professor: "Musser")]
        courseData = courses
        
        setupViews()
        setupConstraints()
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else {
            return
        }
        let vc = searchController.searchResultsController as? ResultsVC
        vc?.view.backgroundColor = .yellow
        print(text)
    }
    
    func setupViews(){
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 30
        layout.minimumInteritemSpacing = 10
        layout.sectionInset = UIEdgeInsets(top: 10, left: 5, bottom: 10, right: 5)
        
        courseCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        courseCollectionView.backgroundColor = .clear
        courseCollectionView.translatesAutoresizingMaskIntoConstraints = false
        courseCollectionView.register(CourseCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        courseCollectionView.dataSource = self
        courseCollectionView.delegate = self
        courseCollectionView.register(HeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerReuseIdentifier)
        view.addSubview(courseCollectionView)
        
    }
    
    func setupConstraints(){
        NSLayoutConstraint.activate([
            //search.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
            courseCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            courseCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            courseCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            courseCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])

        
    }
    //MARK: getCourses()
    func getCourses() {
        NetworkManager.getCourses { courses in
            self.courseData = courses
            DispatchQueue.main.async {
                self.courseCollectionView.reloadData()
            }
        }
        courses = courseData
        print(courses!)
        

    }
    
}
extension SearchVC: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
 
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return courses.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = courseCollectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CourseCollectionViewCell
        let course = courses[indexPath.item]
        cell.configure(for: course, isSearch: true)
        cell.delegate = self
        return cell
    }
    
}

extension SearchVC: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let numItemsPerRow: CGFloat = 1.0
        let size = (collectionView.frame.width - 10) / numItemsPerRow
        return CGSize(width: size-20, height: size / 2 - 40)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        return
    }
    
}

extension SearchVC: CourseCellDelegate{
    func handleRemove(input: UIAlertController) {
        present(input, animated: true)
    }
}
