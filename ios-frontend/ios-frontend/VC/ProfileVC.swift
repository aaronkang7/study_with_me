//
//  ProfileVC.swift
//  ios-frontend
//
//  Created by Aaron Kang on 11/19/21.
//

import Foundation
import UIKit
import SwiftUI
import SnapKit

class ProfileVC : UIViewController{
    
    var rectview: UIView!
    var profileImage: UIImageView!
    var name: UILabel!
    var year: UILabel!
    var major: UILabel!
    var email: UILabel!
    var bio: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 154/255, green: 203/255, blue: 255/255, alpha: 1)
        self.title = "Profile"
        
        setupViews()
        setupConstraints()
    }
    
    func setupViews(){
        
        
        let roundedRectangle = CGRect(x: 0, y: 350, width: view.safeAreaLayoutGuide.layoutFrame.width, height: view.safeAreaLayoutGuide.layoutFrame.height - 350)
        
        rectview = UIView(frame: roundedRectangle);
        rectview.backgroundColor = .white
        rectview.layer.cornerRadius = 30
        rectview.layer.borderWidth = 0.0
        rectview.layer.shadowColor = UIColor.black.cgColor
        rectview.layer.shadowOffset = CGSize(width: 0, height: 0)
        rectview.layer.shadowRadius = 10.0
        rectview.layer.shadowOpacity = 0.2
        rectview.layer.masksToBounds = false
        view.addSubview(rectview)
        
        profileImage = UIImageView()
        profileImage.image = UIImage(systemName: "person.crop.circle.fill")
        profileImage.contentMode = .scaleAspectFill
        profileImage.clipsToBounds = true
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        profileImage.layer.cornerRadius = 65
        profileImage.backgroundColor = .white
        view.addSubview(profileImage)
        
        name = UILabel()
        name.text = "AARON KANG"
        name.textColor = .black
        name.font = UIFont(name: "Helvetica-BoldOblique", size: 26)
        name.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(name)
        
        year = UILabel()
        year.text = "Year"
        year.textColor = .black //change later
        year.font = UIFont(name: "Helvetica-BoldOblique", size: 17)
        year.translatesAutoresizingMaskIntoConstraints=false
        view.addSubview(year)
        
        major = UILabel()
        major.text = "Major"
        major.textColor = .black //change later
        major.font = UIFont(name: "Helvetica-BoldOblique", size: 17)
        major.translatesAutoresizingMaskIntoConstraints=false
        view.addSubview(major)
        
        email = UILabel()
        email.text = "uk44@cornell.edu"
        email.textColor = .black //change later
        email.font = UIFont(name: "Helvetica-BoldOblique", size: 17)
        email.translatesAutoresizingMaskIntoConstraints=false
        view.addSubview(email)
        
        bio = UITextField()
        bio.placeholder = "Bio"
        bio.textColor = .black
        bio.font = UIFont(name: "Arial-ItalicMT", size: 12)
        bio.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bio)
        
    }
   // MARK: Add Profile Image and Bio Constraints
    func setupConstraints(){
        
        NSLayoutConstraint.activate([
            profileImage.centerYAnchor.constraint(equalTo: rectview.topAnchor),
            profileImage.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 35),
            profileImage.widthAnchor.constraint(equalToConstant: 130),
            profileImage.heightAnchor.constraint(equalToConstant: 130)
        ])
        
        NSLayoutConstraint.activate([
            name.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 17),
            name.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40)
        ])
        
        NSLayoutConstraint.activate([
            email.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 9),
            email.leadingAnchor.constraint(equalTo: name.leadingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            year.topAnchor.constraint(equalTo: email.bottomAnchor, constant: 9),
            year.leadingAnchor.constraint(equalTo: email.leadingAnchor)
        ])
        NSLayoutConstraint.activate([
            major.topAnchor.constraint(equalTo: email.bottomAnchor, constant: 9),
            major.leadingAnchor.constraint(equalTo: year.trailingAnchor, constant: 10)
        ])
    }
}
