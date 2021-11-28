//
//  ViewController.swift
//  ios-frontend
//
//  Created by Aaron Kang on 11/19/21.
//

import UIKit

class ViewController: UITabBarController, UITabBarControllerDelegate {
    
    let searchViewController = SearchVC()
    let coursesViewController = CoursesVC()
    let profileViewController = ProfileVC(name: "Aaron Kang", year: 2023, major: "CS", email: "uk44@cornell.edu", bio: "hello")
    var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        
        titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        titleLabel.text = "Search"
        titleLabel.font = UIFont.systemFont(ofSize: 34, weight: UIFont.Weight.semibold)
        titleLabel.textColor = .black
        titleLabel.backgroundColor = .white
        navigationItem.titleView = titleLabel
        
        
        
        self.tabBar.barTintColor = .white
        
        searchViewController.tabBarItem = UITabBarItem(title:"Search", image: UIImage(systemName: "magnifyingglass"), tag: 0)
        searchViewController.title = "Hello"
        
        coursesViewController.tabBarItem = UITabBarItem(title:"Courses", image: UIImage(systemName: "books.vertical"), tag: 1)
        coursesViewController.title = "My Courses"
        
        profileViewController.tabBarItem = UITabBarItem(title:"Profile", image: UIImage(systemName: "person.crop.circle.fill"), tag: 2)
        
        
        let viewControllerList = [ searchViewController, coursesViewController, profileViewController ]
        
        viewControllers = viewControllerList
        
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController){
        if (viewController.title == "Profile"){
            titleLabel.backgroundColor = UIColor(red: 11/255, green: 11/255, blue: 69/255, alpha: 1)
            titleLabel.textColor = .white
            titleLabel.text = "Profile"
        } else{
            titleLabel.text = viewController.title
            titleLabel.backgroundColor = .white
            titleLabel.textColor = .black
        }
    }


}

