

import UIKit

class SelectImageView: UIView {
  
  var titleLabel = customLabel(text: "Choose one of these avatars", fontName: ConstantFonts.SemiBoldItalic)
  var tableView = UITableView()

  override init(frame: CGRect) {
    super.init(frame: frame)
    addSubview(tableView)
    
    let sH = UIScreen.main.bounds.height
    NSLayoutConstraint.activate([
      titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: sH * 0.05),
      titleLabel.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
      tableView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,constant: sH * 0.05),
      tableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
      tableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
      tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
    ])
    
    
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}
