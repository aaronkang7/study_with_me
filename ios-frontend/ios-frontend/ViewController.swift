//
//  ViewController.swift
//  ios-frontend
//
//  Created by Aaron Kang on 11/19/21.
//

import UIKit

class ViewController: UIViewController {
    
    let tabBarViewController = TabBarVC()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        
        view.addSubview(tabBarViewController.view)

        //hello
    }


}

