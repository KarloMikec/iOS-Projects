//  ContentView.swift
//  SimpleSystemNotification
//  Created by Karlo Mikec

import SwiftUI
import UserNotifications

struct ContentView: View {
    @State private var showNotification = false

    var body: some View {
        VStack {
            Button("Show notification") {
                scheduleNotification()
            }
        }
    }

    func scheduleNotification() {
        let content = UNMutableNotificationContent()
        content.title = "HOMEASSISTANT"
        content.body = "Motion detected in the living room."
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)

        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)

        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("Error scheduling notification: \(error)")
            } else {
                print("The notification has been successfully scheduled.")
            }
        }
    }
}

struct MyApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate, UNUserNotificationCenterDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        UNUserNotificationCenter.current().delegate = self
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            if granted {
                print("Premission to display notification is denied.")
            } else if let error = error {
                print("Error requesting notification premission: \(error)")
            }
        }
        return true
    }
}


