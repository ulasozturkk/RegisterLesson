
import Kingfisher

import UIKit

protocol ImageTransferDelegate: AnyObject {
  func sendData(data: UIImage)
}

class SelectImageVC: UIViewController {
  var sView: SelectImageView?
  var avatarPathList: [String] = AvatarPaths.avatars
  var avatarNameList: [String] = AvatarNames.avatarNames
  var avatarImageList: [UIImage] = []
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
    //    for path in avatarPathList {
    //      let image = UIImageView()
    //      image.kf.setImage(with: URL(string: path))
    //      avatarImageViewList.append(image)
    //    }
    
//    for url in AvatarPaths.avatarURLS {
//      if let url = url {
//        ImageDownloader.shared.downloadImage(url: url, completion: { [weak self] image in
//          guard let self = self else { return }
//          let imageView = UIImageView()
//          imageView.image = image ?? UIImage(named: "selectImage")
//          self.avatarImageViewList.append(imageView)
//          DispatchQueue.main.async {
//            self.sView?.tableView.reloadData()
//          }
//        })
//      }
//    }
    
    for url in AvatarPaths.avatarURLS {
      if let url = url {
        ImageDownloader.shared.downloadWithAlamofire(url: url) { [weak self] image in
          guard let self = self else { return }
          let imageView = UIImageView()
          imageView.image = image ?? UIImage(named: "selectImage")
          self.avatarImageViewList.append(imageView)
          DispatchQueue.main.async {
            self.sView?.tableView.reloadData()
          }
        }
      }
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
