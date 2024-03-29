

import UIKit

class customAngledButton: UIButton {
  override init(frame: CGRect) {
    super.init(frame: frame)
    self.configureButton()
  }
  
  @available(*, unavailable)
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  convenience init(title: String, color: UIColor? = nil, titleColor: UIColor? = nil) {
    self.init(frame: .zero)
    self.setTitle(title, for: .normal)
    self.backgroundColor = color ?? .white
    self.setTitleColor(titleColor ?? .black, for: .normal)
  }
  
  func configureButton() {
    translatesAutoresizingMaskIntoConstraints = false
    setTitleColor(.black, for: .normal)
    backgroundColor = .white
    layer.cornerRadius = 12
    layer.borderWidth = 1
    layer.borderColor = UIColor.green.cgColor
    titleLabel?.font = UIFont.customScaledFont(CustomFontName: ConstantFonts.light)
    titleLabel?.adjustsFontSizeToFitWidth = true
  }
}
