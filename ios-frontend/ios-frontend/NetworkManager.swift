//
//  NetworkManager.swift
//  ios-frontend
//
//  Created by Aaron Kang on 11/24/21.
//

import Alamofire 

class NetworkManager {
    static let endpoint = "https://studywithmebackend.herokuapp.com"
    
    //MARK: Get Course
    static func getCourses(completion: @escaping ([Course]) -> Void) {
//        AF.request(endpoint, method: .get).validate().responseJSON { response in
//            switch response.result {
//            case .success(let data):
//                let jsonDecoder = JSONDecoder()
//                jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
//                if let courseResponse = try? jsonDecoder.decode(courseResponse.self, from: data) {
//                    let courses = courseResponse.data
//                    completion(courses)
//                }
//            case .failure(let error):
//                print(error)
//            }
//        }
    }
//    //MARK: Get Course (ID)
//    static func getCourseById(id: Int, completion: @escaping (Course) -> Void) {
//        AF.request("\(endpoint)/api/courses/\(id)/", method: .get).validate().responseData {
//            response in
//            switch response.result {
//            case .success(let data):
//                let jsonDecoder = JSONDecoder()
//                jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
//                if let courseResponse = try?
//                    jsonDecoder.decode(CourseResponse.self, from: data) {
//                    let course = courseResponse.data
//                    print(course)
//                    completion(course)
//                }
//            case .failure(let error):
//                print(error)
//            }
//        }
//    }
//    //MARK: Add Course
//    static func addCourse(code: String, name: String, completion: @escaping (Course) -> Void) {
//        let parameters: [String: String] = [
//            "code": code,
//            "name": name
//        ]
//
//    }
//    var id: Int
//    var name: String
//    var class_code: String
//    var department: String
//    var enrollment: Int
//    var professor: String
    
    
}
