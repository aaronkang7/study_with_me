//
//  CoursesVC.swift
//  ios-frontend
//
//  Created by Aaron Kang on 11/19/21.
//

import Foundation
import UIKit
import SnapKit

class CoursesVC : UIViewController{
    
    var courseTableView: UITableView!
    var courseData: [Course] = []
    
    let reuseIdentifier = "courseCellReuse"
    let cellHeight: CGFloat = 110
    var courses: [Course]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        courses = [Course(name: "Hello", class_code: "Hello2", department: "Chem", enrollment: 30, professor: "Mr.Hello"),Course(name: "Class Name", class_code: "CS2110", department: "Computer Science", enrollment: 30, professor: "Mr.jdasfidogn")]
        setupViews()
        setupConstraints()
    }
    
    func setupViews(){
        courseTableView = UITableView();
        courseTableView.delegate = self
        courseTableView.dataSource = self
        courseTableView.translatesAutoresizingMaskIntoConstraints = false;
        courseTableView.register(CourseTableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        view.addSubview(courseTableView)
    }
    
    func setupConstraints(){
        NSLayoutConstraint.activate([
            courseTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            courseTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            courseTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            courseTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

extension CoursesVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeight
    }
}

extension CoursesVC: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return courses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! CourseTableViewCell
        let postObject = courses[indexPath.row]
        cell.configure(for: postObject)
        return cell
    }
    
    
}
