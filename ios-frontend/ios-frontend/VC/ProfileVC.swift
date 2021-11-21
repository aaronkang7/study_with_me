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
    
    var profileImage: UIImage!
    var name: UILabel!
    var bio: UILabel!
    var email: UILabel!
    var year: UILabel!
    var major: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .blue
        self.title = "Profile"
        
        setupViews()
        setupConstraints()
    }
    
    func setupViews(){
        profileImage = UIImage(systemName: "person.crop.circle.fill")
        
    }
    
    func setupConstraints(){
        
    }
}
