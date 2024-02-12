
import CoreData
import UIKit

class SignUpVC: UIViewController {
  var sView: SignUpView?
    
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

  @objc func goPreviousPage() {
    navigationController?.popViewController(animated: true)
  }

  @objc func createAccount() {
    if sView?.usernameTextField.text != "" && sView?.passwordTextField.text != "" && sView?.confirmTextField.text != "" {
      if sView?.passwordTextField.text == sView?.confirmTextField.text {
        let manager = DBManager.shared.persistentContainer
        let context = manager.viewContext
        let user = NSEntityDescription.insertNewObject(forEntityName: "User", into: context)
                
        let fetchRequest: NSFetchRequest<User> = User.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "username == %@", (sView?.usernameTextField.text)!)
            
        do {
          let users = try context.fetch(fetchRequest)
        
          guard let user = users.first else {
            user.setValue(sView?.usernameTextField.text, forKey: "username")
            user.setValue(sView?.passwordTextField.text, forKey: "password")
            user.setValue(UUID(), forKey: "id")
            do {
              try context.save()
              let alert = UIAlertController(title: "Success", message: "Your account created succesfully", preferredStyle: .alert)
              let action = UIAlertAction(title: "OK", style: .cancel)
              alert.addAction(action)
              present(alert, animated: true)
            } catch {
              print("error")
            }
            return
          }
          let alert = UIAlertController(title: "ERROR", message: "Account Already exist", preferredStyle: .alert)
          let action = UIAlertAction(title: "OK", style: .cancel)
          alert.addAction(action)
          present(alert, animated: true)
                    
        } catch {}
        navigationController?.popViewController(animated: true)
      } else {
        let alert = UIAlertController(title: "ERROR", message: "Passwords must be same!", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel)
        alert.addAction(action)
        present(alert, animated: true)
      }
    } else {
      let alert = UIAlertController(title: "ERROR", message: "Username and Password cannot be empty", preferredStyle: .alert)
      let action = UIAlertAction(title: "OK", style: .cancel)
      alert.addAction(action)
      present(alert, animated: true)
    }
  }
}
