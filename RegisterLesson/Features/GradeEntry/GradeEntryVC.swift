//
//  GradeEntryVC.swift
//  RegisterLesson
//
//  Created by macbook pro on 8.02.2024.
//

import UIKit

class GradeEntryVC: UIViewController {

    var sView : GradeEntryView?
    override func loadView() {
        
        sView = GradeEntryView()
        view = sView
        
    }

}
