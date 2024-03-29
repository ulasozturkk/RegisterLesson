
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

    // Daha önce aynı adı taşıyan bir ders var mı kontrol et
    if let existingLesson = currentUser.lessons?.first(where: { ($0 as? Lesson)?.name == lessonName }) as? Lesson {
      // Daha önce aynı adı taşıyan bir ders bulundu, hata mesajı göster
      showAlert(title: "ERROR", message: "Lesson with the same name already exists!")
    } else {
      // Daha önce aynı adı taşıyan bir ders bulunamadı, ekle
      let manager = DBManager.shared.persistentContainer
      let context = manager.viewContext

      let newLesson = Lesson(context: context)
      newLesson.name = lessonName
      UserManager.shared.addLessonToUser(user: SessionManager.shared.currentUser!, lesson: newLesson)

      do {
        try context.save()

        let event = Notification.Name("add")
        NotificationCenter.default.post(name: event, object: nil)

        showAlert(title: "Success", message: "Lesson Added Successfully")
        sView?.lessonTextField.text = ""
      } catch {
        // Hata durumunda geri al
        context.rollback()
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
