//
//  SignInView.swift
//  RegisterLesson
//
//  Created by macbook pro on 7.02.2024.
//

import UIKit

class SignInView: UIView {

    
    var previousButton = CustomComponents.BackButton()
    var titleLabel = CustomComponents.BoldLabel(size: 50, text: "Sign In")
    var usernameLabel = CustomComponents.SemiBoldLabel(size: 15, text: "Username")
    var passwordLabel = CustomComponents.SemiBoldLabel(size: 15, text: "Password")
    var usernameTextField = CustomComponents.createTextField(placeholder: "Enter Your Username",isSecured: false)
    var passwordTextField = CustomComponents.createTextField(placeholder: "Enter Your Password",isSecured: true)
    var forgotPasswordLabel = UIButton()
    var loginButton = UIButton()
 //   var showPasswordButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
     //   showPasswordButton.setImage(UIImage(systemName: "eye"), for: .normal)
     //   passwordTextField.rightView = showPasswordButton
        forgotPasswordLabel.setTitle("Forgot Password?", for: .normal)
        forgotPasswordLabel.setTitleColor(.systemBlue, for: .normal)
        
        loginButton.setTitle("Sign In", for: .normal)
        loginButton.backgroundColor = .orange
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.layer.cornerRadius = 30
        
        addSubview(titleLabel)
        addSubview(usernameLabel)
        addSubview(usernameTextField)
        addSubview(passwordLabel)
        addSubview(passwordTextField)
        addSubview(forgotPasswordLabel)
        addSubview(loginButton)

        forgotPasswordLabel.translatesAutoresizingMaskIntoConstraints = false
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        
        let sH = UIScreen.main.bounds.height
        let sW = UIScreen.main.bounds.width
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: sH * 0.02),
            titleLabel.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            usernameLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: sH * 0.05),
            usernameLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: sW * 0.05),
            usernameTextField.topAnchor.constraint(equalTo: usernameLabel.bottomAnchor,constant: sH * 0.01),
            usernameTextField.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            usernameTextField.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.08),
            usernameTextField.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.9),
            passwordLabel.topAnchor.constraint(equalTo: usernameTextField.bottomAnchor, constant: sH * 0.02),
            passwordLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: sW * 0.05),
            passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor,constant: sH * 0.01),
            passwordTextField.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            passwordTextField.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.08),
            passwordTextField.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.9),
            forgotPasswordLabel.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: sH * 0.02),
            forgotPasswordLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -( sW * 0.05)),
            loginButton.topAnchor.constraint(equalTo: forgotPasswordLabel.bottomAnchor, constant: sH * 0.05),
            loginButton.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            loginButton.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.08),
            loginButton.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.9)
        ])
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
