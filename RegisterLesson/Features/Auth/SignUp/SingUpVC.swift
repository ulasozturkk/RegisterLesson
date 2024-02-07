//
//  SingUpVC.swift
//  RegisterLesson
//
//  Created by macbook pro on 7.02.2024.
//

import UIKit

class SingUpVC: UIViewController {

    var sView : SignUpView?
    
    override func loadView() {
        sView = SignUpView()
        view = sView
    }

}
