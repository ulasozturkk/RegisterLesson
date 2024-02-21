import CoreData
import UIKit

class SignInVC: UIViewController {
  var sView: SignInView?

  override func loadView() {
    sView = SignInView()
    view = sView

    navigationItem.hidesBackButton = true
    navigationItem.leftBarButtonItem = UIBarButtonItem(customView: sView!.previousButton)
    isUserLoggedIn()
    checkUserData()
    sView?.previousButton.addTarget(self, action: #selector(goPrevious), for: .touchUpInside)
    sView?.loginButton.addTarget(self, action: #selector(signInButtonTapped), for: .touchUpInside)
  }

  @objc func goPrevious() {
    if let navigationController = navigationController {
      let viewControllers = navigationController.viewControllers

      if viewControllers.count >= 2 {
        let lastVcIsProfile: Bool?
        lastVcIsProfile = viewControllers.contains(where: { profilevc in
          print(profilevc)
          if profilevc.presentedViewController == self.presentedViewController {
            navigationController.pushViewController(OnboardingVC(), animated: true)
            return true
          }
          return true
        })

        if lastVcIsProfile == true {
        } else {
          navigationController.popViewController(animated: true)
        }
      } else {
        navigationController.pushViewController(OnboardingVC(), animated: true)
      }
    }
  }

  @objc func signInButtonTapped() {
    if let username = sView?.usernameTextField.text, let password = sView?.passwordTextField.text, !username.isEmpty, !password.isEmpty {
      signIn(username: username, password: password)
    } else {
      let alert = UIAlertController(title: "ERROR", message: "Username and Password cannot be empty", preferredStyle: .alert)
      let action = UIAlertAction(title: "OK", style: .cancel)
      alert.addAction(action)
      present(alert, animated: true)
    }
  }

  func signIn(username: String, password: String) {
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

        var isUserLoggedIn = true
        let isUserLoggedInData = convertBoolToData(bool: isUserLoggedIn)
        KeyChainManager.shared.saveToKeyChain(data: isUserLoggedInData, key: "isUserLoggedIn")

        var haveUserEntered = true
        let haveUserEnteredData = convertBoolToData(bool: haveUserEntered)
        KeyChainManager.shared.saveToKeyChain(data: haveUserEnteredData, key: "haveUserEntered")

        let usernameData = convertStringToData(string: username)
        if let usernameData = usernameData {
          KeyChainManager.shared.saveToKeyChain(data: usernameData, key: "username")
        }

        if let passwordData = convertStringToData(string: password) {
          KeyChainManager.shared.saveToKeyChain(data: passwordData, key: "password")
        }

        print("Giriş Başarılı")
        navigationController?.pushViewController(TabBar(), animated: true)
      } else {
        let alert = UIAlertController(title: "ERROR", message: "Invalid Password", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel)
        alert.addAction(action)
        present(alert, animated: true)
      }
    } catch {
      print("Hata")
    }
  }

  func isUserLoggedIn() {
    let userLoggedInData = KeyChainManager.shared.readDataFromKeyChain(key: "isUserLoggedIn")?.withUnsafeBytes { $0.load(as: Bool.self) }

    if userLoggedInData == true {
      let context = DBManager.shared.persistentContainer.viewContext
      let currentUserName = KeyChainManager.shared.readDataFromKeyChain(key: "username")
      if let currentUserName = currentUserName {
        let currentUserNameString = String(data: currentUserName, encoding: .utf8)
        let fetchRequset: NSFetchRequest<User> = User.fetchRequest()
        fetchRequset.predicate = NSPredicate(format: "username == %@", currentUserNameString!)
        do {
          let users = try context.fetch(fetchRequset)
          guard let user = users.first else { return }
          SessionManager.shared.loginUser(user: user)
          navigationController?.pushViewController(TabBar(), animated: true)
          let alert = UIAlertController(title: "Signed In", message: "You already signed in", preferredStyle: .alert)
          let action = UIAlertAction(title: "OK", style: .default)
          alert.addAction(action)
          present(alert, animated: true)
        } catch {}
      }
    }
  }

  func checkUserData() {
    let haveUserEntered = KeyChainManager.shared.readDataFromKeyChain(key: "haveUserEntered")
    if let haveUserEntered = haveUserEntered {
      // nil değilse datayı bool a çevir
      let haveUserEnteredBool = convertDataToBool(data: haveUserEntered)
      if haveUserEnteredBool == nil || haveUserEnteredBool == false {
        // kullanıcı daha önce sign olmamıs
      } else {
        // daha önce sign olmus
        let username = KeyChainManager.shared.readDataFromKeyChain(key: "username")
        let password = KeyChainManager.shared.readDataFromKeyChain(key: "password")
        if let username = username, let password = password {
          // username ve password dataları nil gelmediyse stringe çevir
          let usernameString = convertDataToString(data: username)
          let passwordString = convertDataToString(data: password)
          if let usernameString = usernameString, let passwordString = passwordString {
            // eğer stringe çevirebildiysen textfieldların içine at
            DispatchQueue.main.async {
              self.sView?.usernameTextField.text = usernameString
              self.sView?.passwordTextField.text = passwordString
            }
          } else {
            print("Veri dönüştürme başarısız.")
          }
        }
      }
    }
  }

  func convertDataToString(data: Data) -> String? {
    var mutabledata = data
    return String(data: mutabledata, encoding: .utf8)
  }

  func convertDataToBool(data: Data) -> Bool? {
    var mutabledata = data
    return mutabledata.withUnsafeMutableBytes { $0.load(as: Bool.self) }
  }

  func convertStringToData(string: String) -> Data? {
    return string.data(using: .utf8)
  }

  func convertBoolToData(bool: Bool) -> Data {
    var mutableBool = bool
    return withUnsafeBytes(of: &mutableBool) { Data($0) }
  }
}
