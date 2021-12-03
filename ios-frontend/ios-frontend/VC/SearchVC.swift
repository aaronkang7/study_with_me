//
//  SearchVC.swift
//  ios-frontend
//
//  Created by Aaron Kang on 11/19/21.
//

import Foundation
import UIKit

//MARK: Notes
// So this is the searchController VC but the searchController does
// not work here at all (at least from my code) so I moved it to the main
// ViewController where it works better (i.e. the searchBar appears)

//class ResultsVC : UIViewController {
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = .systemGray //for testing purposes
//    }
//}

class SearchVC : UIViewController, UISearchResultsUpdating, UISearchControllerDelegate{
    
    
    let searchController = UISearchController(searchResultsController: nil)
    let searchBar = UISearchBar();
    
    var courseCollectionView: UICollectionView!
    var courseData: [Course] = []
    
    let reuseIdentifier = "courseCellReuse"
    let cellHeight: CGFloat = 110
    var courses: [Course]!
    
    
    let headerReuseIdentifier = "headerReuseIdentifier"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.backgroundColor = .white
        title = "Search"
        
        
//        self.navigationItem.searchController = searchController
//        
//        searchController.delegate = self
//        searchController.searchResultsUpdater = self
        
        
        //searchController.searchBar.searchBarStyle = .default
        //searchController.searchResultsUpdater = self
        //navigationItem.searchController = searchController
//        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationItem.searchController?.searchBar.isHidden = false
        //navigationItem.hidesSearchBarWhenScrolling = true
        //searchController.searchBar.placeholder = "Search Here"
        //searchController.searchBar.sizeToFit()
        
        courses = [Course(id: 0,name: "Hello", class_code: "Hello2", department: "Chem", enrollment: 30, professor: "Mr.Hello"),Course(id: 1, name: "Class Name", class_code: "CS2110", department: "Computer Science", enrollment: 30, professor: "Mr.jdasfidogn"), Course(id: 2, name: "Multi Calculus", class_code: "MATH1920", department: "Math", enrollment: 285, professor: "Prof1"), Course(id: 3, name: "IOS Development", class_code: "CS1998", department: "Computer Science", enrollment: 15, professor: "Prof2"), Course(id: 4, name: "Course Name Here", class_code: "ABC123", department: "No Department", enrollment: 100, professor: "Prof3"), Course(id: 5, name: "LAST", class_code: "ABC123", department: "No Department", enrollment: 150, professor: "Prof3")]
        courseData = courses
        
        setupViews()
        setupConstraints()
        //getCourses()
    }
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else {
            return
        }
        let vc = searchController.searchResultsController as? ResultsVC
        vc?.view.backgroundColor = .blue
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
    //MARK: Network
//    func getCourses() {
//        NetworkManager.getCourses()
//
//    }
    
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
