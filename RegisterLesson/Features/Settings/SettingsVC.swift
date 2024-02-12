
import CoreData
import UIKit

class SettingsVC: UIViewController {
  var sView: SettingsView?
  override func loadView() {
    print("settings")
    sView = SettingsView()
    view = sView
    sView?.addButton.addTarget(self, action: #selector(addLesson), for: .touchUpInside)
  }
  
  @objc func addLesson() {
    guard let lessonName = sView?.lessonTextField.text, !lessonName.isEmpty else {
      // Lesson adı boşsa hata mesajı göster
      showAlert(title: "ERROR", message: "Lesson name cannot be empty!")
      return
    }
    
    guard let currentUser = SessionManager.shared.currentUser else {
      // Kullanıcı oturumu açık değilse hata mesajı göster
      showAlert(title: "ERROR", message: "User not logged in!")
      return
    }
    
    if sView?.lessonTextField.text != "" {
      let manager = DBManager.shared.persistentContainer
      let context = manager.viewContext
      let currentUser = SessionManager.shared.currentUser
      
      if let currentUser = currentUser {
        if let userLesson = currentUser.lessons {
          let fetchRequest: NSFetchRequest<Lesson> = Lesson.fetchRequest()
          fetchRequest.predicate = NSPredicate(format: "name == %@", (sView?.lessonTextField.text)!)
          
          do {
            let existingLesson = try context.fetch(fetchRequest)
            
            if existingLesson.isEmpty == true {
              let newlesson = Lesson(context: context)
              newlesson.name = sView?.lessonTextField.text
              currentUser.addToLessons(newlesson)
              
              try! context.save()
              let event = Notification.Name("add")
              NotificationCenter.default.post(name: event, object: nil)
              
              showAlert(title: "Success", message: "Lesson Added Successfully")
              sView?.lessonTextField.text = ""
            }
          } catch { context.rollback() }
        }
      }
    }
    func showAlert(title: String, message: String) {
      let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
      let action = UIAlertAction(title: "OK", style: .cancel)
      alert.addAction(action)
      present(alert, animated: true)
    }
  }
}
