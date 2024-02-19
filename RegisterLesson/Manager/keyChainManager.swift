
import Foundation

class KeyChainManager {
  static let shared = KeyChainManager()
  private init() {}
  
  func saveToKeyChain(data: Data, key: String) {
    // önce query oluştur
    var query: [String: Any] = [
      kSecClass as String: kSecClassGenericPassword, // öğe türü
      kSecAttrAccount as String: key, // tutacağımız key değeri
      kSecValueData as String: data // tutacağımız value
    ]
    
    var status = SecItemAdd(query as CFDictionary, nil)
    guard status == errSecSuccess || status == errSecDuplicateItem else {
      print("error saving data on keyChain")
      return
    }
    
    if status == errSecDuplicateItem { // duplicate ise yani zaten data varsa olanı Güncelle
      let updateQuery: [String: Any] = [
        kSecClass as String: kSecClassGenericPassword,
        kSecAttrAccount as String: key,
        kSecValueData as String: data
      ]
      SecItemUpdate(updateQuery as CFDictionary, [kSecValueData as String: data] as CFDictionary)
    }
    print("data added on keychain successfully")
  }
  
  func readDataFromKeyChain(key: String) -> Data? { // kaydettiğimiz değere key üzerinden erişmemiz gerek
    let query: [String: Any] = [
      kSecClass as String: kSecClassGenericPassword,
      kSecAttrAccount as String: key,
      kSecReturnData as String: true // write dan farkı bu KSECRETURNDATA (data dönüyor mu)
    ]
    var item: CFTypeRef? // generic obje referansı
    let status = SecItemCopyMatching(query as CFDictionary, &item) // REFERANS TİPİ OLDUĞU İÇİN POİNTER VERMEMİZ
    guard status == errSecSuccess, let data = item as? Data else {
      print("error fetching data... you will give nil")
      return nil
    }
    return data
  }
  
  func deleteDataFromKeyChain(key: String) { // yine key üzerinden dataya erişeceğiz
    let query: [String: Any] = [
      kSecClass as String: kSecClassGenericPassword,
      kSecAttrAccount as String: key
    ]
    var status = SecItemDelete(query as CFDictionary)
    guard status == errSecSuccess else {
      return
    }
    print("key deleted successfully")
  }
}

// burdaki dictionary tipimiz NSDictionary değil CFDictionary, çünkü keychain tipine uyumlu çalışan bu
// nedeni ise Foundation Frameworkünün C dili ile yazılmış olması hatta o yüzden & referans kullandık
