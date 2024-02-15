


import UIKit

class customTextField: UITextField {

  override init(frame: CGRect) {
    super.init(frame: frame)
    configureTextField()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  convenience init(placeHolderText: String, isSecured: Bool) {
    self.init(frame: .zero)
    self.placeholder = placeHolderText
    self.isSecureTextEntry = isSecured
  }
  
  func configureTextField(){
    translatesAutoresizingMaskIntoConstraints = false
    font = .customScaledFont(CustomFontName: Constants.light)
    layer.cornerRadius = 30
    layer.borderWidth = 1.0
    layer.borderColor = UIColor.black.cgColor
    layer.masksToBounds = true
    textAlignment = .center
  }
  
}
