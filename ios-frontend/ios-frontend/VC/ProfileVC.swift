//
//  ProfileVC.swift
//  ios-frontend
//
//  Created by Aaron Kang on 11/19/21.
//

import Foundation
import UIKit
import SnapKit

class ProfileVC : UIViewController{
    
    var profileImage: UIImageView!
    var name: UILabel!
    var year: UILabel!
    var major: UILabel!
    var email: UILabel!
    var bio: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        self.title = "Profile"
        
        setupViews()
        setupConstraints()
    }
    
    func setupViews(){
        profileImage = UIImageView()
        profileImage.image = UIImage(systemName: "person.crop.circle.fill")
        profileImage.contentMode = .scaleAspectFill
        profileImage.clipsToBounds = true
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(profileImage)
        
        name = UILabel()
        name.text = "First Lastname"
        name.textColor = .black
        name.font = UIFont(name: "Inter-Regular", size: 24)
        name.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(name)
        
        year = UILabel()
        year.text = "Year"
        year.textColor = .black //change later
        year.font = UIFont(name: "Inter-Regular", size: 24)
        year.translatesAutoresizingMaskIntoConstraints=false
        view.addSubview(year)
        
        major = UILabel()
        major.text = "Major"
        major.textColor = .black //change later
        major.font = UIFont(name: "Inter-Regular", size: 24)
        major.translatesAutoresizingMaskIntoConstraints=false
        view.addSubview(major)
        
        email = UILabel()
        email.text = "Email"
        email.textColor = .black //change later
        email.font = UIFont(name: "Inter-Regular", size: 24)
        email.translatesAutoresizingMaskIntoConstraints=false
        view.addSubview(email)
        
        bio = UITextField()
        bio.placeholder = "Bio"
        bio.textColor = .black
        bio.font = UIFont(name: "Inter-Regular", size: 12)
        bio.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bio)
        
    }
    
    func setupConstraints(){
        
    }
}
