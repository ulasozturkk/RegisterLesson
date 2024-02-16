
import UIKit

class SignUpView: UIView {
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
    
  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = .white
        
    addSubview(titleLabel)
    addSubview(descriptionLabel)
    addSubview(usernameLabel)
    addSubview(usernameTextField)
    addSubview(passwordLabel)
    addSubview(passwordTextField)
    addSubview(confirmLabel)
    addSubview(confirmTextField)
    addSubview(signUpButton)
        
    let sH = UIScreen.main.bounds.height
    let sW = UIScreen.main.bounds.width
        
    signUpButton.translatesAutoresizingMaskIntoConstraints = false
        
    NSLayoutConstraint.activate([
      titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: sH * 0.05),
      titleLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: sW * 0.05),
      descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: sH * 0.02),
      descriptionLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: sW * 0.05),
      usernameLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: sH * 0.02),
      usernameLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: sW * 0.05),
      usernameTextField.topAnchor.constraint(equalTo: usernameLabel.bottomAnchor, constant: sH * 0.01),
      usernameTextField.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.9),
      usernameTextField.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.08),
      usernameTextField.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
      passwordLabel.topAnchor.constraint(equalTo: usernameTextField.bottomAnchor, constant: sH * 0.02),
      passwordLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: sW * 0.05),
      passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: sH * 0.01),
      passwordTextField.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.9),
      passwordTextField.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.08),
      passwordTextField.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
      confirmLabel.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: sH * 0.02),
      confirmLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: sW * 0.05),
      confirmTextField.topAnchor.constraint(equalTo: confirmLabel.bottomAnchor, constant: sH * 0.01),
      confirmTextField.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.9),
      confirmTextField.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.08),
      confirmTextField.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
      signUpButton.topAnchor.constraint(equalTo: confirmTextField.bottomAnchor, constant: sH * 0.05),
      signUpButton.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
      signUpButton.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.08),
      signUpButton.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.9)
    ])
  }
    
  @available(*, unavailable)
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
