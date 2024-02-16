
import UIKit

class SelectImageCell: UITableViewCell {

  var avatarImage = customImageView(imagePath: "")
  var avatarNameLabel = customLabel(text: "", fontName: ConstantFonts.italic)
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    addSubview(avatarImage)
    addSubview(avatarNameLabel)
    NSLayoutConstraint.activate([
      avatarNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
      avatarNameLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
      avatarImage.topAnchor.constraint(equalTo: avatarNameLabel.bottomAnchor, constant: 20),
      avatarImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
    ])
    
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}
