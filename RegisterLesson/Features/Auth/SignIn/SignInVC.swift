import UIKit
import CoreData

class SignInVC: UIViewController {

    var sView : SignInView?
    
    override func loadView() {
        sView = SignInView()
        view = sView
        
        navigationItem.hidesBackButton = true
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: sView!.previousButton)
        sView?.previousButton.addTarget(self, action: #selector(goPrevious), for: .touchUpInside)
        sView?.loginButton.addTarget(self, action: #selector(signIn), for: .touchUpInside)
    }
    @objc func goPrevious(){
        navigationController?.popViewController(animated: true)
    }
    @objc func signIn(){
        
        if sView?.usernameTextField.text != "" && sView?.passwordTextField.text != "" {
            let appdelegate = UIApplication.shared.delegate as! AppDelegate
            let context = appdelegate.persistentContainer.viewContext
            
            let fetchRequest: NSFetchRequest<User> = User.fetchRequest()
            
            fetchRequest.predicate = NSPredicate(format: "username == %@", (sView?.usernameTextField.text)!)
            
            do{
                let users = try context.fetch(fetchRequest)
                
                guard let user = users.first else {
                    let alert = UIAlertController(title: "HATA", message: "Kullanıcı Bulunamadı", preferredStyle: .alert)
                    let action = UIAlertAction(title: "OK", style: .cancel)
                    alert.addAction(action)
                    self.present(alert,animated: true)
                    return
                }
                if user.password == sView?.passwordTextField.text! {
                    print("giris basarili")
                }else {
                    let alert = UIAlertController(title: "HATA", message: "Yanlış Şifre", preferredStyle: .alert)
                    let action = UIAlertAction(title: "OK", style: .cancel)
                    alert.addAction(action)
                    self.present(alert,animated: true)
                }
            }catch{
                print("hata")
            }
        }else {
            let alert = UIAlertController(title: "HATA", message: "Username ve Password Boş Olamaz!", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .cancel)
            alert.addAction(action)
            self.present(alert,animated: true)
        }
    }

}
