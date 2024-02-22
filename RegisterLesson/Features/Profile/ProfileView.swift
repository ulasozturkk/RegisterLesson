
import UIKit

class ProfileView: BaseView {
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
  let sH = UIScreen.main.bounds.height
  override func buildSubViews() {
    backgroundColor = .white
    
    buildSelectImageLabel()
    buildAvatarLabel()
    buildSelectImage()
    buildEnterLabel()
    buildCommentLabel()
    buildEnterCommentTextField()
    buildEnteredTextLabel()
    buildSaveButton()
    buildLogOutButton()
    buildChangePasswordButton()
    
  }

  private func buildSelectImageLabel() {
    addSubview(selectImageLabel)
    selectImageLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: sH * 0.05).isActive = true
    selectImageLabel.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor).isActive = true
  }

  private func buildAvatarLabel() {
    addSubview(avatarLabel)
    avatarLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: sH * 0.05).isActive = true
    avatarLabel.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor).isActive = true
  }

  private func buildSelectImage() {
    addSubview(selectImage)
    selectImage.topAnchor.constraint(equalTo: selectImageLabel.bottomAnchor, constant: sH * 0.05).isActive = true
    selectImage.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor).isActive = true
    selectImage.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.2).isActive = true
    selectImage.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.8).isActive = true
  }

  private func buildEnterLabel() {
    addSubview(enterLabel)
    enterLabel.topAnchor.constraint(equalTo: selectImage.bottomAnchor, constant: sH * 0.05).isActive = true
    enterLabel.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor).isActive = true
  }

  private func buildCommentLabel() {
    addSubview(commentLabel)
    commentLabel.topAnchor.constraint(equalTo: selectImage.bottomAnchor, constant: sH * 0.05).isActive = true
    commentLabel.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor).isActive = true
  }

  private func buildEnterCommentTextField() {
    addSubview(enterCommentTextfield)
    enterCommentTextfield.topAnchor.constraint(equalTo: enterLabel.bottomAnchor, constant: sH * 0.05).isActive = true
    enterCommentTextfield.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor).isActive = true
    enterCommentTextfield.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.08).isActive = true
    enterCommentTextfield.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.9).isActive = true
  }

  private func buildEnteredTextLabel() {
    addSubview(enteredTextLabel)
    enteredTextLabel.topAnchor.constraint(equalTo: enterLabel.bottomAnchor, constant: sH * 0.05).isActive = true
    enteredTextLabel.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor).isActive = true
    enteredTextLabel.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.08).isActive = true
    enteredTextLabel.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.9).isActive = true
  }

  private func buildSaveButton() {
    addSubview(saveButton)
    saveButton.topAnchor.constraint(equalTo: enterCommentTextfield.bottomAnchor, constant: sH * 0.01).isActive = true
    saveButton.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor).isActive = true
    saveButton.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.08).isActive = true
    saveButton.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.9).isActive = true
  }

  private func buildChangePasswordButton() {
    addSubview(changePasswordButton)
    changePasswordButton.bottomAnchor.constraint(equalTo: logOutButton.topAnchor, constant: -(sH * 0.02)).isActive = true
    changePasswordButton.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor).isActive = true
    changePasswordButton.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.08).isActive = true
    changePasswordButton.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.9).isActive = true
  }

  private func buildLogOutButton() {
    addSubview(logOutButton)
    logOutButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -(sH * 0.05)).isActive = true
    logOutButton.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor).isActive = true
    logOutButton.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.08).isActive = true
    logOutButton.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.9).isActive = true
  }
}
