
import UIKit

class customLabel: UILabel {
  override init(frame: CGRect) {
    super.init(frame: frame)
    ConfigureLabel()
  }
  
  @available(*, unavailable)
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  convenience init(text: String, fontName: String) {
    self.init(frame: .zero)
    self.text = text
    self.font = UIFont.customScaledFont(CustomFontName: fontName)
  }
  
  func ConfigureLabel() {
    translatesAutoresizingMaskIntoConstraints = false
    adjustsFontForContentSizeCategory = true
    numberOfLines = 3
  }
}
