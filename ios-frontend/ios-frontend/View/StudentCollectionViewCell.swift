//
//  StudentCollectionViewCell.swift
//  ios-frontend
//
//  Created by Aaron Kang on 11/23/21.
//

import Foundation
import UIKit

class StudentCollectionViewCell: UICollectionViewCell {

    var codeLabel = UILabel()
    var enrollmentLabel = UILabel()
    var deleteButton = UIButton()
    
    var profileImage = UIImageView()
    var nameLabel = UILabel()
    var yearLabel = UILabel()
    var bioLabel = UILabel()
    
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
        
        
        profileImage = UIImageView()
        profileImage.image = UIImage(systemName: "person.crop.circle.fill")
        profileImage.contentMode = .scaleAspectFill
        profileImage.layer.cornerRadius = 10;
        profileImage.clipsToBounds = true
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(profileImage)

        nameLabel.font = UIFont(name: "STHeitiTC-Light", size: 16)
        nameLabel.textColor = .black
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(nameLabel)

        yearLabel.font = UIFont(name:"SanFranciscoDisplay-Light",size: 12)
        yearLabel.textColor = .black
        yearLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(yearLabel)

        bioLabel.font = .systemFont(ofSize: 14)
        bioLabel.textColor = .black
        bioLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(bioLabel)
        

        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(for student: Student) {

        nameLabel.text = student.name
        yearLabel.text = String(student.year)
        bioLabel.text = String(student.bio)
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            profileImage.heightAnchor.constraint(equalToConstant: 20),
            profileImage.widthAnchor.constraint(equalToConstant: 20),
            profileImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            profileImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            nameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor,constant: 3),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            nameLabel.heightAnchor.constraint(lessThanOrEqualToConstant: 30)
        ])
    }

}

