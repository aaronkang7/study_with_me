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
    let padding: CGFloat = 20
    let margin: CGFloat = 30
    let height: CGFloat = 20

    override init(frame: CGRect) {
        super.init(frame: frame)

        contentView.backgroundColor = .lightGray
        contentView.layer.cornerRadius = 8
        contentView.clipsToBounds = true

        nameLabel.font = .systemFont(ofSize: 30)
        nameLabel.textColor = .black
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(nameLabel)

        codeLabel.font = .systemFont(ofSize: 30)
        codeLabel.textColor = .black
        codeLabel.translatesAutoresizingMaskIntoConstraints = false
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
        codeLabel.text = course.class_code
        enrollmentLabel.text = String(course.enrollment) + " students enrolled"
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20)
        ])
        NSLayoutConstraint.activate([
            codeLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor),
            codeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20)
        ])
        NSLayoutConstraint.activate([
            enrollmentLabel.topAnchor.constraint(equalTo: codeLabel.bottomAnchor),
            enrollmentLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20)
        ])
    }

}
