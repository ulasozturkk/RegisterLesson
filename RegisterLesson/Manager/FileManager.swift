

import Foundation

class CacheManager {
  static let shared = CacheManager()
  private init() {}
  var dataArray: [Data] = []
  
  func createDirectoryAndFolder(folderName: String) {
    let manager = FileManager.default // filemanager instance oluşturduk
    
    guard let DocumentsPathUrl = manager.urls(for: .documentDirectory, in: .userDomainMask).first else {
      return // cachesdirectory
    } // cihazın ../documents  directory pathi
    print(DocumentsPathUrl.absoluteString)
    
    // directory içinde folder olusturacagız
    
    let imageDataFolderURL = DocumentsPathUrl.appendingPathComponent(folderName) // path component ekledik
    
    if manager.fileExists(atPath: imageDataFolderURL.path) == false { // folder daha önce yoksa
      do {
        try manager.createDirectory(at: imageDataFolderURL, withIntermediateDirectories: true) // directory olusturduk
        manager.createFile(atPath: imageDataFolderURL.path,
                           contents: nil,
                           attributes: [FileAttributeKey.creationDate: Date()] // folder oluşturduk
        )
      } catch {}
    }
  }
  
  func writeDataToFile(folderName: String, fileName: String, data: Data) {
    let manager = FileManager.default
    guard let DocumentsPathUrl = manager.urls(for: .documentDirectory, in: .userDomainMask).first else {
      return
    }
    let folderURL = DocumentsPathUrl.appendingPathComponent(folderName) // folder directory
    
    if manager.fileExists(atPath: folderURL.path) == true { // eğer folder mevcutsa
      let fileURL = folderURL.appendingPathComponent(fileName) // file directory
      if manager.fileExists(atPath: fileURL.path) == true { // eğer file mevcutsa
        // datayı içine yaz
        do {
          try data.write(to: fileURL)
          print("data  wrote  succesfully!")
        } catch {
          print("error writing data")
        }
      } else {
        // file mevcut değil OLUŞTUR
        let fileURL = folderURL.appendingPathComponent(fileName)
        manager.createFile(atPath: fileURL.path, contents: nil)
        // dosyayı olsturduk şimdi içine yazacağız
        try? data.write(to: fileURL)
      }
      
    } else {
      print("folder yok")
    }
  }
  
  func readDataFromFile(folderName: String) -> [Data]? {
    let manager = FileManager.default
    guard let DocumentsPathUrl = manager.urls(for: .documentDirectory, in: .userDomainMask).first else {
      return nil
    }
    let folderURL = DocumentsPathUrl.appendingPathComponent(folderName)
//    print(folderURL)
    
    if manager.fileExists(atPath: folderURL.path) == true { // eğer folder mevcutsa
      do {
        let fileURLs = try manager.contentsOfDirectory(at: folderURL, includingPropertiesForKeys: nil)
        var dataList: [Data] = []
        
        for fileURL in fileURLs {
          if let data = try? Data(contentsOf: fileURL) {
            dataList.append(data)
          }
        }
        
        return dataList.isEmpty ? nil : dataList
      } catch {
        return nil
      }

    } else {
      print("folder yok")
      return nil
    }
  }
}
