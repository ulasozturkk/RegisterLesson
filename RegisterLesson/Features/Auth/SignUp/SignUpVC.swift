//
//  SingUpVC.swift
//  RegisterLesson
//
//  Created by macbook pro on 7.02.2024.
//

import UIKit

class SignUpVC: UIViewController {

    var sView : SignUpView?
    
    override func loadView() {
        sView = SignUpView()
        view = sView
        navigationItem.hidesBackButton = true
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: sView!.backButton)
        
        sView?.backButton.addTarget(self, action: #selector(goPreviousPage), for: .touchUpInside)
    }
    @objc func goPreviousPage(){
        navigationController?.popViewController(animated: true)
    }

}
