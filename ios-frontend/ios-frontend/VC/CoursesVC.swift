//
//  CoursesVC.swift
//  ios-frontend
//
//  Created by Aaron Kang on 11/19/21.
//

import Foundation
import UIKit
import SnapKit

protocol CourseCellDelegate {
    func handleRemove(input :UIAlertController);
}

class CoursesVC : UIViewController {
    
    
    var courseCollectionView: UICollectionView!
    var courseData: [Course] = []
    
    let reuseIdentifier = "courseCellReuse"
    let cellHeight: CGFloat = 110
    var courses: [Course]!
    
    let headerReuseIdentifier = "headerReuseIdentifier"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "My Courses"
        
        view.backgroundColor = .white
        
        courses = [Course(id: 2, name: "Multi Calculus", class_code: "MATH1920", department: "Math", enrollment: 285, professor: "Prof1"), Course(id: 3, name: "IOS Development", class_code: "CS1998", department: "Computer Science", enrollment: 15, professor: "Prof2"), Course(id: 4, name: "Intro Micro", class_code: "ECON1110", department: "Economics", enrollment: 100, professor: "Wissink")]
        courseData = courses
        setupViews()
        setupConstraints()
        
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
            courseCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            courseCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            courseCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            courseCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        
        
        
}

    
    func getUserById() {
//        NetworkManager.getUserById(id: Student.id) {
//
//        }
    }



}
extension CoursesVC: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
 
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return courses.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = courseCollectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CourseCollectionViewCell
        let course = courses[indexPath.item]
        cell.configure(for: course, isSearch: false)
        cell.delegate = self
        return cell
    }
    
}

extension CoursesVC: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let numItemsPerRow: CGFloat = 1.0
        let size = (collectionView.frame.width - 10) / numItemsPerRow
        return CGSize(width: size-20, height: size / 2 - 40)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let id = self.courseData[indexPath[1]].id
        print(id)
        //TODO: Use id to fetch students in course
        let viewController = StudentsVC()
        
        show(viewController, sender: self)
        
        
    }
    
}

extension CoursesVC: CourseCellDelegate{
    func handleRemove(input: UIAlertController) {
        present(input, animated: true)
    }
}

//extension CoursesVC: UICollectionViewDataSource {
//    func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return 1
//    }
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return courses.count
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = courseCollectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CourseCollectionViewCell
//        let course = courses[indexPath.item]
//        cell.configure(for: course, isSearch: true)
//        cell.delegate = self
//        return cell
//    }
//
//}
