
import Kingfisher

import UIKit

protocol ImageTransferDelegate: AnyObject {
  func sendData(data: UIImage)
}
//source 
class SelectImageVC: UIViewController {
  var sView: SelectImageView?
  var avatarPathList: [String] = AvatarPaths.avatars
  var avatarNameList: [String] = AvatarNames.avatarNames
  var avatarImageViewList: [UIImageView] = []
  var delegate: ImageTransferDelegate?
  
  override func loadView() {
    sView = SelectImageView()
    view = sView
    downloadImages()
    sView?.tableView.delegate = self
    sView?.tableView.dataSource = self
    sView?.tableView.register(SelectImageCell.self, forCellReuseIdentifier: "ProfileCell")
  }
  
  func downloadImages() {
    for (index,url) in AvatarPaths.avatarURLS.enumerated() {
      if let url = url {
        let imageView = UIImageView()
        imageView.setImage(url: url, imageName: String(index))
        self.avatarImageViewList.append(imageView)
      }
    }
    DispatchQueue.main.async {
      self.sView?.tableView.reloadData()
    }
  }
}

extension SelectImageVC: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return min(avatarNameList.count, avatarImageViewList.count)
  }
    
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = sView?.tableView.dequeueReusableCell(withIdentifier: "ProfileCell", for: indexPath) as! SelectImageCell
      
    DispatchQueue.main.async {
      cell.label = self.avatarNameList[indexPath.row]
      cell.avatarimage = self.avatarImageViewList[indexPath.row]
    }
      
    return cell
  }
    
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let selectedImage = avatarImageViewList[indexPath.row]
    delegate?.sendData(data: selectedImage.image!)
    navigationController?.popViewController(animated: true)
  }
}
