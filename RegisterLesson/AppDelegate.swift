
import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
  var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    window = UIWindow(frame: UIScreen.main.bounds)
    let navigation = UINavigationController(rootViewController: OnboardingVC())
    window?.rootViewController = navigation
    window?.makeKeyAndVisible()

    return true
  }
}
