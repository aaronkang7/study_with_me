//
//  StudentsVC.swift
//  ios-frontend
//
//  Created by Aaron Kang on 11/23/21.
//

import Foundation
import UIKit
import SnapKit

protocol StudentCellDelegate {
    func handleAlert(input :UIAlertController);
}

class StudentsVC : UIViewController {
    //var courseTableView: UITableView!
    var studentsCollectionView: UICollectionView!
    var studentsData: [Student] = []
    
    let reuseIdentifier = "studentCellReuse"
    let cellHeight: CGFloat = 110
    var students: [Student]!
    
    let headerReuseIdentifier = "headerReuseIdentifier"
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Students"
        navigationItem.largeTitleDisplayMode = .never
        view.backgroundColor = .white
        
        getUsers()
        students = [Student(id: 0, name: "Aaron", email: "uk44@cornell.edu", year: 2023, major: "Computer Science", bio: "Looking for study partners!"), Student(id: 1, name: "Alexia", email: "aa862@cornell.edu", year: 2025, major: "Computer Scicence", bio: "Please be my study partner!"), Student(id: 3, name: "Ben", email: "bnw36@cornell.edu", year: 2024, major: "Economics and Computer Science", bio: "Contact me!"), Student(id: 4, name: "Ethan", email: "ecm237@cornell.edu", year: 2024, major: "Statistics and Computer Science", bio: "Let's study!")]
        setupViews()
        setupConstraints()
    }
    
    //MARK: Getting Users
    func getUsers() {
        NetworkManager.getUsers { students in
            self.students = students
            DispatchQueue.main.async {
                self.studentsCollectionView.reloadData()
            }
        }
    }
    
    
    func getUsersById() {
//        NetworkManager.getUserById(id: Student.id) { student in
//            let student = self.students[id]
//            DispatchQueue.main.async {
//
//            }
//        }
    }
    
    func setupViews(){
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 30
        layout.minimumInteritemSpacing = 10
        layout.sectionInset = UIEdgeInsets(top: 10, left: 5, bottom: 10, right: 5)
        
        studentsCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        studentsCollectionView.backgroundColor = .clear
        studentsCollectionView.translatesAutoresizingMaskIntoConstraints = false
        studentsCollectionView.register(StudentCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        studentsCollectionView.dataSource = self
        studentsCollectionView.delegate = self
        studentsCollectionView.register(HeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerReuseIdentifier)
        view.addSubview(studentsCollectionView)
        
        
    }
    
    func setupConstraints(){
        
        NSLayoutConstraint.activate([
            studentsCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            studentsCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            studentsCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            studentsCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        
}


}
extension StudentsVC: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
 
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return students.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = studentsCollectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! StudentCollectionViewCell
        let student = students[indexPath.item]
        cell.configure(for: student)
        cell.delegate = self
        return cell
    }
    
}

extension StudentsVC: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let numItemsPerRow: CGFloat = 1.0
        let size = (collectionView.frame.width - 10) / numItemsPerRow
        return CGSize(width: size-20, height: size / 2 - 80)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = studentsCollectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        let student = students[indexPath.item]
        let viewController = ProfileVC(name: student.name, year: student.year, major: student.major, email: student.email, bio: student.bio)
        present(viewController, animated: true)
        
    }
    
}

extension StudentsVC: StudentCellDelegate{
    func handleAlert(input: UIAlertController) {
        present(input, animated: true)
    }
}

