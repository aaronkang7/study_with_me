//
//  CoursesVC.swift
//  ios-frontend
//
//  Created by Aaron Kang on 11/19/21.
//

import Foundation
import UIKit
import SnapKit

class CoursesVC : UIViewController {
    
    
    
    //var courseTableView: UITableView!
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
        courses = [Course(name: "Hello", class_code: "Hello2", department: "Chem", enrollment: 30, professor: "Mr.Hello"),Course(name: "Class Name", class_code: "CS2110", department: "Computer Science", enrollment: 30, professor: "Mr.jdasfidogn"), Course(name: "Multi Calculus", class_code: "MATH1920", department: "Math", enrollment: 285, professor: "Prof1"), Course(name: "IOS Development", class_code: "CS1998", department: "Computer Science", enrollment: 15, professor: "Prof2"), Course(name: "Course Name Here", class_code: "ABC123", department: "No Department", enrollment: 100, professor: "Prof3")]
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
        cell.configure(for: course)
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
        let cell = courseCollectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        let course = courses[indexPath.item]
        
        
    }
    
}
