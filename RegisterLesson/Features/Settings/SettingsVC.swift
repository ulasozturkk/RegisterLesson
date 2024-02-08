//
//  SettingsVC.swift
//  RegisterLesson
//
//  Created by macbook pro on 8.02.2024.
//

import UIKit

class SettingsVC: UIViewController {

    var sView : SettingsView?
    override func loadView() {
        
        sView = SettingsView()
        view = sView
    }

}
