
import UIKit

class ChangePasswordView: UIView {
  var titleLabel = customLabel(text: "Reset Password", fontName: ConstantFonts.BoldItalic)
  var passwordLabel = customLabel(text: "Current Password", fontName: ConstantFonts.light)
  var passwordTextField = customTextField(placeHolderText: "Enter current password", isSecured: true)
  var newPasswordLabel = customLabel(text: "New Password", fontName: ConstantFonts.light)
  var newPasswordTextField = customTextField(placeHolderText: "Enter new password", isSecured: true)
  var confirmPasswordLabel = customLabel(text: "Confirm Password", fontName: ConstantFonts.light)
  var confirmPasswordTextField = customTextField(placeHolderText: "Confirm new password", isSecured: true)
  var saveButton = customCircularButton(title: "Save")
  
  var backButton = customIconButton(symbolName: "arrow.left")
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = .white
    addSubviews(views: [titleLabel, passwordLabel, passwordTextField, newPasswordLabel, newPasswordTextField,
                        confirmPasswordLabel, confirmPasswordTextField, saveButton])
    let sH = UIScreen.main.bounds.height
    let sW = UIScreen.main.bounds.width
    NSLayoutConstraint.activate([
      titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: sH * 0.05),
      titleLabel.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
      passwordLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: sH * 0.05),
      passwordLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: sW * 0.05),
      passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: sH * 0.02),
      passwordTextField.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
      passwordTextField.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.08),
      passwordTextField.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.9),
      newPasswordLabel.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: sH * 0.02),
      newPasswordLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: sW * 0.05),
      newPasswordTextField.topAnchor.constraint(equalTo: newPasswordLabel.bottomAnchor, constant: sH * 0.02),
      newPasswordTextField.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
      newPasswordTextField.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.08),
      newPasswordTextField.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.9),
      confirmPasswordLabel.topAnchor.constraint(equalTo: newPasswordTextField.bottomAnchor, constant: sH * 0.02),
      confirmPasswordLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: sW * 0.05),
      confirmPasswordTextField.topAnchor.constraint(equalTo: confirmPasswordLabel.bottomAnchor, constant: sH * 0.02),
      confirmPasswordTextField.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
      confirmPasswordTextField.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.08),
      confirmPasswordTextField.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.9),
      saveButton.topAnchor.constraint(equalTo: confirmPasswordTextField.bottomAnchor, constant: sH * 0.1),
      saveButton.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
      saveButton.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.08),
      saveButton.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.9)
    ])
  }
  
  @available(*, unavailable)
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
