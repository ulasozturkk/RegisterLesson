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
      
      let navigation = UINavigationController(rootViewController: OnboardingVC())
      window?.rootViewController = navigation
    } else {
      let currentUserName = SessionManager.shared.currentUser
      if currentUserName != nil {

        let context = DBManager.shared.persistentContainer.viewContext
        
        let fetchRequest: NSFetchRequest<User> = User.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "username == %@", currentUserName! )
        do {
          let users = try context.fetch(fetchRequest)
          guard let user = users.first else { return false }
          SessionManager.shared.loginUser(user: user)
        } catch {}
        let navigation = UINavigationController(rootViewController: TabBar())
        window?.rootViewController = navigation
      }else {
        let navigation = UINavigationController(rootViewController: OnboardingVC())
        window?.rootViewController = navigation
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
