//
//  DownloadImages.swift
//  RegisterLesson
//
//  Created by macbook pro on 19.02.2024.
//

import Alamofire
import Foundation
import UIKit

class ImageDownloader {
  static let shared = ImageDownloader()
  private init() {}

  func downloadImage(url: URL, completion: @escaping (UIImage?) -> Void) {
    URLSession.shared.dataTask(with: url) { data, _, error in
      guard let data = data, error == nil else {
        completion(nil)
        return
      }
      let image = UIImage(data: data)
      completion(image)
    }.resume()
  }

  func downloadWithAlamofire(url: URL, completion: @escaping (UIImage?) -> Void) {
    AF.request(url).responseData { response in
      switch response.result {
      case .success(let data):
        let image = UIImage(data: data)
        completion(image)
      case .failure(let error):
        print(error.localizedDescription)
        completion(nil)
      }
    }
  }
}
