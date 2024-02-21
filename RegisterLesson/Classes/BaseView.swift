

import UIKit

class BaseView: UIView {

  override init(frame: CGRect) {
    super.init(frame:frame)
    buildSubViews()
    addConstraints()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func buildSubViews(){
    fatalError("buildSubviews must be overridden")
  }
  
  func addConstraints(){
    
  }
  
}
