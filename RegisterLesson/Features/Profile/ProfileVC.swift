
import UIKit
import SDWebImage

class ProfileVC: UIViewController , ImageTransferDelegate {
  
  var sView: ProfileView?
  var imageData : UIImage?
  override func loadView() {
    sView = ProfileView()
    view = sView
    isDataExist()
    sView?.saveButton.addTarget(self, action: #selector(saveData), for: .touchUpInside)
    
  }
  
  @objc func saveData(){
    if imageData != nil && sView?.enterCommentTextfield.text != "" {
      let context = DBManager.shared.persistentContainer.viewContext
      guard let imageBinary = imageData?.jpegData(compressionQuality: 0.5) else{
        return
      }
      if let currentUser = SessionManager.shared.currentUser {
        currentUser.avatar = imageBinary
        currentUser.comment = sView?.enterCommentTextfield.text
        try! context.save()
        
        isDataExist()
      }
    }else{
      let alert = UIAlertController(title: "Error", message: "avatar and comment must not be empty!", preferredStyle: .alert)
      let action = UIAlertAction(title: "OK", style: .cancel)
      alert.addAction(action)
      self.present(alert,animated: true)
    }
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
            self.imageData = UIImage(data: currentUser.avatar!)
            self.sView?.selectImage.image = self.imageData
            self.sView?.enteredTextLabel.text = currentUser.comment
            self.sView?.selectImageLabel.isHidden = true
            self.sView?.enterLabel.isHidden = true
            self.sView?.enterCommentTextfield.isHidden = true
            self.sView?.saveButton.isHidden = true
            self.sView?.selectImage.isHidden = false
            self.sView?.avatarLabel.isHidden = false
            self.sView?.commentLabel.isHidden = false
            self.sView?.enteredTextLabel.isHidden = false

            
          }
        }
      }
    }
    func sendData(data: UIImage) {
      print("senddata çalıştı")
      DispatchQueue.main.async {
        self.sView?.selectImage.image = data
        self.imageData = data
      }
    }
    
    
    @objc func pickImage(){
      let selectImageVC = SelectImageVC()
      selectImageVC.delegate = self
      navigationController?.pushViewController(selectImageVC, animated: true)
    }
  }
  

