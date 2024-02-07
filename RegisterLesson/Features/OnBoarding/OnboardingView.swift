//
//  OnboardingView.swift
//  RegisterLesson
//
//  Created by macbook pro on 7.02.2024.
//

import UIKit

class OnboardingView: UIView {
    
    var iconImage = UIImageView()
    var onboardingTitle = UILabel()
    var SignInButton = UIButton()
    var SignUpButton = UIButton()
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(patternImage: UIImage(named: "background.jpg")!)
        onboardingTitle.text = "Register Your Lessons \n save your grades"
        onboardingTitle.font = UIFont(name: Constants.SemiBoldItalic, size: 30)
        onboardingTitle.textAlignment = .center
        onboardingTitle.textColor = .white
        onboardingTitle.numberOfLines = 3
        
        SignInButton.setTitle("Sign In", for: .normal)
        SignInButton.setTitleColor(.black, for: .normal)
        SignInButton.backgroundColor = .white
        SignInButton.layer.cornerRadius = 12
        SignInButton.layer.borderWidth = 1
        SignInButton.layer.borderColor = UIColor.green.cgColor
        SignInButton.titleLabel?.font = UIFont(name: Constants.light, size: 25)
        
        SignUpButton.setTitle("Sign Up", for: .normal)
        SignUpButton.setTitleColor(.black, for: .normal)
        SignUpButton.backgroundColor = .white
        SignUpButton.layer.cornerRadius = 12
        SignUpButton.layer.borderWidth = 1
        SignUpButton.layer.borderColor = UIColor.green.cgColor
        SignUpButton.titleLabel?.font = UIFont(name: Constants.light, size: 25)
        
        
        if let iconimage = UIImage(named: "originalIcon.png") {
                    
                    iconImage.image = iconimage
            iconImage.contentMode = .scaleAspectFit
                    addSubview(iconImage)
                }
       
        addSubview(onboardingTitle)
        addSubview(SignInButton)
        addSubview(SignUpButton)
        
        let screenHeight = UIScreen.main.bounds.height
        
        iconImage.translatesAutoresizingMaskIntoConstraints = false
        onboardingTitle.translatesAutoresizingMaskIntoConstraints = false
        SignInButton.translatesAutoresizingMaskIntoConstraints = false 
        SignUpButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            iconImage.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            iconImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            onboardingTitle.topAnchor.constraint(equalTo: iconImage.bottomAnchor, constant: screenHeight * 0.05),
            onboardingTitle.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            
            SignInButton.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            SignInButton.topAnchor.constraint(equalTo: onboardingTitle.bottomAnchor, constant: screenHeight * 0.1),
            SignInButton.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.08),
            SignInButton.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.8),
            
            SignUpButton.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            SignUpButton.topAnchor.constraint(equalTo: SignInButton.bottomAnchor, constant: screenHeight * 0.02),
            SignUpButton.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.08),
            SignUpButton.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.8)
        ])
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
