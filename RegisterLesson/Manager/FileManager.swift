

import Foundation

class CacheManager {
  static let shared = CacheManager()
  private init() {}

  func createDirectory() {
    let manager = FileManager.default // filemanager instance oluşturduk

    guard let DocumentsPathUrl = manager.urls(for: .cachesDirectory, in: .userDomainMask).first else {
      return // cachesdirectory
    } // cihazın ../documents  directory pathi
    print(DocumentsPathUrl.absoluteString)
    
    try? manager.createDirectory(at: DocumentsPathUrl, withIntermediateDirectories: true) // directory olusturduk
  }

  func writeDataToDirectory(dataName: String, data: Data) {
    let manager = FileManager.default
    guard let DocumentsPathUrl = manager.urls(for: .cachesDirectory, in: .userDomainMask).first else {
      return
    }
    let fileURL = DocumentsPathUrl.appendingPathComponent(dataName) // file directory

    if manager.fileExists(atPath: fileURL.path) == true { // eğer file mevcutsa
      try? data.write(to: fileURL)
    } else {
      // file mevcut değil OLUŞTUR
      manager.createFile(atPath: fileURL.path, contents: nil)
      // dosyayı olsturduk şimdi içine yazacağız
      try? data.write(to: fileURL)
    }
  }

  func readDataFromDirectory(dataName: String) -> Data? {
    let manager = FileManager.default
    guard let DocumentsPathUrl = manager.urls(for: .cachesDirectory, in: .userDomainMask).first else {
      return nil
    }
    let fileURL = DocumentsPathUrl.appendingPathComponent(dataName)

    if manager.fileExists(atPath: fileURL.path) == true { // eğer file mevcutsa
      do {
        let data = try Data(contentsOf: fileURL)
        return data.isEmpty ? nil : data
      } catch {
        return nil
      }

    } else {
      print("file mevcut değil")
      return nil
    }
  }
}
