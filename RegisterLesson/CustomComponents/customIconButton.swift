

import UIKit

class customIconButton: UIButton {

  override init(frame: CGRect) {
    super.init(frame: frame)
    configureButton()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  convenience init(symbolName : String){
    self.init(frame: .zero)
    let symbolImage = UIImage(systemName: symbolName)
    setImage(symbolImage, for: .normal)
    
  }
  
  func configureButton(){
    
    frame = CGRect(x: 0, y: 0, width: 40, height: 40)
    layer.cornerRadius = bounds.size.width / 2
    clipsToBounds = true
    backgroundColor = .orange
    tintColor = .white
  }
  
}
