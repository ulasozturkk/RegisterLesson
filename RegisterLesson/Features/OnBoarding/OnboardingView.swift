

import UIKit

class OnboardingView: UIView {
  var iconImage = UIImageView()
  var onboardingTitle = customLabel(text: "Register Your Lessons \n save your grades", fontName: Constants.SemiBoldItalic)
  var SignInButton = customAngledButton(title: "Sign In")
  var SignUpButton = customAngledButton(title: "Sign Up")
    
  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = UIColor(patternImage: UIImage(named: "background.jpg")!)
    
    onboardingTitle.numberOfLines = 3
    onboardingTitle.textAlignment = .center
        
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
    
  @available(*, unavailable)
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
