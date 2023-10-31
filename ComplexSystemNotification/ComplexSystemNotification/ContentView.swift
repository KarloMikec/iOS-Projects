//  ContentView.swift
//  ComplexSystemNotification
//  Created by Karlo Mikec

import SwiftUI
import UserNotifications

struct ContentView: View {
    var body: some View {
        Home()
    }
}

struct Home: View {
    @StateObject var delegate = NotificationDelegate()

    var body: some View {
        Button("Notification", action: notifyMe)
            .onAppear {
                UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { _, _ in }
                UNUserNotificationCenter.current().delegate = delegate
            }
    }

    func notifyMe() {
        let content = UNMutableNotificationContent()
        content.title = "HOMEASSISTANT"
        content.subtitle = "Movement detection at living room!"
        content.categoryIdentifier = "ACTIONS"

        let image = "motion-sensor"
        if let imageURL = Bundle.main.url(forResource: image, withExtension: "png") {
            let attachment = try! UNNotificationAttachment(identifier: "kuca", url: imageURL)
            content.attachments = [attachment]
        }

        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        let request = UNNotificationRequest(identifier: "identifier", content: content, trigger: trigger)

        let close = UNNotificationAction(identifier: "CLOSE", title: "Close", options: .destructive)
        let category = UNNotificationCategory(identifier: "ACTIONS", actions: [close], intentIdentifiers: [], options: [])

        UNUserNotificationCenter.current().setNotificationCategories([category])
        UNUserNotificationCenter.current().add(request) { _ in }
    }
}

class NotificationDelegate: NSObject, ObservableObject, UNUserNotificationCenterDelegate {
    @Published var alert = false
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.badge, .banner, .sound])
    }
}



