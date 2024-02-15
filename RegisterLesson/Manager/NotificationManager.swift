

import Foundation
import UserNotifications

class NotificationManager {
    
    static func createNotification(title: String, subtitle: String, body: String) {
        let notificationContent = UNMutableNotificationContent()
        notificationContent.title = title
        notificationContent.subtitle = subtitle
        notificationContent.body = body
        
        // İçeriği oluşturduk, şimdi zamanı belirleyeceğiz
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        
        let notification = UNNotificationRequest(identifier: "not", content: notificationContent, trigger: trigger)
        
        UNUserNotificationCenter.current().add(notification, withCompletionHandler: nil)
    }
}
