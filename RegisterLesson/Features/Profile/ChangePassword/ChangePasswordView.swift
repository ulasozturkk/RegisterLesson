
import UIKit

class ChangePasswordView: BaseView {
  var titleLabel = customLabel(text: "Reset Password", fontName: ConstantFonts.BoldItalic)
  var passwordLabel = customLabel(text: "Current Password", fontName: ConstantFonts.light)
  var passwordTextField = customTextField(placeHolderText: "Enter current password", isSecured: true)
  var newPasswordLabel = customLabel(text: "New Password", fontName: ConstantFonts.light)
  var newPasswordTextField = customTextField(placeHolderText: "Enter new password", isSecured: true)
  var confirmPasswordLabel = customLabel(text: "Confirm Password", fontName: ConstantFonts.light)
  var confirmPasswordTextField = customTextField(placeHolderText: "Confirm new password", isSecured: true)
  var saveButton = customCircularButton(title: "Save")
  
  var backButton = customIconButton(symbolName: "arrow.left")
  let sH = UIScreen.main.bounds.height
  let sW = UIScreen.main.bounds.width
  override func buildSubViews() {
    backgroundColor = .white
  
    buildTitleLabel()
    buildPasswordLabel()
    buildPasswordTextField()
    buildNewPasswordLabel()
    buildNewPasswordTextfield()
    buildConfirmPasswordLabel()
    buildConfirmPasswordTextfield()
    buildSaveButton()
    

  }
  private func buildTitleLabel(){
    addSubview(titleLabel)
    titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: sH * 0.05).isActive = true
    titleLabel.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor).isActive = true
    
  }
  private func buildPasswordLabel(){
    addSubview(passwordLabel)
    passwordLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: sH * 0.05).isActive = true
    passwordLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: sW * 0.05).isActive = true
  }
  private func buildPasswordTextField(){
    addSubview(passwordTextField)
    passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: sH * 0.02).isActive = true
    passwordTextField.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor).isActive = true
    passwordTextField.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.08).isActive = true
    passwordTextField.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.9).isActive = true
  }
  private func buildNewPasswordLabel(){
    addSubview(newPasswordLabel)
    newPasswordLabel.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: sH * 0.02).isActive = true
    newPasswordLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: sW * 0.05).isActive = true
  }
  private func buildNewPasswordTextfield(){
    addSubview(newPasswordTextField)
    newPasswordTextField.topAnchor.constraint(equalTo: newPasswordLabel.bottomAnchor, constant: sH * 0.02).isActive = true
    newPasswordTextField.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor).isActive = true
    newPasswordTextField.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.08).isActive = true
    newPasswordTextField.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.9).isActive = true
  }
  private func buildConfirmPasswordLabel(){
    addSubview(confirmPasswordLabel)
    confirmPasswordLabel.topAnchor.constraint(equalTo: newPasswordTextField.bottomAnchor, constant: sH * 0.02).isActive = true
    confirmPasswordLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: sW * 0.05).isActive = true
  }
  private func buildConfirmPasswordTextfield(){
    addSubview(confirmPasswordTextField)
    confirmPasswordTextField.topAnchor.constraint(equalTo: confirmPasswordLabel.bottomAnchor, constant: sH * 0.02).isActive = true
    confirmPasswordTextField.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor).isActive = true
    confirmPasswordTextField.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.08).isActive = true
    confirmPasswordTextField.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.9).isActive = true
  }
  private func buildSaveButton(){
    addSubview(saveButton)
    saveButton.topAnchor.constraint(equalTo: confirmPasswordTextField.bottomAnchor, constant: sH * 0.1).isActive = true
    saveButton.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor).isActive = true
    saveButton.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.08).isActive = true
    saveButton.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.9).isActive = true
  }
}
