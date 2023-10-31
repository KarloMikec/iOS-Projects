//
//  NotificationHandler.swift
//  RAMPU
//
//  Created by Karlo Mikec on 07.10.2023..
//

import Foundation
import UserNotifications
import UIKit

class NotificationHandler{
    func askPremission(){
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert,.badge,.sound]){ success, error in
            if success{
                print("Access granted")
            }else if let error = error {
                print(error.localizedDescription)
            }
        }
    }
    
    func sendNotification(date: Date, type: String, timeInterval: Double = 10, title: String, body: String){
        
        var trigger: UNNotificationTrigger?
                
                // Create a trigger (either from date or time based)
                if type == "date" {
                    let dateComponents = Calendar.current.dateComponents([.day, .month, .year, .hour, .minute], from: date)
                    trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
                } else if type == "time" {
                    trigger = UNTimeIntervalNotificationTrigger(timeInterval: timeInterval, repeats: false)
                }
        let imageName = "diamond.png"
        let filePath = Bundle.main.path(forResource: imageName, ofType: nil)
        let fileURL = URL(fileURLWithPath: filePath!)
        
        let content = UNMutableNotificationContent()
        
        do{
            let attachment = try UNNotificationAttachment.init(identifier: "Test", url: fileURL, options: .none)
            content.attachments = [attachment]
        } catch let error{
            print(error.localizedDescription)
        }
        
        _ = UNTimeIntervalNotificationTrigger(timeInterval: 7, repeats: false)
        
        content.title = title
        content.body = body
        content.sound = UNNotificationSound.default
        
        let request = UNNotificationRequest(identifier: UUID() .uuidString, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request)
    }
}



