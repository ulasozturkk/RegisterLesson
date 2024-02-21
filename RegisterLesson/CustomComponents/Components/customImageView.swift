
import UIKit

class customImageView: UIImageView {
  override init(frame: CGRect) {
    super.init(frame: frame)
    configureImageView()
  }

  @available(*, unavailable)
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  convenience init(imagePath: String) {
    self.init(frame: .zero)
  }

  convenience init(image: UIImage) {
    self.init(frame: .zero)
    self.image = image
  }

  func configureImageView() {
    translatesAutoresizingMaskIntoConstraints = false
    layer.cornerRadius = bounds.size.width / 2
    clipsToBounds = false
    contentMode = .scaleAspectFit
    image = UIImage(named: "selectImage.jpeg")
  }
}
