//
//  NetworkManager.swift
//  ios-frontend
//
//  Created by Aaron Kang on 11/24/21.
//

import Alamofire 

class NetworkManager {
    static let endpoint = ""
    
    static func getCourses() {
        AF.request(endpoint, method: .get).validate().responseJSON {
            response in
            switch response.result {
            case .success(let data):
                print(data)
            case .failure(let error):
                print(error)
            }
        }
    }
}
