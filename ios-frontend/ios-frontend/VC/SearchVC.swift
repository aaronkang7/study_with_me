//
//  SearchVC.swift
//  ios-frontend
//
//  Created by Aaron Kang on 11/19/21.
//

import Foundation
import UIKit

class SearchVC : UIViewController{
    
    
    var searchController: UISearchController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .yellow
        self.title = "Search"
        
        searchController = UISearchController()
        navigationItem.searchController = searchController
        
        setupConstraints()
        
    }
    
    func setupConstraints(){

        
    }
}

