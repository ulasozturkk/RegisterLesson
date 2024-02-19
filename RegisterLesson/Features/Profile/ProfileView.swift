
import UIKit

class ProfileView: UIView {
  let selectImageLabel = customLabel(text: "Select Your Avatar!", fontName: ConstantFonts.SemiBoldItalic)
  let avatarLabel = customLabel(text: "Your Avatar", fontName: ConstantFonts.SemiBoldItalic)
  let selectImage = customImageView(frame: .zero)
  let enterLabel = customLabel(text: "Enter your comments!", fontName: ConstantFonts.SemiBoldItalic)
  let commentLabel = customLabel(text: "Your Comments:", fontName: ConstantFonts.SemiBoldItalic)
  let enterCommentTextfield = customTextField(placeHolderText: "Enter Comment", isSecured: false)
  var enteredTextLabel = customLabel(text: "", fontName: ConstantFonts.light)
  let saveButton = customCircularButton(title: "Save")
  let changePasswordButton = customAngledButton(title: "Change Password", color: .orange, titleColor: .white)
  let logOutButton = customAngledButton(title: "Log Out", color: .red, titleColor: .white)
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = .white
    
    addSubview(selectImage)
    addSubview(avatarLabel)
    addSubview(selectImageLabel)
    addSubview(enterLabel)
    addSubview(commentLabel)
    addSubview(enterCommentTextfield)
    addSubview(enteredTextLabel)
    addSubview(saveButton)
    addSubview(changePasswordButton)
    addSubview(logOutButton)
    
    let sH = UIScreen.main.bounds.height
    NSLayoutConstraint.activate([
      selectImageLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: sH * 0.05),
      selectImageLabel.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
      
      // same
      avatarLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: sH * 0.05),
      avatarLabel.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
      
      selectImage.topAnchor.constraint(equalTo: selectImageLabel.bottomAnchor, constant: sH * 0.05),
      selectImage.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
      selectImage.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.2),
      selectImage.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.8),
      
      enterLabel.topAnchor.constraint(equalTo: selectImage.bottomAnchor, constant: sH * 0.05),
      enterLabel.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
      // same
      commentLabel.topAnchor.constraint(equalTo: selectImage.bottomAnchor, constant: sH * 0.05),
      commentLabel.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
      
      enterCommentTextfield.topAnchor.constraint(equalTo: enterLabel.bottomAnchor, constant: sH * 0.05),
      enterCommentTextfield.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
      enterCommentTextfield.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.08),
      enterCommentTextfield.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.9),
      // same
      enteredTextLabel.topAnchor.constraint(equalTo: enterLabel.bottomAnchor, constant: sH * 0.05),
      enteredTextLabel.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
      enteredTextLabel.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.08),
      enteredTextLabel.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.9),
      
      saveButton.topAnchor.constraint(equalTo: enterCommentTextfield.bottomAnchor, constant: sH * 0.01),
      saveButton.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
      saveButton.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.08),
      saveButton.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.9),
      
      changePasswordButton.bottomAnchor.constraint(equalTo: logOutButton.topAnchor, constant: -(sH * 0.02)),
      changePasswordButton.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
      changePasswordButton.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.08),
      changePasswordButton.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.9),
      
      logOutButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -(sH * 0.05)),
      logOutButton.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
      logOutButton.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.08),
      logOutButton.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.9)
      
    ])
  }
  
  @available(*, unavailable)
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
