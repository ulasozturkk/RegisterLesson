//
//  ForgotPasswordVC.swift
//  RegisterLesson
//
//  Created by macbook pro on 7.02.2024.
//

import UIKit

class ForgotPasswordVC: UIViewController {

    var sView : ForgotPasswordView?
    
    override func loadView() {
        sView = ForgotPasswordView()
        view = sView
    }

}
