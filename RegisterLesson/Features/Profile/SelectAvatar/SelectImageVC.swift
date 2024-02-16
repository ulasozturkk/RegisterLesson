
import SDWebImage
import UIKit
import Kingfisher



protocol ImageTransferDelegate : AnyObject {
  func sendData(data: UIImage)
}

class SelectImageVC: UIViewController {
  var sView: SelectImageView?
  var avatarPathList: [String] = AvatarPaths.avatars
  var avatarNameList: [String] = AvatarNames.avatarNames
  var avatarImageList: [UIImageView] = []
  var delegate : ImageTransferDelegate?
  
  override func loadView() {
    sView = SelectImageView()
    view = sView
    sView?.tableView.delegate = self
    sView?.tableView.dataSource = self
    sView?.tableView.register(SelectImageCell.self, forCellReuseIdentifier: "ProfileCell")
    downloadImages()
  }
  
  func downloadImages(){
    for path in avatarPathList {
      let image = UIImageView()
      image.kf.setImage(with: URL(string: path))
      avatarImageList.append(image)
    }
  }
  
}

extension SelectImageVC: UITableViewDelegate, UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return avatarNameList.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = sView?.tableView.dequeueReusableCell(withIdentifier: "ProfileCell", for: indexPath) as! SelectImageCell
      
    DispatchQueue.main.async {
      cell.label = self.avatarNameList[indexPath.row]
      cell.image = self.avatarImageList[indexPath.row]
    }
  
    return cell
  }
  
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let selectedImage = avatarImageList[indexPath.row].image!
    delegate?.sendData(data: selectedImage)
    navigationController?.popViewController(animated: true)
  }
  
  
  
}
