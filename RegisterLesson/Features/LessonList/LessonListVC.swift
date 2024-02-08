//
//  LessonListView.swift
//  RegisterLesson
//
//  Created by macbook pro on 8.02.2024.
//

import UIKit

class LessonListVC: UIViewController , UITableViewDelegate,UITableViewDataSource{

    var sView : LessonListView?
    var lessonList : [Lessons] = []
    
    override func loadView() {
        sView = LessonListView()
        view = sView
        
        sView?.tableView.delegate = self
        sView?.tableView.dataSource = self
        sView?.tableView.register(TableViewCell.self, forCellReuseIdentifier: "LessonCell")
        isLessonEmpty()
        }
    
    func isLessonEmpty(){
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
}
