
import UIKit

class LessonListView: BaseView {
  var titleLabel = customLabel(text: "Lesson List", fontName: ConstantFonts.BoldItalic)
  var tableView = UITableView()
  var emptyLabel = customLabel(text: "There is no lesson", fontName: ConstantFonts.light)
  
  let sH = UIScreen.main.bounds.height
  let sW = UIScreen.main.bounds.width
  
  override func buildSubViews() {
    backgroundColor = .white

    buildTitleLabel()
    buildTableView()
    buildEmptyLabel()
  }

  private func buildTitleLabel() {
    titleLabel.textColor = .orange
    addSubview(titleLabel)
    titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
    titleLabel.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor).isActive = true
  }

  private func buildEmptyLabel() {
    addSubview(emptyLabel)
    emptyLabel.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor).isActive = true
    emptyLabel.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor).isActive = true
  }

  private func buildTableView() {
    tableView.translatesAutoresizingMaskIntoConstraints = false
    tableView.rowHeight = sH * 0.1
    addSubview(tableView)
    tableView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor).isActive = true
    tableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor).isActive = true
    tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
    tableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor).isActive = true
  }
}
