
import UIKit

class SignInView: BaseView {
  var previousButton = customIconButton(symbolName: "arrow.left")
  var titleLabel = customLabel(text: "Sign In", fontName: ConstantFonts.BoldItalic)
  var usernameLabel = customLabel(text: "Username", fontName: ConstantFonts.SemiBoldItalic)
  var passwordLabel = customLabel(text: "Password", fontName: ConstantFonts.SemiBoldItalic)
  var usernameTextField = customTextField(placeHolderText: "Enter Your Username", isSecured: false)
  var passwordTextField = customTextField(placeHolderText: "Enter Yout Password", isSecured: true)
  var forgotPasswordLabel = UIButton()
  var loginButton = customCircularButton(title: "Sign In")

  var showPasswordButton = UIButton()
  private let sH = UIScreen.main.bounds.height
  private let sW = UIScreen.main.bounds.width
  override func buildSubViews() {
    backgroundColor = .white
    showPasswordButton.setImage(UIImage(systemName: "eye"), for: .normal)
    passwordTextField.rightView = showPasswordButton
    forgotPasswordLabel.setTitle("Forgot Password?", for: .normal)
    forgotPasswordLabel.setTitleColor(.systemBlue, for: .normal)

    buildTitleLabel()
    buildUserNameLabel()
    buildUsernameTextfield()
    buildPasswordLabel()
    buildPasswordTextfield()
    buildForgotPasswordLabel()
    buildSignInButton()
  }

  private func buildTitleLabel() {
    addSubview(titleLabel)

    titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: sH * 0.02).isActive = true
    titleLabel.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor).isActive = true
  }

  private func buildUserNameLabel() {
    addSubview(usernameLabel)
    usernameLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: sH * 0.05).isActive = true
    usernameLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: sW * 0.05).isActive = true
  }

  private func buildUsernameTextfield() {
    addSubview(usernameTextField)
    usernameTextField.topAnchor.constraint(equalTo: usernameLabel.bottomAnchor, constant: sH * 0.01).isActive = true
    usernameTextField.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor).isActive = true
    usernameTextField.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.08).isActive = true
    usernameTextField.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.9).isActive = true
  }

  private func buildPasswordLabel() {
    addSubview(passwordLabel)
    passwordLabel.topAnchor.constraint(equalTo: usernameTextField.bottomAnchor, constant: sH * 0.02).isActive = true
    passwordLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: sW * 0.05).isActive = true
  }

  private func buildPasswordTextfield() {
    addSubview(passwordTextField)
    passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: sH * 0.01).isActive = true
    passwordTextField.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor).isActive = true
    passwordTextField.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.08).isActive = true
    passwordTextField.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.9).isActive = true
  }

  private func buildForgotPasswordLabel() {
    forgotPasswordLabel.translatesAutoresizingMaskIntoConstraints = false
    addSubview(forgotPasswordLabel)
    forgotPasswordLabel.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: sH * 0.02).isActive = true
    forgotPasswordLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -(sW * 0.05)).isActive = true
  }

  private func buildSignInButton() {
    addSubview(loginButton)
    loginButton.topAnchor.constraint(equalTo: forgotPasswordLabel.bottomAnchor, constant: sH * 0.05).isActive = true
    loginButton.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor).isActive = true
    loginButton.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.08).isActive = true
    loginButton.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.9).isActive = true
  }
}
