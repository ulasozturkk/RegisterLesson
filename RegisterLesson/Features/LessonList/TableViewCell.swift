//
//  TableViewCell.swift
//  RegisterLesson
//
//  Created by macbook pro on 8.02.2024.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    
    var lessonNameLabel = CustomComponents.SemiBoldLabel(size: 20, text: "")
    var lessonGradeLabel = CustomComponents.LightLabel(size: 15, text: "")
    var stackView = UIStackView()

    public var item : Lessons! {
        didSet{
            lessonNameLabel.text = item.name
            let grade = String(item.grade)
            lessonGradeLabel.text = grade
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(lessonNameLabel)
        stackView.addArrangedSubview(lessonGradeLabel)
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.alignment = .center
        addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
