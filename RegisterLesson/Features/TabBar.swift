
import UIKit

class TabBar: UITabBarController {
  override func viewDidLoad() {
    super.viewDidLoad()

    let LessonListVC = LessonListVC()
    let GradeEntryVC = GradeEntryVC()
    let SettingsVC = SettingsVC()

    navigationItem.hidesBackButton = true

    viewControllers = [LessonListVC, GradeEntryVC, SettingsVC]

    LessonListVC.tabBarItem = UITabBarItem(title: "Lesson List", image: UIImage(systemName: "pencil.and.list.clipboard"), tag: 0)
    GradeEntryVC.tabBarItem = UITabBarItem(title: "Enter Grade", image: UIImage(systemName: "plus.app"), tag: 1)
    SettingsVC.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(systemName: "gear"), tag: 2)
  }
}
