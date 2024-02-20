import CoreData
import FirebaseCore
import FirebaseMessaging
import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
  var window: UIWindow?
  let gcmMessageIDKey = "gcm.Message_ID"

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { _, _ in }

    FirebaseApp.configure()

    window = UIWindow(frame: UIScreen.main.bounds)
    
    let userLoggedInData = KeyChainManager.shared.readDataFromKeyChain(key: "isUserLoggedIn")?.withUnsafeBytes { $0.load(as: Bool.self) }
    
    if userLoggedInData == false || userLoggedInData == nil {
      let navigation = UINavigationController(rootViewController: SignInVC()) // TODO: login
      window?.rootViewController = navigation
    } else {
      let context = DBManager.shared.persistentContainer.viewContext
      let currentUserName = KeyChainManager.shared.readDataFromKeyChain(key: "username")
      if let currentUserName = currentUserName {
        let currentUserNameString = String(data: currentUserName, encoding: .utf8)
        let fetchRequset: NSFetchRequest<User> = User.fetchRequest()
        fetchRequset.predicate = NSPredicate(format: "username == %@", currentUserNameString!)
        do {
          let users = try context.fetch(fetchRequset)
          guard let user = users.first else {
            let navigation = UINavigationController(rootViewController: SignInVC())
            window?.rootViewController = navigation
            return true
          }
          SessionManager.shared.loginUser(user: user)
          let navigation = UINavigationController(rootViewController: TabBar())
          window?.rootViewController = navigation
        } catch {}
      }
    }
    window?.makeKeyAndVisible()
        
    return true
  }
    
  func applicationDidEnterBackground(_ application: UIApplication) {
    print("background")
    var notEntered: [String] = []
        
    guard let user = SessionManager.shared.currentUser else { return }
        
    if let lessons = user.lessons {
      let lessonArray = Array(lessons) as! [Lesson]
      for lesson in lessonArray {
        if lesson.grade == 0.0 {
          notEntered.append(lesson.name!)
        }
      }
    }
        
    if !notEntered.isEmpty {
      NotificationManager.createNotification(title: "Error", subtitle: "Enter a Grade", body: "you did not enter grade for: \(notEntered)")
    }
  }
    
  func applicationWillTerminate(_ application: UIApplication) {
    print("terminate")
  }
}

extension AppDelegate: MessagingDelegate {
  func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String?) {
    Messaging.messaging().token { token, error in
      if let error = error {
        print("Error fetching FCM registration token: \(error)")
      } else if let token = token {
        print("FCM registration token: \(token)")
      }
    }
  }
}

extension AppDelegate: UNUserNotificationCenterDelegate {
  func userNotificationCenter(_ center: UNUserNotificationCenter,
                              willPresent notification: UNNotification,
                              withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void)
  {
    let userInfo = notification.request.content.userInfo
    Messaging.messaging().appDidReceiveMessage(userInfo)
    print(userInfo)
    completionHandler([[.alert, .sound]])
  }
    
  func userNotificationCenter(_ center: UNUserNotificationCenter,
                              didReceive response: UNNotificationResponse,
                              withCompletionHandler completionHandler: @escaping () -> Void)
  {
    let userInfo = response.notification.request.content.userInfo
    Messaging.messaging().appDidReceiveMessage(userInfo)
    print(userInfo)
    completionHandler()
  }
    
  func application(_ application: UIApplication,
                   didReceiveRemoteNotification userInfo: [AnyHashable: Any],
                   fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void)
  {
    Messaging.messaging().appDidReceiveMessage(userInfo)
    if let messageID = userInfo[gcmMessageIDKey] {
      print("Message ID: \(messageID)")
    }
    print(userInfo)
    completionHandler(UIBackgroundFetchResult.newData)
  }
}
