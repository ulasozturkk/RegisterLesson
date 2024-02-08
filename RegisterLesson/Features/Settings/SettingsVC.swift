//
//  SettingsVC.swift
//  RegisterLesson
//
//  Created by macbook pro on 8.02.2024.
//

import UIKit
import CoreData

class SettingsVC: UIViewController {

    var sView : SettingsView?
    override func loadView() {
        
        sView = SettingsView()
        view = sView
        sView?.addButton.addTarget(self, action: #selector(addLesson), for: .touchUpInside)
    }
    
    @objc func addLesson(){
        if sView?.lessonTextField.text != "" {
            let appdelegate = UIApplication.shared.delegate as! AppDelegate
            let context = appdelegate.persistentContainer.viewContext
            let lesson = NSEntityDescription.insertNewObject(forEntityName: "Lesson", into: context)
            
            let fetchRequest: NSFetchRequest<Lesson> = Lesson.fetchRequest()
            fetchRequest.predicate = NSPredicate(format: "name == %@", (sView?.lessonTextField.text)!)
            
            do{
                let lessons = try context.fetch(fetchRequest)
                guard let ls = lessons.first else {
                    do{
                        lesson.setValue(sView?.lessonTextField.text, forKey: "name")
                        try context.save()
                        sView?.lessonTextField.text = ""
                        let alert = UIAlertController(title: "Success", message: "Lesson saved succesfully!", preferredStyle: .alert)
                        let action = UIAlertAction(title: "OK", style: .cancel)
                        alert.addAction(action)
                        self.present(alert,animated: true)
                    }catch{
                        print("error")
                    }
                    return
                }
                let alert = UIAlertController(title: "ERROR", message: "Lesson already exist", preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .cancel)
                alert.addAction(action)
                self.present(alert,animated: true)
            }catch{
                
            }
        }else {
            let alert = UIAlertController(title: "ERROR", message: "Lesson name cannot be empty!", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .cancel)
            alert.addAction(action)
            self.present(alert,animated: true)
        }
    }
}
