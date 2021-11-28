//
//  StudentCollectionViewCell.swift
//  ios-frontend
//
//  Created by Aaron Kang on 11/23/21.
//

import Foundation
import UIKit

class StudentCollectionViewCell: UICollectionViewCell {
    
    var delegate: StudentCellDelegate?
    
    var profileImage = UIImageView()
    var nameLabel = UILabel()
//    var yearLabel = UILabel()
    var bioLabel = UILabel()
    var alertButton = UIButton();
    var alertPerson: UIAlertController!
    
    let padding: CGFloat = 25
    let margin: CGFloat = 30
    let height: CGFloat = 20

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        alertPerson = UIAlertController(title: "Notify \(String(nameLabel.text ?? "this person"))?", message: nil, preferredStyle: .alert);

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

        nameLabel.font = UIFont.systemFont(ofSize: 24, weight: UIFont.Weight.regular)
        nameLabel.textColor = .black
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(nameLabel)

//        yearLabel.font = UIFont(name:"SanFranciscoDisplay-Light",size: 12)
//        yearLabel.textColor = .black
//        yearLabel.translatesAutoresizingMaskIntoConstraints = false
//        contentView.addSubview(yearLabel)

        bioLabel.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.light)
        bioLabel.textColor = .black
        bioLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(bioLabel)
        
        alertButton.setImage(UIImage(systemName: "bell"), for: .normal)
        alertButton.tintColor = .systemYellow
        alertButton.layer.cornerRadius = 10
        alertButton.translatesAutoresizingMaskIntoConstraints = false
        alertButton.addTarget(self, action: #selector(alertButtonTapped), for: .touchUpInside)
        contentView.addSubview(alertButton)
        
        alertPerson.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alertPerson.addAction(UIAlertAction(title: "Notify", style: .default, handler: { (action) in
            //TODO: Replace with networking manager later
            print("done notifying");
        }))
        alertPerson.addTextField(configurationHandler: { textField in
            textField.placeholder = "What do you want to say?"
        })
        

        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(for student: Student) {

        nameLabel.text = student.name
//        yearLabel.text = String(student.year)
        bioLabel.text = String(student.bio)
    }
    
    @objc func alertButtonTapped(){
        delegate?.handleAlert(input: alertPerson)
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            profileImage.heightAnchor.constraint(equalToConstant: 55),
            profileImage.widthAnchor.constraint(equalToConstant: 55),
            profileImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            profileImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            nameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor,constant: -10),
            nameLabel.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: 13),
            nameLabel.heightAnchor.constraint(lessThanOrEqualToConstant: 30)
        ])
        
        NSLayoutConstraint.activate([
            bioLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor,constant: 13),
            bioLabel.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: 13),
            bioLabel.heightAnchor.constraint(lessThanOrEqualToConstant: 30)
        ])
        
        NSLayoutConstraint.activate([
            alertButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -padding),
            alertButton.topAnchor.constraint(equalTo: contentView.topAnchor,constant: padding)
        ])
    }

}

