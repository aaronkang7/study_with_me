//
//  Student.swift
//  ios-frontend
//
//  Created by Aaron Kang on 11/19/21.
//

import Foundation
import UIKit

class Student: Codable {
    var name: String
    var email: String
    var year: Int
    var major: String
    var bio: String
    
    
    init(name: String, email: String, year: Int, major: String, bio: String) {
        self.name = name
        self.email = email
        self.year = year
        self.major = major
        self.bio = bio
    }
}


