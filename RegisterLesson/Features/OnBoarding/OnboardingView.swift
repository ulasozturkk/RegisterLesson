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
    var onboardingButton = UIButton()
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(patternImage: UIImage(named: "background.jpg")!)
        onboardingTitle.text = "Register Your Lessons \n save your grades"
        onboardingTitle.font = UIFont(name: Constants.SemiBoldItalic, size: 30)
        onboardingTitle.textAlignment = .center
        onboardingTitle.textColor = .white
        onboardingTitle.numberOfLines = 3
        
        onboardingButton.setTitle("Get Started", for: .normal)
        onboardingButton.setTitleColor(.black, for: .normal)
        onboardingButton.backgroundColor = .white
        onboardingButton.layer.cornerRadius = 12
        onboardingButton.layer.borderWidth = 1
        onboardingButton.layer.borderColor = UIColor.green.cgColor
        onboardingButton.titleLabel?.font = UIFont(name: Constants.light, size: 25)
        
        
        if let iconimage = UIImage(named: "originalIcon.png") {
                    
                    iconImage.image = iconimage
            iconImage.contentMode = .scaleAspectFit
                    addSubview(iconImage)
                }
       
        addSubview(onboardingTitle)
        addSubview(onboardingButton)
        
        let screenHeight = UIScreen.main.bounds.height
        
        iconImage.translatesAutoresizingMaskIntoConstraints = false
        onboardingTitle.translatesAutoresizingMaskIntoConstraints = false
        onboardingButton.translatesAutoresizingMaskIntoConstraints = false 
        NSLayoutConstraint.activate([
            iconImage.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            iconImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            onboardingTitle.topAnchor.constraint(equalTo: iconImage.bottomAnchor, constant: screenHeight * 0.05),
            onboardingTitle.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            onboardingButton.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            onboardingButton.topAnchor.constraint(equalTo: onboardingTitle.bottomAnchor, constant: screenHeight * 0.1),
            onboardingButton.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.08),
            onboardingButton.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.8)
        ])
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
