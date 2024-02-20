
import Foundation
import UIKit

extension UIImageView {
  func setImage(url: URL, imageName: String) {
    let data = CacheManager.shared.readDataFromDirectory(dataName: imageName)
    if data != nil {
      // from cache
      let data = CacheManager.shared.readDataFromDirectory(dataName: imageName)
      if let data = data {
        DispatchQueue.main.async {
          self.image = UIImage(data: data)
        }
      }
    } else {
      // from network
      ImageDownloader.shared.downloadWithAlamofire(url: url) { data in
        if let data = data {
          DispatchQueue.main.async {
            self.image = UIImage(data: data)
            // write to cache
            CacheManager.shared.writeDataToDirectory(dataName: imageName, data: data)
          }
        }
      }
    }
  }
}
