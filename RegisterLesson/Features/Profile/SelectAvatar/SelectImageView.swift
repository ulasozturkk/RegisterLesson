

import UIKit



class SelectImageView: BaseView {
  
  var titleLabel = customLabel(text: "Choose one of these avatars", fontName: ConstantFonts.SemiBoldItalic)
  var tableView = UITableView()
  let sH = UIScreen.main.bounds.height
  override func buildSubViews() {
    backgroundColor = .white
    buildTitleLabel()
    buildTableView()

  }
  
  private func buildTitleLabel(){
    addSubview(titleLabel)
    titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: sH * 0.05).isActive = true
    titleLabel.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor).isActive = true
  }
  private func buildTableView(){
    tableView.translatesAutoresizingMaskIntoConstraints = false
    tableView.rowHeight = UIScreen.main.bounds.height / 3
    addSubview(tableView)
    tableView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,constant: sH * 0.05).isActive = true
    tableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor).isActive = true
    tableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor).isActive = true
    tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
    
  }
  
}
