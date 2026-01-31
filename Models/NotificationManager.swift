//
//  NotificationManager.swift
//  Remindly
//
//  Created by Maurizio Altamura on 1/31/26.
//

import Foundation
import UserNotifications

class NotificationManager {

    static let shared = NotificationManager()

    func requestPermission() {
        UNUserNotificationCenter.current()
            .requestAuthorization(options: [.alert, .sound])
        { _, _ in }
    }

    func schedule(reminder: Reminder) {
        let content = UNMutableNotificationContent()
        content.title = "Reminder"
        content.body = reminder.unwrappedTitle

        let trigger = UNCalendarNotificationTrigger(
            dateMatching: Calendar.current.dateComponents(
                [.year, .month, .day, .hour, .minute],
                from: reminder.unwrappedDueDate
            ),
            repeats: false
        )

        let request = UNNotificationRequest(
            identifier: reminder.id!.uuidString,
            content: content,
            trigger: trigger
        )

        UNUserNotificationCenter.current().add(request)
    }
}
