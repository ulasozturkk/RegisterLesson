
import UIKit

class SelectImageVC: UIViewController {

  var sView : SelectImageView?
  
  
  override func loadView() {
    sView = SelectImageView()
    view = sView
    
  }

}
