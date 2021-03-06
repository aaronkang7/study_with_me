//
//  CourseTableViewCell.swift
//  ios-frontend
//
//  Created by Aaron Kang on 11/20/21.
//

import Foundation
import UIKit
import SnapKit

class CourseCollectionViewCell: UICollectionViewCell {
    
    var course_id: Int = -1;
    
    var delegate : CourseCellDelegate?
    var nameLabel = UILabel()
    var codeLabel = UILabel()
    var enrollmentLabel = UILabel()
    var actionButton = UIButton()
    var isSearch = false
    
    var courseData: [Course] = []
    var courses: [Course]!
    
    let removeAlert = UIAlertController(title: "Drop Class?", message: nil, preferredStyle: .alert)
    
    let addAlert = UIAlertController(title: "Add Class?", message: nil, preferredStyle: .alert)
    
    let padding: CGFloat = 25
    let margin: CGFloat = 30
    let height: CGFloat = 20

    override init(frame: CGRect) {
        super.init(frame: frame)

        contentView.backgroundColor = .white
        contentView.clipsToBounds = true
        
        contentView.layer.cornerRadius = 10
        contentView.layer.borderWidth = 0.0
        contentView.layer.shadowColor = UIColor.black.cgColor
        contentView.layer.shadowOffset = CGSize(width: 0, height: 0)
        contentView.layer.shadowRadius = 10.0
        contentView.layer.shadowOpacity = 0.2
        contentView.layer.masksToBounds = false

        nameLabel.font = UIFont.systemFont(ofSize: 25, weight: UIFont.Weight.semibold)
        nameLabel.numberOfLines = 1;
        nameLabel.lineBreakMode = .byTruncatingTail
        nameLabel.textColor = .black
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(nameLabel)

        codeLabel.font = UIFont.systemFont(ofSize: 15, weight: UIFont.Weight.light)
        codeLabel.textColor = .white
        codeLabel.translatesAutoresizingMaskIntoConstraints = false
        codeLabel.clipsToBounds = true
        codeLabel.layer.backgroundColor = UIColor(red: 0/255, green: 110/255, blue: 230/255, alpha: 0.8).cgColor
        codeLabel.layer.cornerRadius = 6
        contentView.addSubview(codeLabel)

        enrollmentLabel.font = UIFont.systemFont(ofSize: 15, weight: UIFont.Weight.regular)
        enrollmentLabel.textColor = .black
        enrollmentLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(enrollmentLabel)
        
        
        
        removeAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        removeAlert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { (action) in
            //TODO: Replace with networking manager later
//            let id = self.courseData[self.course_id]
//            NetworkManager.deleteCourse(id: ) { course in
//                self.courses.remove(at: self.course_id)
//                self.courseCollectionView.reloadData()
//            }
            print("done deleting \(self.course_id)");
        }))
        
        
        addAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        addAlert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { (action) in
//            if let id = self.course_id {
//                NetworkManager.addUserToCourse(courseId: id, id: Student.id, name: Student, email: <#T##String#>, year: <#T##Int#>, major: <#T##String#>, bio: <#T##String#>) { course in
//
//                }
//            }
            print("done adding \(self.course_id)")
        }))
        

        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Button functions
    
    @objc func deleteButtonTapped(){
        delegate?.handleRemove(input: removeAlert)
//        NetworkManager.deleteCourse(id: self.id) { course in
//            print(course)
//        }
    }
    
    @objc func addButtonTapped() {
        delegate?.handleRemove(input: addAlert)
//        NetworkManager.createCourse(id: course.id, ) { course in
//            print(course)
//        }
//        addUserToCourse()
    }
    
    func addUserToCourse() {
//        NetworkManager.addUserToCourse(courseId: Course.id, id: Student.id, name: Student.name, email: Student.email, year: Student.year, major: Student.major, bio: Student.bio) { student in
//
//        }
    }
    
    func configure(for course: Course, isSearch: Bool) {
        self.isSearch = isSearch
        loadButton()
        self.course_id = course.id
        nameLabel.text = course.name.uppercased()
        codeLabel.text = "  \(course.class_code.uppercased())  "
        enrollmentLabel.text = String(course.enrollment) + " students enrolled"
    }
    
    func loadButton(){
        actionButton.layer.cornerRadius = 10
        actionButton.translatesAutoresizingMaskIntoConstraints = false
        if(isSearch){
            actionButton.setImage(UIImage(systemName: "plus"), for: .normal)
            actionButton.tintColor = .systemBlue
            actionButton.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
        } else{
            actionButton.setImage(UIImage(systemName: "trash"), for: .normal)
            actionButton.tintColor = .systemRed
            actionButton.addTarget(self, action: #selector(deleteButtonTapped), for: .touchUpInside)
        }
        contentView.addSubview(actionButton)
        
        NSLayoutConstraint.activate([
            actionButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            actionButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding)
        ])
        
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            codeLabel.bottomAnchor.constraint(equalTo: nameLabel.topAnchor, constant: -7),
            codeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            codeLabel.heightAnchor.constraint(equalToConstant: 25)
        ])
        
        NSLayoutConstraint.activate([
            nameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor,constant: 3),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            nameLabel.heightAnchor.constraint(lessThanOrEqualToConstant: 30),
            nameLabel.widthAnchor.constraint(equalToConstant: 260)
        ])

        NSLayoutConstraint.activate([
            enrollmentLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
            enrollmentLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding)
        ])
    }
}
