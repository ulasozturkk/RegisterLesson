
import UIKit

class GradeEntryView: UIView {
  var pickerView = UIPickerView()
  var gradeTextField = customTextField(placeHolderText: "Enter Grade", isSecured: false)
  var lessonPickerTextfield = customTextField(placeHolderText: "Choose a Lesson", isSecured: false)
  var tableView = UITableView()
  var saveButton = customCircularButton(title: "Save")
  var titleLabel = customLabel(text: "Choose a lesson and enter grade", fontName: ConstantFonts.BoldItalic)
  var orLabel = customLabel(text: "Or Choose Here", fontName: ConstantFonts.BoldItalic)
  var emptyLabel = customLabel(text: "No lesson found", fontName: ConstantFonts.light)
  var emptyTextLabel = customLabel(text: "No lesson found", fontName: ConstantFonts.light)
    
  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = .white
        
    tableView.translatesAutoresizingMaskIntoConstraints = false
    
    saveButton.setTitleColor(.white, for: .normal)
    saveButton.backgroundColor = .orange
    saveButton.layer.cornerRadius = 30
    addSubview(lessonPickerTextfield)
    addSubview(saveButton)
    addSubview(tableView)
    addSubview(titleLabel)
    addSubview(orLabel)
    addSubview(gradeTextField)
    addSubview(emptyLabel)
    addSubview(emptyTextLabel)
    let sH = UIScreen.main.bounds.height
    let sW = UIScreen.main.bounds.width
    NSLayoutConstraint.activate([
      titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: sH * 0.01),
      titleLabel.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
      lessonPickerTextfield.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: sH * 0.01),
      lessonPickerTextfield.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
      lessonPickerTextfield.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.08),
      lessonPickerTextfield.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.9),
      gradeTextField.topAnchor.constraint(equalTo: lessonPickerTextfield.bottomAnchor, constant: sH * 0.1),
      gradeTextField.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
      gradeTextField.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.08),
      gradeTextField.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.9),
      orLabel.topAnchor.constraint(equalTo: gradeTextField.bottomAnchor, constant: sH * 0.1),
      orLabel.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
      tableView.topAnchor.constraint(equalTo: orLabel.bottomAnchor, constant: sH * 0.02),
      tableView.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
      tableView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.3),
      tableView.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.9),
      saveButton.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: sH * 0.02),
      saveButton.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
      saveButton.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.08),
      saveButton.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.9),
      emptyLabel.centerXAnchor.constraint(equalTo: lessonPickerTextfield.centerXAnchor),
      emptyLabel.centerYAnchor.constraint(equalTo: lessonPickerTextfield.centerYAnchor),
      emptyTextLabel.centerXAnchor.constraint(equalTo: tableView.centerXAnchor),
      emptyTextLabel.centerYAnchor.constraint(equalTo: tableView.centerYAnchor)
    ])
  }
    
  @available(*, unavailable)
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
