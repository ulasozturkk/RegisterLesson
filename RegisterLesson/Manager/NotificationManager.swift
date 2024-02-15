

import Foundation
import UserNotifications

class NotificationManager {
    
    static func createNotification(title: String, subtitle: String, body: String) {
        let notificationContent = UNMutableNotificationContent()
        notificationContent.title = title
        notificationContent.subtitle = subtitle
        notificationContent.body = body
        
        // İçeriği oluşturduk, şimdi zamanı belirleyeceğiz
        
        var dateComponents = DateComponents()
        dateComponents.hour = 22
        dateComponents.minute = 23
      
        // uyuglamayı kapattıktan belirli bir süre sonra istiyorsan UN TIME INTERVAL KULLAN
        // Spesifik date veriyorsan UN CALENDAR KULLLAN
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        
        let notification = UNNotificationRequest(identifier: "not", content: notificationContent, trigger: trigger)
        
        UNUserNotificationCenter.current().add(notification, withCompletionHandler: nil)
    }
}
