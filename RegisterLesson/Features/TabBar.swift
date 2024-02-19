
import UIKit

class TabBar: UITabBarController {
  override func viewDidLoad() {
    super.viewDidLoad()

    self.tabBar.tintColor = .orange

    let LessonListVC = LessonListVC()
    let GradeEntryVC = GradeEntryVC()
    let SettingsVC = SettingsVC()
    let ProfileVC = ProfileVC()

    navigationItem.hidesBackButton = true
    let lineView = UIView(frame: CGRect(x: 0, y: 0, width: tabBar.frame.size.width, height: 1))
    lineView.backgroundColor = .orange

    tabBar.addSubview(lineView)

    viewControllers = [LessonListVC, GradeEntryVC, SettingsVC, ProfileVC]

    LessonListVC.tabBarItem = UITabBarItem(title: "Lesson List", image: UIImage(systemName: "pencil.and.list.clipboard"), tag: 0)
    GradeEntryVC.tabBarItem = UITabBarItem(title: "Enter Grade", image: UIImage(systemName: "plus.app"), tag: 1)
    SettingsVC.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(systemName: "gear"), tag: 2)
    ProfileVC.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person.fill"), tag: 3)
  }
}
