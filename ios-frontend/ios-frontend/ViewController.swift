//
//  ViewController.swift
//  ios-frontend
//
//  Created by Aaron Kang on 11/19/21.
//

import UIKit

class ResultsVC : UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPink //for testing purposes
    }
}
// MARK: Notes
// This view controller has the elements of the searchController/SearchVC
// since it seems to work here rather than over there.

class ViewController: UITabBarController, UITabBarControllerDelegate, UISearchResultsUpdating, UISearchBarDelegate {
    
    let searchViewController = SearchVC()
    let searchVC = SearchVC()
    let coursesViewController = CoursesVC()
    let profileViewController = ProfileVC(name: "Aaron Kang", year: 2023, major: "CS", email: "uk44@cornell.edu", bio: "hello")
    let searchController = UISearchController(searchResultsController: ResultsVC())
    var titleLabel: UILabel!
    
    
    var courseCollectionView: UICollectionView!
    var courseList = [Course]() //Complete list of courses
    var courseSearch = [Course]() // Courses being searched
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        
//        titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
//        titleLabel.text = "  Search"
//        titleLabel.font = UIFont.systemFont(ofSize: 34, weight: UIFont.Weight.semibold)
//        titleLabel.textColor = .black
//        titleLabel.backgroundColor = .white
//        navigationItem.titleView = titleLabel
        title = "Search"
        navigationItem.searchController = searchController
        navigationItem.searchController?.searchBar.isHidden = false
        searchController.searchBar.delegate = self
        searchController.searchResultsUpdater = self
        
        self.tabBar.barTintColor = .white
        
        searchViewController.tabBarItem = UITabBarItem(title:"  Search", image: UIImage(systemName: "magnifyingglass"), tag: 0)
        searchViewController.title = "Hello"
        
        coursesViewController.tabBarItem = UITabBarItem(title:"  Courses", image: UIImage(systemName: "books.vertical"), tag: 1)
        coursesViewController.title = " My Courses"
        
        profileViewController.tabBarItem = UITabBarItem(title:"  Profile", image: UIImage(systemName: "person.crop.circle.fill"), tag: 2)
        
        
        let viewControllerList = [ searchViewController, coursesViewController, profileViewController ]
        
        viewControllers = viewControllerList
        
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else {
            return
        }
        let vc = searchController.searchResultsController as? ResultsVC
        vc?.view.backgroundColor = .lightGray
        print(text)
    }

    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController){
        
        if (viewController.title == "Profile"){
//            titleLabel.backgroundColor = UIColor(red: 11/255, green: 11/255, blue: 69/255, alpha: 1)
//            titleLabel.textColor = .white
//            titleLabel.text = "  Profile"
//            navigationItem.titleView
            title = "Profile"
            navigationItem.searchController?.searchBar.isHidden = true
            navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        }
        if (viewController.title == "Search") {
            title = "Search"
            navigationItem.searchController?.searchBar.isHidden = false
            navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.black]
        }
        if (viewController.title == "My Courses") {
            navigationItem.searchController?.searchBar.isHidden = true
            navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.black]
            title = viewController.title
        }
        
//        if (viewController.title == "Profile"){
//            self.searchBar.searchBar.isHidden = true
//        } else{
//            self.searchBar.searchBar.isHidden = false
//        }
    }


}

