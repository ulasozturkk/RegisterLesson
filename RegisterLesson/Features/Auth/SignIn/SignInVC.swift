//
//  SignInVC.swift
//  RegisterLesson
//
//  Created by macbook pro on 7.02.2024.
//

import UIKit

class SignInVC: UIViewController {

    var sView : SignInView?
    
    override func loadView() {
        sView = SignInView()
        view = sView
        
        navigationItem.hidesBackButton = true
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: sView!.previousButton)
        
        sView?.previousButton.addTarget(self, action: #selector(goPrevious), for: .touchUpInside)
    }
    @objc func goPrevious(){
        navigationController?.popViewController(animated: true)
    }

}
