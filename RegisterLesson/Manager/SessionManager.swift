
import Foundation

class SessionManager {
  static let shared = SessionManager()

  var currentUser: User? // get
  private init() {}

  func loginUser(user: User) { // set
    currentUser = user
  }
}
