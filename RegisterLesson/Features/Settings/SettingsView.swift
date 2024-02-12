
import UIKit

class SettingsView: UIView {
  var titleLabel = CustomComponents.BoldLabel(size: 25, text: "Add Lesson")
  var descriptionLabel = CustomComponents.ItalicLabel(size: 15, text: "Enter Lesson Name")
  var lessonTextField = CustomComponents.createTextField(placeholder: "Lesson Name:", isSecured: false)
  var addButton = CustomComponents.BackButton(systemImage: "plus")

  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = .white

    addButton.translatesAutoresizingMaskIntoConstraints = false
    let sH = UIScreen.main.bounds.height
    let sW = UIScreen.main.bounds.width
    addSubview(titleLabel)
    addSubview(descriptionLabel)
    addSubview(lessonTextField)
    addSubview(addButton)
    NSLayoutConstraint.activate([
      titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
      titleLabel.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
      descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: sH * 0.05),
      descriptionLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: sW * 0.05),
      lessonTextField.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: sH * 0.02),
      lessonTextField.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
      lessonTextField.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.08),
      lessonTextField.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.9),
      addButton.topAnchor.constraint(equalTo: lessonTextField.bottomAnchor, constant: sH * 0.05),
      addButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -(sW * 0.05)),
      addButton.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.1),
      addButton.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.15),
    ])
  }

  @available(*, unavailable)
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
