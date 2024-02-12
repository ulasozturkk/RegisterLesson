import CoreData
import UIKit

class SignInVC: UIViewController {
  var sView: SignInView?
    
  override func loadView() {
    sView = SignInView()
    view = sView
        
    navigationItem.hidesBackButton = true
    navigationItem.leftBarButtonItem = UIBarButtonItem(customView: sView!.previousButton)
    sView?.previousButton.addTarget(self, action: #selector(goPrevious), for: .touchUpInside)
    sView?.loginButton.addTarget(self, action: #selector(signIn), for: .touchUpInside)
  }

  @objc func goPrevious() {
    navigationController?.popViewController(animated: true)
  }

  @objc func signIn() {
    if sView?.usernameTextField.text != "" && sView?.passwordTextField.text != "" {
      let manager = DBManager.shared.persistentContainer
      let context = manager.viewContext
            
      let fetchRequest: NSFetchRequest<User> = User.fetchRequest()
            
      fetchRequest.predicate = NSPredicate(format: "username == %@", (sView?.usernameTextField.text)!)
            
      do {
        let users = try context.fetch(fetchRequest)
                
        guard let user = users.first else {
          let alert = UIAlertController(title: "ERROR", message: "User Not Found", preferredStyle: .alert)
          let action = UIAlertAction(title: "OK", style: .cancel)
          alert.addAction(action)
          present(alert, animated: true)
          return
        }
        if user.password == sView?.passwordTextField.text! {
          SessionManager.shared.loginUser(user: user)
          print("giris basarili")
          navigationController?.pushViewController(TabBar(), animated: true)
        } else {
          let alert = UIAlertController(title: "ERROR", message: "Invalid Password", preferredStyle: .alert)
          let action = UIAlertAction(title: "OK", style: .cancel)
          alert.addAction(action)
          present(alert, animated: true)
        }
      } catch {
        print("hata")
      }
    } else {
      let alert = UIAlertController(title: "ERROR", message: "Username and Password cannot be empty", preferredStyle: .alert)
      let action = UIAlertAction(title: "OK", style: .cancel)
      alert.addAction(action)
      present(alert, animated: true)
    }
  }
}
