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
    fetchLessons()
    NotificationCenter.default.addObserver(self, selector: #selector(addedlesson), name: NSNotification.Name(rawValue: "add"), object: nil)
    NotificationCenter.default.addObserver(self, selector: #selector(emptyLesson), name: NSNotification.Name(rawValue: "empty"), object: nil)
    sView?.saveButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
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
    let appdelegate = UIApplication.shared.delegate as! AppDelegate
    let context = appdelegate.persistentContainer.viewContext
    print("Seçilen değer: \(selectedOption)")
    let fetchRequest: NSFetchRequest<Lesson> = Lesson.fetchRequest()
    fetchRequest.predicate = NSPredicate(format: "name == %@", selectedOption.name!)

    do {
      let lessons = try context.fetch(fetchRequest)
      if sView?.gradeTextField.text != "" {
        if let updateLesson = lessons.first {
          // bulundu
          if let doubleGrade = Double((sView?.gradeTextField.text)!) {
            updateLesson.grade = doubleGrade
            do {
              try context.save()
              NotificationCenter.default.post(name: NSNotification.Name(rawValue: "enter"), object: nil)
            } catch {
              print("Error saving lesson: \(error)")
            }
          } else {
            let alert = UIAlertController(title: "ERROR", message: "Grade Must be a number", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .cancel)
            alert.addAction(action)
            present(alert, animated: true)
          }
        }
      }
    } catch {
      print("Error fetching lessons: \(error)")
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
    let appdelegate = UIApplication.shared.delegate as! AppDelegate
    let context = appdelegate.persistentContainer.viewContext

    let fetchRequest: NSFetchRequest<Lesson> = Lesson.fetchRequest()
    let sortDescriptor = NSSortDescriptor(key: "name", ascending: true)
    fetchRequest.sortDescriptors = [sortDescriptor]
    do {
      let lessons = try context.fetch(fetchRequest)
      data = lessons
      isLessonEmpty()
    } catch {
      print("Error fetching lessons: \(error)")
    }
  }

  func isLessonEmpty() {
    if data.isEmpty == true {
      DispatchQueue.main.async {
        self.sView?.pickerView.isHidden = true
        self.sView?.emptyLabel.isHidden = false
        self.sView?.tableView.isHidden = true
        self.sView?.emptyTextLabel.isHidden = false
      }
    } else {
      sView?.emptyLabel.isHidden = true
      sView?.pickerView.isHidden = false
      sView?.tableView.isHidden = false
      sView?.emptyTextLabel.isHidden = true
    }
  }
}

extension GradeEntryVC: UIPickerViewDelegate, UIPickerViewDataSource, UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {}

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
    saveGrade(selectedOption)
  }
}
