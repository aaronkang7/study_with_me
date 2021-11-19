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
    var professor: String
    
    
    init(name: String, department: String, class_code: String, professor: String) {
        self.name = name
        self.class_code = class_code
        self.department = department
        self.professor = professor
        
    }
}

