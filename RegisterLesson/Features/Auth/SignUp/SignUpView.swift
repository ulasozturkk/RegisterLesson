
import UIKit

class SignUpView: BaseView {
  var backButton = customIconButton(symbolName: "arrow.left")
  var titleLabel = customLabel(text: "Create Account", fontName: ConstantFonts.BoldItalic)
  var descriptionLabel = customLabel(text: "Enter Your Information", fontName: ConstantFonts.italic)
  var usernameLabel = customLabel(text: "Username", fontName: ConstantFonts.SemiBoldItalic)
  var usernameTextField = customTextField(placeHolderText: "Enter Your Username", isSecured: false)
  var passwordLabel = customLabel(text: "Password", fontName: ConstantFonts.SemiBoldItalic)
  var passwordTextField = customTextField(placeHolderText: "Enter Your Password", isSecured: true)
  var confirmLabel = customLabel(text: "Confirm Password", fontName: ConstantFonts.SemiBoldItalic)
  var confirmTextField = customTextField(placeHolderText: "Confirm Password", isSecured: true)
  var signUpButton = customCircularButton(title: "Create Account")
  let sH = UIScreen.main.bounds.height
  let sW = UIScreen.main.bounds.width

  override func buildSubViews() {
    backgroundColor = .white
    
    buildTitleLabel()
    buildDescriptionLabel()
    buildUsernameLabel()
    buildUsernameTextfield()
    buildPasswordLabel()
    buildPasswordTextField()
    buildConfirmLabel()
    buildConfirmTextField()
    buildSingUpButton()
  }
  
  private func buildTitleLabel() {
    addSubview(titleLabel)
    titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: sH * 0.05).isActive = true
    titleLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: sW * 0.05).isActive = true
  }

  private func buildDescriptionLabel() {
    addSubview(descriptionLabel)
    descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: sH * 0.02).isActive = true
    descriptionLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: sW * 0.05).isActive = true
  }

  private func buildUsernameLabel() {
    addSubview(usernameLabel)
    usernameLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: sH * 0.02).isActive = true
    usernameLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: sW * 0.05).isActive = true
  }

  private func buildUsernameTextfield() {
    addSubview(usernameTextField)
    usernameTextField.topAnchor.constraint(equalTo: usernameLabel.bottomAnchor, constant: sH * 0.01).isActive = true
    usernameTextField.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.9).isActive = true
    usernameTextField.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.08).isActive = true
    usernameTextField.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor).isActive = true
  }

  private func buildPasswordLabel() {
    addSubview(passwordLabel)
    passwordLabel.topAnchor.constraint(equalTo: usernameTextField.bottomAnchor, constant: sH * 0.02).isActive = true
    passwordLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: sW * 0.05).isActive = true
  }

  private func buildPasswordTextField() {
    addSubview(passwordTextField)
    passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: sH * 0.01).isActive = true
    passwordTextField.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.9).isActive = true
    passwordTextField.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.08).isActive = true
    passwordTextField.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor).isActive = true
  }

  private func buildConfirmLabel() {
    addSubview(confirmLabel)
    confirmLabel.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: sH * 0.02).isActive = true
    confirmLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: sW * 0.05).isActive = true
  }

  private func buildConfirmTextField() {
    addSubview(confirmTextField)
    confirmTextField.topAnchor.constraint(equalTo: confirmLabel.bottomAnchor, constant: sH * 0.01).isActive = true
    confirmTextField.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.9).isActive = true
    confirmTextField.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.08).isActive = true
    confirmTextField.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor).isActive = true
  }

  private func buildSingUpButton() {
    addSubview(signUpButton)
    signUpButton.topAnchor.constraint(equalTo: confirmTextField.bottomAnchor, constant: sH * 0.05).isActive = true
    signUpButton.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor).isActive = true
    signUpButton.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.08).isActive = true
    signUpButton.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.9).isActive = true
  }
}
