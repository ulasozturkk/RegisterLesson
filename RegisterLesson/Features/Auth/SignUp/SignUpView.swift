//
//  SignUpView.swift
//  RegisterLesson
//
//  Created by macbook pro on 7.02.2024.
//

import UIKit

class SignUpView: UIView {
  var backButton = CustomComponents.BackButton(systemImage: "arrow.left")
  var titleLabel = CustomComponents.BoldLabel(size: 30, text: "Create Account")
  var descriptionLabel = CustomComponents.ItalicLabel(size: 20, text: "Enter Your Information")
  var usernameLabel = CustomComponents.SemiBoldLabel(size: 15, text: "Username")
  var usernameTextField = CustomComponents.createTextField(placeholder: "Enter Your Username", isSecured: false)
  var passwordLabel = CustomComponents.SemiBoldLabel(size: 15, text: "Password")
  var passwordTextField = CustomComponents.createTextField(placeholder: "Enter Password", isSecured: true)
  var confirmLabel = CustomComponents.SemiBoldLabel(size: 15, text: "Confirm Password")
  var confirmTextField = CustomComponents.createTextField(placeholder: "Enter Password Again", isSecured: true)
  var signUpButton = UIButton()
    
  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = .white
        
    signUpButton.setTitle("Create Account", for: .normal)
    signUpButton.backgroundColor = .orange
    signUpButton.setTitleColor(.white, for: .normal)
    signUpButton.layer.cornerRadius = 30
        
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
