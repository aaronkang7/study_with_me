//
//  TabBarVC.swift
//  ios-frontend
//
//  Created by Aaron Kang on 11/19/21.
//

import UIKit

class TabBarVC: UITabBarController, UITabBarControllerDelegate {
    
    let searchViewController = SearchVC()
    let coursesViewController = CoursesVC()
    let profileViewController = ProfileVC()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        
        searchViewController.tabBarItem = UITabBarItem(title:"Search", image: UIImage(systemName: "magnifyingglass"), tag: 0)
        
        coursesViewController.tabBarItem = UITabBarItem(title:"Courses", image: UIImage(systemName: "books.vertical"), tag: 1)
        
        profileViewController.tabBarItem = UITabBarItem(title:"Profile", image: UIImage(systemName: "person.crop.circle.fill"), tag: 2)
        
        
        let viewControllerList = [ searchViewController, coursesViewController, profileViewController ]
        
        viewControllers = viewControllerList

        
    }


}

