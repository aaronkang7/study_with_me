//
//  CourseTableViewCell.swift
//  ios-frontend
//
//  Created by Aaron Kang on 11/20/21.
//

import Foundation
import UIKit
import SnapKit

class CourseTableViewCell: UITableViewCell {
    var nameLabel: UILabel!
    var codeLabel: UILabel!
    var enrollmentLabel: UILabel!
    let padding: CGFloat = 20
    let margin: CGFloat = 30
    let height: CGFloat = 20
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        nameLabel = UILabel()
        nameLabel.font = UIFont.systemFont(ofSize: 18)
        contentView.addSubview(nameLabel)
        
        codeLabel = UILabel()
        codeLabel.font = UIFont.systemFont(ofSize: 14)

        contentView.addSubview(codeLabel)
        
        enrollmentLabel = UILabel()
        enrollmentLabel.font = UIFont.systemFont(ofSize: 12)
        contentView.addSubview(enrollmentLabel)
        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints(){
        codeLabel.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().offset(margin)
            make.top.equalToSuperview().offset(padding)
        }
        
        nameLabel.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().offset(margin)
            make.top.equalTo(codeLabel.snp.top).offset(padding)
        }
        
        enrollmentLabel.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().offset(margin)
            make.top.equalTo(nameLabel.snp.top).offset(padding+5)
        }
    }
    
    func configure(for course: Course) {
        nameLabel.text = course.name
        codeLabel.text = course.class_code
        enrollmentLabel.text = "In class: \(course.enrollment)"
    }
}

