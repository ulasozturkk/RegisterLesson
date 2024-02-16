

import CoreData
import UIKit

class TableViewCell: UITableViewCell {
  var lessonNameLabel = customLabel(text: "", fontName: ConstantFonts.SemiBoldItalic)
  var lessonGradeLabel = customLabel(text: "", fontName: ConstantFonts.light)
  var stackView = UIStackView()

  public var item: Lesson! {
    didSet {
      lessonNameLabel.text = item.name
      let grade = String(item.grade)
      lessonGradeLabel.text = grade
    }
  }

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    addSubview(lessonNameLabel)
    addSubview(lessonGradeLabel)

    NSLayoutConstraint.activate([
      lessonNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
      lessonNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
      lessonGradeLabel.topAnchor.constraint(equalTo: lessonNameLabel.bottomAnchor, constant: 20),
      lessonGradeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20)
    ])
  }

  @available(*, unavailable)
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
