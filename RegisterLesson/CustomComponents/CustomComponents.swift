
import Foundation
import UIKit

enum CustomComponents {
  static func createTextField(placeholder: String, isSecured: Bool) -> UITextField {
    let textfield = UITextField()
    textfield.translatesAutoresizingMaskIntoConstraints = false
    textfield.placeholder = placeholder
    textfield.font = .customScaledFont(CustomFontName: Constants.light)
    textfield.layer.cornerRadius = 30
    textfield.borderStyle = .line
    textfield.layer.borderWidth = 1.0
    textfield.layer.borderColor = UIColor.black.cgColor
    textfield.layer.masksToBounds = true
    textfield.isSecureTextEntry = isSecured
    textfield.textAlignment = .center
    return textfield
  }
    
  static func BackButton(systemImage: String) -> UIButton {
    let button = UIButton()

    button.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
    button.layer.cornerRadius = button.bounds.size.width / 2
    button.clipsToBounds = true
    button.backgroundColor = .orange
    let symbolImage = UIImage(systemName: systemImage)
    button.setImage(symbolImage, for: .normal)
    button.tintColor = .white
    return button
  }
    
  static func SemiBoldLabel(size: CGFloat, text: String) -> UILabel {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = text
    label.font = UIFont.customScaledFont(CustomFontName: Constants.SemiBoldItalic)
    label.adjustsFontForContentSizeCategory = true
    return label
  }
    
  static func BoldLabel(size: CGFloat, text: String) -> UILabel {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = text
    label.font = UIFont.customScaledFont(CustomFontName: Constants.BoldItalic)
    label.adjustsFontForContentSizeCategory = true

    return label
  }
    
  static func LightLabel(size: CGFloat, text: String) -> UILabel {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = text
    label.font = UIFont.customScaledFont(CustomFontName: Constants.light)
    label.adjustsFontForContentSizeCategory = true
    return label
  }
    
  static func ItalicLabel(size: CGFloat, text: String) -> UILabel {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = text
    label.font = UIFont.customScaledFont(CustomFontName: Constants.italic)
    label.adjustsFontForContentSizeCategory = true
    return label
  }
  
  static func angledButton(text: String) -> UIButton {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setTitle(text, for: .normal)
    button.setTitleColor(.black, for: .normal)
    button.backgroundColor = .white
    button.layer.cornerRadius = 12
    button.layer.borderWidth = 1
    button.layer.borderColor = UIColor.green.cgColor
    button.titleLabel?.font = UIFont.customScaledFont(CustomFontName: Constants.light)
    button.titleLabel?.adjustsFontForContentSizeCategory = true
    return button
  }

  static func circularButton(text: String) -> UIButton {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setTitle(text, for: .normal)
    button.setTitleColor(.white, for: .normal)
    button.backgroundColor = .white
    button.layer.cornerRadius = 30
    button.layer.borderWidth = 1
    button.layer.borderColor = UIColor.green.cgColor
    button.backgroundColor = .orange
    button.titleLabel?.font = UIFont.customScaledFont(CustomFontName: Constants.SemiBoldItalic)
    button.titleLabel?.adjustsFontForContentSizeCategory = true
    return button
  }
  
  static func createNotification(title: String, subtitle: String, body: String) {
    let notificationContent = UNMutableNotificationContent()
    notificationContent.title = title
    notificationContent.subtitle = subtitle
    notificationContent.body = body
    // icerigi olusturduk şimdi zamanı belirlicez
    
    let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
    
    let notification = UNNotificationRequest(identifier: "not", content: notificationContent, trigger: trigger)
    UNUserNotificationCenter.current().add(notification, withCompletionHandler: nil)
  }
}
