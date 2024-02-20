
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
  
  func downloadImages() { // 
    var avatarImageData: [Data] = []
    
    let cachedImages = CacheManager.shared.readDataFromFile(folderName: "images")
    if let cachedImages = cachedImages {
      avatarImageData = cachedImages
    }
    
    if avatarImageData.isEmpty == true {
      // liste boş, network isteği yapacağız
      CacheManager.shared.createDirectoryAndFolder(folderName: "images") // folder oluşturduk
      // network isteği attık ve her datayı bir data listesine append ettk
      print("network isteği atılıyor")
      for url in AvatarPaths.avatarURLS {
        if let url = url {
          ImageDownloader.shared.downloadWithAlamofire(url: url) { [weak self] image, data in
            guard let self = self else { return }
            if let data = data {
              avatarImageData.append(data)
              CacheManager.shared.writeDataToFile(folderName: "images", fileName: url.lastPathComponent, data: data)
            }
            let imageView = UIImageView()
            imageView.image = image ?? UIImage(named: "selectImage")
            self.avatarImageViewList.append(imageView)
            DispatchQueue.main.async {
              self.sView?.tableView.reloadData()
            }
          }
        }
      }
     
    } else {
      // zaten bellekte resimler mevcut, network isteği atmaya gerek yok
      // dataları oku
      let datalist = CacheManager.shared.readDataFromFile(folderName: "images")
      print("data dosyadan çekiliyor...")
      if let datalist = datalist {
        for data in datalist {
          let image = UIImage(data: data)
          let imageView = UIImageView()
          imageView.image = image ?? UIImage(named: "selectImage")
          avatarImageViewList.append(imageView)
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
