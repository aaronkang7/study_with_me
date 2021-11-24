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

    var nameLabel = UILabel()
    var codeLabel = UILabel()
    var enrollmentLabel = UILabel()
    var deleteButton = UIButton()
    
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

        nameLabel.font = UIFont(name: "STHeitiTC-Light", size: 25)
        nameLabel.textColor = .black
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(nameLabel)

        codeLabel.font = UIFont(name:"SanFranciscoDisplay-Light",size: 16)
        codeLabel.textColor = .white
        codeLabel.translatesAutoresizingMaskIntoConstraints = false
        codeLabel.clipsToBounds = true
        codeLabel.layer.backgroundColor = UIColor(red: 0/255, green: 110/255, blue: 230/255, alpha: 0.8).cgColor
        codeLabel.layer.cornerRadius = 6
        contentView.addSubview(codeLabel)

        enrollmentLabel.font = .systemFont(ofSize: 15)
        enrollmentLabel.textColor = .black
        enrollmentLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(enrollmentLabel)
        
        deleteButton.setImage(UIImage(systemName: "trash"), for: .normal)
        deleteButton.tintColor = .systemRed
        deleteButton.layer.cornerRadius = 10
        deleteButton.translatesAutoresizingMaskIntoConstraints = false
        deleteButton.addTarget(self, action: #selector(deleteButtonTapped), for: .touchUpInside)
        contentView.addSubview(deleteButton)

        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func deleteButtonTapped(){
        //NetworkingManager DELETE course from user course array
        print("Deleted")
    }
    
    func configure(for course: Course) {
        nameLabel.text = course.name.uppercased()
        codeLabel.text = "  \(course.class_code.uppercased())  "
        enrollmentLabel.text = String(course.enrollment) + " students enrolled"
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
            nameLabel.heightAnchor.constraint(lessThanOrEqualToConstant: 30)
        ])

        NSLayoutConstraint.activate([
            enrollmentLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
            enrollmentLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding)
        ])
        
        NSLayoutConstraint.activate([
            deleteButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            deleteButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding)
        ])
    }

}
