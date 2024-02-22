
import UIKit

class SettingsView: BaseView {
  var titleLabel = customLabel(text: "Add Lesson", fontName: ConstantFonts.BoldItalic)
  var descriptionLabel = customLabel(text: "Enter Lesson Name", fontName: ConstantFonts.italic)
  var lessonTextField = customTextField(placeHolderText: "Lesson Name", isSecured: false)
  var addButton = customIconButton(symbolName: "plus")
  let sH = UIScreen.main.bounds.height
  let sW = UIScreen.main.bounds.width
  override func buildSubViews() {
    backgroundColor = .white

    buildTitleLabel()
    buildDescriptionLabel()
    buildLessonTextfield()
    buildAddButton()
  }

  private func buildTitleLabel() {
    addSubview(titleLabel)
    titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
    titleLabel.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor).isActive = true
  }

  private func buildDescriptionLabel() {
    addSubview(descriptionLabel)
    descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: sH * 0.05).isActive = true
    descriptionLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: sW * 0.05).isActive = true
  }

  private func buildLessonTextfield() {
    addSubview(lessonTextField)
    lessonTextField.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: sH * 0.02).isActive = true
    lessonTextField.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor).isActive = true
    lessonTextField.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.08).isActive = true
    lessonTextField.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.9).isActive = true
  }

  private func buildAddButton() {
    addButton.translatesAutoresizingMaskIntoConstraints = false
    addSubview(addButton)
    addButton.topAnchor.constraint(equalTo: lessonTextField.bottomAnchor, constant: sH * 0.05).isActive = true
    addButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -(sW * 0.05)).isActive = true
    addButton.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.1).isActive = true
    addButton.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.15).isActive = true
  }
}
