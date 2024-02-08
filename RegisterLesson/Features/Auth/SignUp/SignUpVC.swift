
import UIKit
import CoreData

class SignUpVC: UIViewController {

    var sView : SignUpView?
    
    override func loadView() {
        sView = SignUpView()
        view = sView
        navigationItem.hidesBackButton = true
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: sView!.backButton)
        let gestureRec = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(gestureRec)
        
        sView?.backButton.addTarget(self, action: #selector(goPreviousPage), for: .touchUpInside)
        sView?.signUpButton.addTarget(self, action: #selector(createAccount), for: .touchUpInside)
    }
    @objc func hideKeyboard() {
        view.endEditing(true)
    }
    @objc func goPreviousPage(){
        navigationController?.popViewController(animated: true)
    }
    @objc func createAccount(){
        
        if sView?.usernameTextField.text != "" && sView?.passwordTextField.text != "" && sView?.confirmTextField.text != "" {
            if sView?.passwordTextField.text == sView?.confirmTextField.text {
                
                let appdelegate = UIApplication.shared.delegate as! AppDelegate
                let context = appdelegate.persistentContainer.viewContext
                let user = NSEntityDescription.insertNewObject(forEntityName: "User", into: context)
                
                user.setValue(sView?.usernameTextField.text, forKey: "username")
                user.setValue(sView?.passwordTextField.text, forKey: "password")
                user.setValue(UUID(), forKey: "id")
                
                do {
                    try context.save()
                    let alert = UIAlertController(title: "Success", message: "Your account created succesfully", preferredStyle: .alert)
                    let action = UIAlertAction(title: "OK", style: .cancel)
                    alert.addAction(action)
                    self.present(alert, animated: true)
                }catch{
                    print("error")
                }
                navigationController?.popViewController(animated: true)
            }else {
                let alert = UIAlertController(title: "ERROR", message: "Passwords must be same!", preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .cancel)
                alert.addAction(action)
                self.present(alert, animated: true)
            }
        }else {
            let alert = UIAlertController(title: "ERROR", message: "Username and Password cannot be empty", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .cancel)
            alert.addAction(action)
            self.present(alert, animated: true)
        }
    }

}