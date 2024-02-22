

import UIKit

class OnboardingView: BaseView {
  var iconImage = UIImageView()
  var onboardingTitle = customLabel(text: "Register Your Lessons \n save your grades", fontName: ConstantFonts.SemiBoldItalic)
  var SignInButton = customAngledButton(title: "Sign In")
  var SignUpButton = customAngledButton(title: "Sign Up")
  let sH = UIScreen.main.bounds.height
    
  override func buildSubViews() {
    backgroundColor = UIColor(patternImage: UIImage(named: "background.jpg")!)
    onboardingTitle.numberOfLines = 3
    onboardingTitle.textAlignment = .center
    if let iconimage = UIImage(named: "originalIcon.png") {
          iconImage.image = iconimage
          iconImage.contentMode = .scaleAspectFit
          addSubview(iconImage)
        }
    buildIconImage()
    buildOnboardingTitle()
    buildSignInButton()
    buildSignUpButton()

  }
  
  private func buildIconImage(){
    iconImage.translatesAutoresizingMaskIntoConstraints = false
    iconImage.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor).isActive = true
    iconImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
    
  }
  private func buildOnboardingTitle(){
    onboardingTitle.translatesAutoresizingMaskIntoConstraints = false
    addSubview(onboardingTitle)
    onboardingTitle.topAnchor.constraint(equalTo: iconImage.bottomAnchor, constant: sH * 0.05).isActive = true
    onboardingTitle.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor).isActive = true
  }
  private func buildSignInButton(){
    SignInButton.translatesAutoresizingMaskIntoConstraints = false
    addSubview(SignInButton)
    SignInButton.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor).isActive = true
    SignInButton.topAnchor.constraint(equalTo: onboardingTitle.bottomAnchor, constant: sH * 0.1).isActive = true
    SignInButton.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.08).isActive = true
    SignInButton.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.8).isActive = true
  }
  private func buildSignUpButton(){
    SignUpButton.translatesAutoresizingMaskIntoConstraints = false
    addSubview(SignUpButton)
    SignUpButton.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor).isActive = true
    SignUpButton.topAnchor.constraint(equalTo: SignInButton.bottomAnchor, constant: sH * 0.02).isActive = true
    SignUpButton.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.08).isActive = true
    SignUpButton.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.8).isActive = true
    
  }
}
