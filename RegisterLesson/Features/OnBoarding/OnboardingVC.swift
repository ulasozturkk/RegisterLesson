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
        navigationController?.pushViewController(SignInVC(), animated: true)
    }
    
    @objc func signUpTapped(){
        navigationController?.pushViewController(SignUpVC(), animated: true)
    }
}
