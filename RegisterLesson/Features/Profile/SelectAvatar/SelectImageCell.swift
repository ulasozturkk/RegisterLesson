
import UIKit

class SelectImageCell: UITableViewCell {

  var avatarImage = customImageView(imagePath: "")
  var avatarNameLabel = customLabel(text: "", fontName: ConstantFonts.italic)
  
  public var image: UIImageView? {
          didSet {
              if let actualImage = image {
                avatarImage.image = actualImage.image
              }
          }
      }

      public var label: String? {
          didSet {
              avatarNameLabel.text = label
          }
      }

  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    addSubview(avatarImage)
    addSubview(avatarNameLabel)
    let sW = UIScreen.main.bounds.width
    let sH = UIScreen.main.bounds.height
    NSLayoutConstraint.activate([
      avatarNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
     
      avatarImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: sW * 0.3),
      avatarImage.topAnchor.constraint(equalTo: avatarNameLabel.bottomAnchor, constant: 20),
      avatarNameLabel.centerXAnchor.constraint(equalTo: avatarImage.centerXAnchor),
      avatarImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: 20),
      avatarImage.widthAnchor.constraint(equalToConstant: sW * 0.4), // Belirli bir genişlik
      avatarImage.heightAnchor.constraint(equalToConstant: sH * 0.2), // Belirli bir yükseklik
    ])
    
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}
