

import UIKit

class customCircularButton: UIButton {

  override init(frame: CGRect) {
    super.init(frame: frame)
    configureButton()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  convenience init(title:String){
    self.init(frame: .zero)
    setTitle(title, for: .normal)
  }
  
  func configureButton(){
    translatesAutoresizingMaskIntoConstraints = false
    setTitleColor(.white, for: .normal)
    backgroundColor = .orange
    layer.cornerRadius = 30
    layer.borderWidth = 1
    layer.borderColor = UIColor.green.cgColor
    titleLabel?.font = UIFont.customScaledFont(CustomFontName: ConstantFonts.SemiBoldItalic)
    titleLabel?.adjustsFontForContentSizeCategory = true
  }
  
}
