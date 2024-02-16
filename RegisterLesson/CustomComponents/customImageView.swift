
import UIKit
import SDWebImage

class customImageView: UIImageView {

  override init(frame: CGRect) {
    super.init(frame: frame)
    configureImageView()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  convenience init(imagePath:String){
    self.init(frame: .zero)
    if let url = URL(string: imagePath){
      sd_setImage(with: url) { image, error , cacheType, Url in
        if let downloadedImage = image as UIImage? {
          self.image = downloadedImage
        }
        if let error = error {
          print(error.localizedDescription)
        }
      }
    }
    

  }
  
  func configureImageView(){
    translatesAutoresizingMaskIntoConstraints = false
    layer.cornerRadius = bounds.size.width / 2
    clipsToBounds = false
    contentMode = .scaleAspectFit
    image = UIImage(named: "selectImage.jpeg")
  }

}
