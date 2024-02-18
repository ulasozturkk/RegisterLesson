import CoreData
import UIKit

class SignInVC: UIViewController {
  var sView: SignInView?
    
  override func loadView() {
    sView = SignInView()
    view = sView
        
    navigationItem.hidesBackButton = true
    navigationItem.leftBarButtonItem = UIBarButtonItem(customView: sView!.previousButton)
    checkUserData()
    sView?.previousButton.addTarget(self, action: #selector(goPrevious), for: .touchUpInside)
    sView?.loginButton.addTarget(self, action: #selector(SignInButtonTapped), for: .touchUpInside)
  }

  @objc func goPrevious() {
    
    
    navigationController?.popViewController(animated: true)
  }

  @objc func SignInButtonTapped() {
        if sView?.usernameTextField.text != "" && sView?.passwordTextField.text != "" {
          signIn(username: (sView?.usernameTextField.text)!, password: (sView?.passwordTextField.text)!)
        }else {
          let alert = UIAlertController(title: "ERROR", message: "Username and Password cannot be empty", preferredStyle: .alert)
          let action = UIAlertAction(title: "OK", style: .cancel)
          alert.addAction(action)
          present(alert, animated: true)
        }
  }
  
  func signIn(username: String, password: String){
      let manager = DBManager.shared.persistentContainer
      let context = manager.viewContext
            
      let fetchRequest: NSFetchRequest<User> = User.fetchRequest()
      fetchRequest.predicate = NSPredicate(format: "username == %@", username)
            
      do {
        let users = try context.fetch(fetchRequest)
        guard let user = users.first else {
          let alert = UIAlertController(title: "ERROR", message: "User Not Found", preferredStyle: .alert)
          let action = UIAlertAction(title: "OK", style: .cancel)
          alert.addAction(action)
          present(alert, animated: true)
          return
        }
        if user.password == password {
          SessionManager.shared.loginUser(user: user)
          UserDefaults.standard.set(user.username, forKey: "Username")
          UserDefaults.standard.set(user.password, forKey: "Password")
          UserDefaults.standard.set(true, forKey: "isUserLoggedIn")
          UserDefaults.standard.set(true, forKey: "haveUserEntered")
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
    }
    
  func checkUserData(){
    let haveUserEntered = UserDefaults.standard.value(forKey: "haveUserEntered") as? Bool
    if haveUserEntered == true {
      let username = UserDefaults.standard.value(forKey: "Username") as? String
      let password = UserDefaults.standard.value(forKey: "Password") as? String
      DispatchQueue.main.async {
        self.sView?.usernameTextField.text = username
        self.sView?.passwordTextField.text = password
      }
    }
        
  }
  
}
