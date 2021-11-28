//
//  ViewController.swift
//  LocalPushTest
//
//  Created by 玉井　勝也 on 2021/11/25.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {
    
    var flag = false
    let button = UIButton(frame: CGRect(x: 100, y: 100, width: 50, height: 50))
    let content = UNMutableNotificationContent()

    override func viewDidLoad() {
        super.viewDidLoad()
        flag = false
        view.backgroundColor = .white
        
        
        Button()
        Label()
    }


    
    func Button() {
        button.backgroundColor = .yellow
        button.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
        view.addSubview(button)
    }
    
    func Label() {
        let label = UILabel(frame: CGRect(x: 0, y: 500, width: 200, height: 100))
        label.backgroundColor = .blue
        label.textColor = .white
        view.addSubview(label)
    }
    
    @objc func tapButton() {
        if flag == false {
            pushRegister()
        } else {
         pushDelete()
        }
    }
    
    func pushRegister() {
        button.backgroundColor = .blue
        flag = true
        
        let notificationCenter = UNUserNotificationCenter.current()
        
        var dateComponetsDay = DateComponents()
        dateComponetsDay.hour = 10
        dateComponetsDay.minute = 55
        
        content.title = "お知らせ１"
        content.body = "アラーム"
        content.sound = UNNotificationSound.default
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponetsDay, repeats: true)
        //通知のID(identifier,タイトル,内容、トリガーを設定 )
        let request = UNNotificationRequest(identifier: content.title, content: content, trigger: trigger)
        print("request is \(request.content.title)")
        
        notificationCenter.add(request) {
            (error) in
            if error != nil {
//                print(error.debugDescription)
            }
        }
        UNUserNotificationCenter.current().getPendingNotificationRequests{_ in
//            print("Pending request :", $0)
        }
        
        print("flag is false")
    }
    
    func pushDelete() {
        button.backgroundColor = .red
        flag = false
        let notificationCenter = UNUserNotificationCenter.current()
        notificationCenter.removePendingNotificationRequests(withIdentifiers: ["お知らせ"])
//        notificationCenter.removeAllPendingNotificationRequests()
        print("request is \(content.title)")
        print("flag is true")
        
    }
    
    func pushGet() {
        button.backgroundColor = .brown
        
        flag = false
        let center = UNUserNotificationCenter.current()
        center.getPendingNotificationRequests{
            (request: [UNNotificationRequest]) in
        }
        print([UNNotificationRequest].self)
    }
    
}




//    @objc func tapButton() {
////        let content = UNMutableNotificationContent()
////        content.title = "お知らせ"
////        content.body = "19時にアラーム"
////        content.sound = UNNotificationSound.default
////
////        let notificationCenter = UNUserNotificationCenter.current()
////
////        var dateComponetsDay = DateComponents()
////        dateComponetsDay.hour = 7
////        dateComponetsDay.minute = 58
////
////        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponetsDay, repeats: true)
////        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
////
////        notificationCenter.add(request) {
////            (error) in
////            if error != nil {
////                print(error.debugDescription)
////            }
////        }
////        UNUserNotificationCenter.current().getPendingNotificationRequests{
////            print("Pending request :", $0)
////        }
//    }
//}
//
//
