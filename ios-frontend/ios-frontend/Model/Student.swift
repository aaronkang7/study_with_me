//
//  Student.swift
//  ios-frontend
//
//  Created by Aaron Kang on 11/19/21.
//

import Foundation
import UIKit

//MARK: Not sure what JSON looks like
struct StudentResponse: Codable {
    var data: Student
}

struct StudentsResponse: Codable {
    var data: [Student]
}

class Student: Codable {
    var id: Int
    var name: String
    var email: String
    var year: Int
    var major: String
    var bio: String
    
    
    init(id: Int, name: String, email: String, year: Int, major: String, bio: String) {
        self.id = id
        self.name = name
        self.email = email
        self.year = year
        self.major = major
        self.bio = bio
    }
}


