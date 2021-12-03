//
//  NetworkManager.swift
//  ios-frontend
//
//  Created by Aaron Kang on 11/24/21.
//

import Alamofire
import Foundation

class NetworkManager {
    static let endpoint = "https://hack-challenge-study-with-me.herokuapp.com"

    
    //MARK: Get Course
    static func getCourses(completion: @escaping ([Course]) -> Void) {
        AF.request("\(endpoint)/api/courses/", method: .get).validate().responseJSON { response in
            switch response.result {
            case .success(let data):
                let jsonDecoder = JSONDecoder()
                jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
                if let courseResponse = try? jsonDecoder.decode(CoursesResponse.self, from: data as! Data) {
                    let courses = courseResponse.data
                    completion(courses)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    
    // MARK: Create Course
    static func createCourse(id: Int, name: String, class_code: String, department: String, enrollment: Int, professor: String, completion: @escaping (Course) -> Void) {
        let parameters: [String: String] = [
            "id": String(id),
            "name": name,
            "class_code": class_code,
            "department": department,
            "enrollment": String(enrollment),
            "professor": professor
        ]
        
        AF.request("\(endpoint)/api/courses/", method: .post, parameters: parameters, encoding: JSONEncoding.default).validate().responseData { response in
            switch response.result {
            case .success(let data):
                let jsonDecoder = JSONDecoder()
                if let courseResponse = try? jsonDecoder.decode(CourseResponse.self, from: data) {
                    let course = courseResponse.data
                    completion(course)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    
    //MARK: Get Course (ID)
    static func getCourseById(id: Int, completion: @escaping (Course) -> Void) {
        AF.request("\(endpoint)/api/courses/\(id)/", method: .get).validate().responseData {
            response in
            switch response.result {
            case .success(let data):
                let jsonDecoder = JSONDecoder()
                jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
                if let courseResponse = try?
                    jsonDecoder.decode(CourseResponse.self, from: data) {
                    let course = courseResponse.data
                    print(course)
                    completion(course)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    
    // MARK: Delete Course
    static func deleteCourse(id: Int, completion: @escaping (Course) -> Void) {
        AF.request("\(endpoint)/api/courses/\(id)", method: .delete).validate().responseData { response in
            switch response.result {
            case .success(let data):
                let jsonDecoder = JSONDecoder()
                jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
                if let courseResponse = try? jsonDecoder.decode(CourseResponse.self, from: data) {
                    let course = courseResponse.data
                    print(course)
                    completion(course)
                }
            case .failure(let error):
                print(error)
            }
        }
    }

    
    //MARK: Get User
    static func getUser(completion: @escaping ([Student]) -> Void) {
        AF.request("\(endpoint)/api/users/", method: .get).validate().responseData { response in
            switch response.result {
            case .success(let data):
                let jsonDecoder = JSONDecoder()
                jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
                if let studentResponse = try? jsonDecoder.decode(StudentsResponse.self, from: data) {
                    let students = studentResponse.data
                    completion(students)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
  

    //MARK: Create User
    static func createUser(id: Int, name: String, email: String, year: Int, major: String, bio: String, completion: @escaping (Student) -> Void) {
        let parameters: [String: String] = [
            "id": String(id),
            "name": name,
            "email": email,
            "year": String(year),
            "major": major,
            "bio": bio
        ]
        
        AF.request("\(endpoint)/api/users/", method: .post, parameters: parameters, encoding: JSONEncoding.default).validate().responseData { response in
            switch response.result {
            case .success(let data):
                let jsonDecoder = JSONDecoder()
                if let studentResponse = try? jsonDecoder.decode(StudentResponse.self, from: data) {
                    let student = studentResponse.data
                    completion(student)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    
    //MARK: Get User (ID)
    static func getUserById(id: Int, completion: @escaping (Student) -> Void) {
        AF.request("\(endpoint)/api/users/\(id)/", method: .get).validate().responseData { response in
            switch response.result {
            case .success(let data):
                let jsonDecoder = JSONDecoder()
                jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
                if let studentResponse = try? jsonDecoder.decode(StudentResponse.self, from: data) {
                    let student = studentResponse.data
                    print(student)
                    completion(student)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    
    //MARK: Add User to Course (ID)
    static func addUserToCourse(courseId: Int, id: Int, name: String, email: String, year: Int, major: String, bio: String, completion: @escaping (Student) -> Void) {
        let parameters: [String: String] = [
            "id": String(id),
            "name": name,
            "email": email,
            "year": String(year),
            "major": major,
            "bio": bio
        ]
        
        AF.request("\(endpoint)/api/courses/\(courseId)/add/", method: .post, parameters: parameters, encoding: JSONEncoding.default).validate().responseData { response in
            switch response.result {
            case .success(let data):
                let jsonDecoder = JSONDecoder()
                if let studentResponse = try? jsonDecoder.decode(StudentResponse.self, from: data) {
                    let student = studentResponse.data
                    completion(student)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
