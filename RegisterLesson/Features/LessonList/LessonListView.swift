//
//  LessonListView.swift
//  RegisterLesson
//
//  Created by macbook pro on 8.02.2024.
//

import UIKit

class LessonListView: UIView {
  var titleLabel = CustomComponents.BoldLabel(size: 30, text: "Lesson List")
  var tableView = UITableView()
  var emptyLabel = CustomComponents.LightLabel(size: 30, text: "There is no lesson")

  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = .white

    titleLabel.textColor = .orange
    tableView.translatesAutoresizingMaskIntoConstraints = false
    let sH = UIScreen.main.bounds.height
    let sW = UIScreen.main.bounds.width
    tableView.rowHeight = sH * 0.1
    addSubview(titleLabel)
    addSubview(emptyLabel)
    addSubview(tableView)
    NSLayoutConstraint.activate([
      titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
      titleLabel.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
      tableView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
      tableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
      tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
      tableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
      emptyLabel.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
      emptyLabel.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor)
    ])
  }

  @available(*, unavailable)
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
