

import UIKit

class ChangePasswordVC: UIViewController {

  var sView : ChangePasswordView?
  override func loadView() {
    sView = ChangePasswordView()
    view = sView
    navigationItem.hidesBackButton = true
    navigationItem.leftBarButtonItem = UIBarButtonItem(customView: sView!.backButton)
    sView?.backButton.addTarget(self, action: #selector(goBack), for: .touchUpInside)
    sView?.saveButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
    let gestureRec = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
    view.addGestureRecognizer(gestureRec)
  }
  @objc func goBack(){
    navigationController?.popViewController(animated: true)
  }
  @objc func hideKeyboard(){
    view.endEditing(true)
  }
  @objc func saveButtonTapped(){
    if sView?.passwordTextField.text != "" && sView?.newPasswordTextField.text != "" && sView?.confirmPasswordTextField.text != "" {
      
      if sView?.newPasswordTextField.text == sView?.confirmPasswordTextField.text{
        changePassword()
      }else {
        let alert = customAlert(title: "Error", message: "Passwords must be same!")
        self.present(alert,animated: true)
      }
      
    }else {
      let alert = customAlert(title: "Error", message: "Inputs can not be empty!")
      self.present(alert,animated: true)
    }
  }
  
  func changePassword(){
    let currentUser = SessionManager.shared.currentUser
    let context = DBManager.shared.persistentContainer.viewContext
    if currentUser?.password == sView?.passwordTextField.text {
      currentUser?.password = sView?.confirmPasswordTextField.text
      
    
        try! context.save()
      
      
      sView?.passwordTextField.text = ""
      sView?.newPasswordTextField.text = ""
      sView?.confirmPasswordTextField.text = ""
      navigationController?.popViewController(animated: true)
      let alert = customAlert(title: "Success", message: "Password resetted succesfully")
      self.present(alert,animated: true)
      
    }else {
      let alert = customAlert(title: "Error", message: "Wrong Password!")
      self.present(alert,animated: true)
    }
  }
  
  func customAlert(title: String, message : String) -> UIAlertController{
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let action = UIAlertAction(title: "OK", style: .cancel)
    alert.addAction(action)
    return alert
  }
}
