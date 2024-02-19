import CoreData
import UIKit

class GradeEntryVC: UIViewController {
  var data: [Lesson] = []
  var sView: GradeEntryView?

  override func loadView() {
    sView = GradeEntryView()
    view = sView
    sView?.tableView.delegate = self
    sView?.tableView.dataSource = self
    sView?.pickerView.delegate = self
    sView?.pickerView.dataSource = self
    sView?.lessonPickerTextfield.inputView = sView?.pickerView
    fetchLessons()
    NotificationCenter.default.addObserver(self, selector: #selector(addedlesson), name: NSNotification.Name(rawValue: "add"), object: nil)
    NotificationCenter.default.addObserver(self, selector: #selector(emptyLesson), name: NSNotification.Name(rawValue: "empty"), object: nil)
    sView?.saveButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
    let gestureRec = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
    view.addGestureRecognizer(gestureRec)
  }

  @objc func hideKeyboard() {
    view.endEditing(true)
  }

  @objc func saveButtonTapped() {
    let selectedRow = sView?.pickerView.selectedRow(inComponent: 0)
    guard let selectedRow = selectedRow, selectedRow < data.count else {
      return
    }
    let selectedOption = data[selectedRow]
    if sView?.gradeTextField.text != "" {
      saveGrade(selectedOption)
    } else {
      let alert = UIAlertController(title: "ERROR", message: "Please enter a grade", preferredStyle: .alert)
      let action = UIAlertAction(title: "OK", style: .cancel)
      alert.addAction(action)
      present(alert, animated: true)
    }
    sView?.gradeTextField.text = ""
  }

  func saveGrade(_ selectedOption: Lesson) {
    let manager = DBManager.shared.persistentContainer
    let context = manager.viewContext
    print("Seçilen değer: \(selectedOption)")

    if let currentUser = SessionManager.shared.currentUser {
      if let Userlessons = currentUser.lessons {
        let lessons = Array(Userlessons) as! [Lesson]
        if sView?.gradeTextField.text != "" {
          let updateLesson = selectedOption
          // bulduk
          if let doubleGrade = Double((sView?.gradeTextField.text)!) {
            updateLesson.grade = doubleGrade
            let currentTime = Date()
            let dateformatter = DateFormatter()
            dateformatter.dateFormat = "dd/MM/yyyy HH:mm"
            updateLesson.updateDate = dateformatter.string(from: currentTime)

            try! context.save()
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "enter"), object: nil)
          } else {
            let alert = UIAlertController(title: "ERROR", message: "Grade Must be a number", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .cancel)
            alert.addAction(action)
            present(alert, animated: true)
          }
        }
      }
    }
  }

  @objc func emptyLesson() {
    fetchLessons()
    DispatchQueue.main.async {
      self.sView?.pickerView.reloadAllComponents()
      self.sView?.tableView.reloadData()
    }
  }

  @objc func addedlesson() {
    DispatchQueue.main.async {
      self.fetchLessons()

      self.sView?.pickerView.reloadAllComponents()
      self.sView?.tableView.reloadData()
    }
  }

  func fetchLessons() {
    if let currentUser = SessionManager.shared.currentUser {
      if let userLessons = currentUser.lessons {
        let lessons = Array(userLessons) as! [Lesson] // nsset tipinde gelioyr onu cast ediyorum
        let sortedLessons = lessons.sorted { $0.name?.localizedCaseInsensitiveCompare($1.name ?? "") == .orderedAscending }
        data = sortedLessons

        isLessonEmpty()
      }
    }
  }

  func isLessonEmpty() {
    if data.isEmpty == true {
      DispatchQueue.main.async {
        self.sView?.lessonPickerTextfield.isHidden = true
        self.sView?.emptyLabel.isHidden = false
        self.sView?.tableView.isHidden = true
        self.sView?.emptyTextLabel.isHidden = false
      }
    } else {
      sView?.emptyLabel.isHidden = true
      sView?.lessonPickerTextfield.isHidden = false
      sView?.tableView.isHidden = false
      sView?.emptyTextLabel.isHidden = true
    }
  }
}

extension GradeEntryVC: UIPickerViewDelegate, UIPickerViewDataSource, UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    sView?.lessonPickerTextfield.text = data[indexPath.row].name
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return data.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = UITableViewCell()
    cell.textLabel?.text = data[indexPath.row].name
    return cell
  }

  func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return 1
  }

  func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    return data.count
  }

  func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    return data[row].name
  }

  func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    let selectedOption = data[row]
    sView?.lessonPickerTextfield.text = data[row].name
    sView?.resignFirstResponder()
    saveGrade(selectedOption)
  }
}
