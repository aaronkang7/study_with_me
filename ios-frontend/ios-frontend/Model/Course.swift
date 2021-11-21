//
//  Course.swift
//  ios-frontend
//
//  Created by Aaron Kang on 11/19/21.
//

import Foundation
import UIKit

class Course {
    var name: String
    var class_code: String
    var department: String
    var enrollment: Int
    var professor: String
    
    
    init(name: String, class_code: String, department: String, enrollment: Int, professor: String) {
        self.name = name
        self.class_code = class_code
        self.department = department
        self.enrollment = enrollment
        self.professor = professor
        
    }
}

