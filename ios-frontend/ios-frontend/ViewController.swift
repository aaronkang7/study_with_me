//
//  ViewController.swift
//  ios-frontend
//
//  Created by Aaron Kang on 11/19/21.
//

import UIKit

//class ResultsVC : UIViewController {
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = .systemPink //for testing purposes
//    }
//}



class ViewController: UITabBarController, UITabBarControllerDelegate, UISearchResultsUpdating, UISearchBarDelegate {
    
    let searchViewController = SearchVC()
    let searchVC = SearchVC()
    let coursesViewController = CoursesVC()
    let profileViewController = ProfileVC(name: "Aaron Kang", year: 2023, major: "Computer Science", email: "uk44@cornell.edu", bio: "Looking for study partners!")
    var searchController: UISearchController? = UISearchController()
    //let searchController = UISearchController(searchResultsController: ResultsVC())
    var titleLabel: UILabel!
    
    
    var courseCollectionView: UICollectionView!
    var courseList = [Course]() //Complete list of courses
    var courseSearch = [Course]() // Courses being searched
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        
        title = "Search"

        searchController?.searchBar.placeholder = "Search Courses"
        self.tabBar.barTintColor = .white

        navigationItem.searchController = searchController;
        navigationItem.hidesSearchBarWhenScrolling = false
        
        searchViewController.tabBarItem = UITabBarItem(title:"  Search", image: UIImage(systemName: "magnifyingglass"), tag: 0)
        searchViewController.title = "Hello"
        
        coursesViewController.tabBarItem = UITabBarItem(title:"  Courses", image: UIImage(systemName: "books.vertical"), tag: 1)
        coursesViewController.title = " My Courses"
        
        profileViewController.tabBarItem = UITabBarItem(title:"  Profile", image: UIImage(systemName: "person.crop.circle.fill"), tag: 2)
        
        
        let viewControllerList = [ searchViewController, coursesViewController, profileViewController ]
        
        viewControllers = viewControllerList
        
    }
    
    func updateSearchResults(for searchController: UISearchController) {
//        guard let text = searchController.searchBar.text else {
//            return
//        }
//        let vc = searchController.searchResultsController as? ResultsVC
//        vc?.view.backgroundColor = .green
//        print(text)
    }

    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController){
        
        if (viewController.title == "Profile"){
            title = "Profile"
            searchController = nil;
            navigationItem.searchController = searchController;
            navigationItem.searchController?.searchBar.isHidden = true
            navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        }
        if (viewController.title == "Search") {
            title = "Search"
            searchController = UISearchController();
            navigationItem.searchController = searchController;
            navigationItem.hidesSearchBarWhenScrolling = false
            navigationItem.searchController?.searchBar.isHidden = false
            navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.black]
        }
        if (viewController.title == "My Courses") {
            searchController = nil
            navigationItem.searchController = searchController;
            navigationItem.searchController?.searchBar.isHidden = true
            navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.black]
            title = viewController.title
        }

    }


}

