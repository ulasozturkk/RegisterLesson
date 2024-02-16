
import UIKit
import SDWebImage

class ProfileVC: UIViewController {
  var sView: ProfileView?
  override func loadView() {
    sView = ProfileView()
    view = sView
    isDataExist()
    
    
  }
  
  func isDataExist() {
    if let currentUser = SessionManager.shared.currentUser {
      if currentUser.avatar == nil && currentUser.comment == nil {
        DispatchQueue.main.async {
          self.sView?.avatarLabel.isHidden = true
          self.sView?.commentLabel.isHidden = true
          self.sView?.enteredTextLabel.isHidden = true
          self.sView?.selectImage.isUserInteractionEnabled = true
          let gestureRec = UITapGestureRecognizer(target: self, action: #selector(self.pickImage))
          self.sView?.selectImage.addGestureRecognizer(gestureRec)
          
        }
      } else {
        DispatchQueue.main.async {
          self.sView?.selectImageLabel.isHidden = true
          self.sView?.selectImage.isHidden = true
          self.sView?.enterLabel.isHidden = true
          self.sView?.enterCommentTextfield.isHidden = true
          self.sView?.saveButton.isHidden = true
        }
      }
    }
  }
  
  @objc func pickImage(){
    print("a")
  }
}

// TO DO:
// burada userı çek image datası var mı bak, yoksa selectedlerı hidden yap varsa diğerlerini hidden yap
// image pickera tıkladığımızda bir 
