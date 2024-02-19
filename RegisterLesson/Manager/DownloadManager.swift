//import Foundation
//import UIKit
//
//class DownloadManager {
//  let imageFolderName = "Images"
//  init() {
//          createImageFolderIfNeeded()
//      }
//  private func createImageFolderIfNeeded() {
//         if let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
//             let imageFolderURL = documentsDirectory.appendingPathComponent(imageFolderName)
//
//             if !FileManager.default.fileExists(atPath: imageFolderURL.path) {
//                 do {
//                     try FileManager.default.createDirectory(at: imageFolderURL, withIntermediateDirectories: true, attributes: nil)
//                 } catch {
//                     print("Error creating image folder: \(error.localizedDescription)")
//                 }
//             }
//         }
//     }
//  func downloadImages(from url: URL,withFileName fileName : String , completion: @escaping (Bool) -> ()) {
//          let task = URLSession.shared.dataTask(with: url) { data, response, error in
//              
//            if let error = error {
//              print(error.localizedDescription)
//              completion(false)
//            }
//            
//            guard let data = data else {
//              completion(false)
//              return
//            }
//            do{
//              let deceodedData = try? JSONDecoder().decode(UIImage, from: data)
//            }
//            self.saveImageToDisk(image: image, fileName: fileName)
//            completion(true)
//          }
//          task.resume()
//      }
//  func saveImageToDisk(image: UIImage,fileName: String) {
//    guard let data = image.jpegData(compressionQuality: 0.5) else {
//      print("error converting image")
//      return
//    }
//    
//    if let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first{
//      let imageFolderURL = documentDirectory.appendingPathComponent(imageFolderName)
//      let fileURL = imageFolderURL.appendingPathComponent(fileName)
//      do{
//        try data.write(to: fileURL)
//        print("success saving image to \(fileURL.absoluteString)")
//      }catch{
//        print("error saving image")
//      }
//    }
//  }
//  
//  func loadImagesFromDisk() -> [UIImage] {
//          var images: [UIImage] = []
//
//          if let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
//              let imageFolderURL = documentsDirectory.appendingPathComponent(imageFolderName)
//
//              do {
//                  let fileURLs = try FileManager.default.contentsOfDirectory(at: imageFolderURL, includingPropertiesForKeys: nil, options: [])
//
//                  for fileURL in fileURLs {
//                      do {
//                          let data = try Data(contentsOf: fileURL)
//
//                          guard !data.isEmpty, let image = UIImage(data: data) else {
//                              print("Error: Could not create UIImage from data at \(fileURL.absoluteString)")
//                              continue
//                          }
//
//                          images.append(image)
//                      } catch {
//                          print("Error reading data from file at \(fileURL.absoluteString): \(error.localizedDescription)")
//                      }
//                  }
//              } catch {
//                  print("Error listing contents of directory: \(error.localizedDescription)")
//              }
//          }
//
//          return images
//  }
//
//}
