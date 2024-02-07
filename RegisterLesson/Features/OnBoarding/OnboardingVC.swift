//
//  OnboardingVC.swift
//  RegisterLesson
//
//  Created by macbook pro on 7.02.2024.
//

import UIKit

class OnboardingVC: UIViewController {
    
    var sView : OnboardingView?

    override func loadView() {
        
        sView = OnboardingView()
        view = sView
        
        sView?.SignInButton.addTarget(self, action: #selector(signInTapped), for: .touchUpInside)
        sView?.SignUpButton.addTarget(self, action: #selector(signUpTapped), for: .touchUpInside)
        
        
    }
    
    @objc func signInTapped(){
        
    }
    
    @objc func signUpTapped(){
        
    }

}
