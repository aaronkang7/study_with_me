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
    
    let padding: CGFloat = 20
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

        nameLabel.font = .systemFont(ofSize: 30)
        nameLabel.textColor = .black
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(nameLabel)

        codeLabel.font = .systemFont(ofSize: 16)
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
        

        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(for course: Course) {
        nameLabel.text = course.name
        codeLabel.text = "  \(course.class_code)  "
        enrollmentLabel.text = String(course.enrollment) + " students enrolled"
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            codeLabel.bottomAnchor.constraint(equalTo: nameLabel.topAnchor, constant: -5),
            codeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 25),
            codeLabel.heightAnchor.constraint(equalToConstant: 25)
        ])
        
        NSLayoutConstraint.activate([
            nameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 25)
        ])

        NSLayoutConstraint.activate([
            enrollmentLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
            enrollmentLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 25)
        ])
    }

}
