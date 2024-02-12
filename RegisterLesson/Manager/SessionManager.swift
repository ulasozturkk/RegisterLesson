
import Foundation

class SessionManager {
  static let shared = SessionManager()
  
  var currentUser : User?
  private init() {}
  
  func loginUser(user: User){
    currentUser = user
  }
  
  
  
}
