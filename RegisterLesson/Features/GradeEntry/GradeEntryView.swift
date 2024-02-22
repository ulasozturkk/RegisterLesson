
import UIKit

class GradeEntryView: BaseView {
  var pickerView = UIPickerView()
  var gradeTextField = customTextField(placeHolderText: "Enter Grade", isSecured: false)
  var lessonPickerTextfield = customTextField(placeHolderText: "Choose a Lesson", isSecured: false)
  var tableView = UITableView()
  var saveButton = customCircularButton(title: "Save")
  var titleLabel = customLabel(text: "Choose a lesson and enter grade", fontName: ConstantFonts.BoldItalic)
  var orLabel = customLabel(text: "Or Choose Here", fontName: ConstantFonts.BoldItalic)
  var emptyLabel = customLabel(text: "No lesson found", fontName: ConstantFonts.light)
  var emptyTextLabel = customLabel(text: "No lesson found", fontName: ConstantFonts.light)
  let sH = UIScreen.main.bounds.height
  let sW = UIScreen.main.bounds.width
  
  override func buildSubViews() {
    backgroundColor = .white

    buildTitleLabel()
    buildLessonPickerTextField()
    buildEmptyLabel()
    buildGradeTextfield()
    buildOrLabel()
    buildTableView()
    buildEmptyTextLabel()
    buildSaveButton()
  }

  private func buildTitleLabel() {
    addSubview(titleLabel)
    titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: sH * 0.01).isActive = true
    titleLabel.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor).isActive = true
  }

  private func buildLessonPickerTextField() {
    addSubview(lessonPickerTextfield)
    lessonPickerTextfield.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: sH * 0.01).isActive = true
    lessonPickerTextfield.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor).isActive = true
    lessonPickerTextfield.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.08).isActive = true
    lessonPickerTextfield.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.9).isActive = true
  }

  private func buildEmptyLabel() {
    addSubview(emptyLabel)
    emptyLabel.centerXAnchor.constraint(equalTo: lessonPickerTextfield.centerXAnchor).isActive = true
    emptyLabel.centerYAnchor.constraint(equalTo: lessonPickerTextfield.centerYAnchor).isActive = true
  }

  private func buildGradeTextfield() {
    addSubview(gradeTextField)
    gradeTextField.topAnchor.constraint(equalTo: lessonPickerTextfield.bottomAnchor, constant: sH * 0.1).isActive = true
    gradeTextField.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor).isActive = true
    gradeTextField.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.08).isActive = true
    gradeTextField.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.9).isActive = true
  }

  private func buildOrLabel() {
    addSubview(orLabel)
    orLabel.topAnchor.constraint(equalTo: gradeTextField.bottomAnchor, constant: sH * 0.1).isActive = true
    orLabel.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor).isActive = true
  }

  private func buildTableView() {
    tableView.translatesAutoresizingMaskIntoConstraints = false
    addSubview(tableView)
    tableView.topAnchor.constraint(equalTo: orLabel.bottomAnchor, constant: sH * 0.02).isActive = true
    tableView.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor).isActive = true
    tableView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.3).isActive = true
    tableView.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.9).isActive = true
  }

  private func buildEmptyTextLabel() {
    addSubview(emptyTextLabel)
    emptyTextLabel.centerXAnchor.constraint(equalTo: tableView.centerXAnchor).isActive = true
    emptyTextLabel.centerYAnchor.constraint(equalTo: tableView.centerYAnchor).isActive = true
  }

  private func buildSaveButton() {
    saveButton.setTitleColor(.white, for: .normal)
    saveButton.backgroundColor = .orange
    saveButton.layer.cornerRadius = 30

    addSubview(saveButton)
    saveButton.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: sH * 0.02).isActive = true
    saveButton.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor).isActive = true
    saveButton.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.08).isActive = true
    saveButton.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.9).isActive = true
  }
}
