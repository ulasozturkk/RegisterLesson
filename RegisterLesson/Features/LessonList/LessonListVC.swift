
import CoreData
import UIKit

class LessonListVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
  var sView: LessonListView?
  var lessonList: [Lesson] = []

  override func loadView() {
    sView = LessonListView()

    
    view = sView
    sView?.tableView.delegate = self
    sView?.tableView.dataSource = self
    sView?.tableView.register(TableViewCell.self, forCellReuseIdentifier: "LessonCell")
    getLessons()
    isLessonEmpty()
    NotificationCenter.default.addObserver(self, selector: #selector(addedlesson), name: NSNotification.Name(rawValue: "add"), object: nil)
    NotificationCenter.default.addObserver(self, selector: #selector(enterGrade), name: NSNotification.Name(rawValue: "enter"), object: nil)
  }

  @objc func enterGrade() {
    getLessons()
    DispatchQueue.main.async {
      self.sView?.tableView.reloadData()
      self.sView?.tableView.isHidden = false
      self.sView?.emptyLabel.isHidden = true
    }
  }

  @objc func addedlesson() {
    getLessons()
    DispatchQueue.main.async {
      self.sView?.tableView.reloadData()
      self.sView?.tableView.isHidden = false
      self.sView?.emptyLabel.isHidden = true
    }
  }

  func getLessons() {
    let manager = DBManager.shared.persistentContainer
    let context = manager.viewContext

    if let currentUser = SessionManager.shared.currentUser {
      if let userLessons = currentUser.lessons {
        let lessons = Array(userLessons) as! [Lesson]
        lessonList = lessons
      }
    }
  }

  func isLessonEmpty() {
    if lessonList.isEmpty == true {
      DispatchQueue.main.async {
        self.sView?.tableView.isHidden = true
        self.sView?.emptyLabel.isHidden = false
      }
    }
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return lessonList.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = sView?.tableView.dequeueReusableCell(withIdentifier: "LessonCell", for: indexPath) as! TableViewCell
    cell.item = lessonList[indexPath.row]
    return cell
  }

  func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
    if editingStyle == .delete {
      let manager = DBManager.shared.persistentContainer
      let context = manager.viewContext

      let DeleteLesson = lessonList[indexPath.row]
      context.delete(DeleteLesson)
      do {
        try context.save()
        lessonList.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .fade)
        NotificationCenter.default.post(name: NSNotification.Name("empty"), object: nil)
        if lessonList.count == 0 {
          isLessonEmpty()
        }
      } catch {}
    }
  }

  deinit {
    NotificationCenter.default.removeObserver(self)
  }
}
