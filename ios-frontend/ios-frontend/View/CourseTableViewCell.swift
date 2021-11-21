//
//  CourseTableViewCell.swift
//  ios-frontend
//
//  Created by Aaron Kang on 11/20/21.
//

import Foundation
import UIKit

class ProductTableViewCell: UITableViewCell {
    var nameLabel: UILabel!
    var codeLabel: UILabel!
    var enrollmentLabel: UILabel!
    let padding: CGFloat = 8
    let height: CGFloat = 20
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        nameLabel = UILabel()
        nameLabel.font = UIFont.systemFont(ofSize: 18)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(nameLabel)
        
        codeLabel = UILabel()
        codeLabel.font = UIFont.systemFont(ofSize: 14)
        codeLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(codeLabel)
        
        enrollmentLabel = UILabel()
        enrollmentLabel.font = UIFont.systemFont(ofSize: 12)
        enrollmentLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(enrollmentLabel)
        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints(){
//        NSLayoutConstraint.activate([
//                productImage.widthAnchor.constraint(equalToConstant: imageDim),
//                productImage.heightAnchor.constraint(equalToConstant: imageDim),
//                productImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
//            productImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
//        ])
//
//
//
//        NSLayoutConstraint.activate([
//                nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
//                nameLabel.heightAnchor.constraint(equalToConstant: height),
//                nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding)])
//
//
//        NSLayoutConstraint.activate([
//                reviewLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
//                reviewLabel.heightAnchor.constraint(equalToConstant: height),
//                reviewLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding+20)])
//
//        NSLayoutConstraint.activate([
//                companyLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
//                companyLabel.heightAnchor.constraint(equalToConstant: height),
//                companyLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding+40)])
    }
    
    func configure(for course: Course) {
        nameLabel.text = course.name
        codeLabel.text = course.class_code
        enrollmentLabel.text = String(course.enrollment)
    }
}

