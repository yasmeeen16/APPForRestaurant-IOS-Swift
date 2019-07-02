//
//  NotificationViewController.swift
//  otlob
//
//  Created by yasmeen on 6/23/19.
//  Copyright © 2019 yasmeen. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class NotificationViewController: UIViewController ,UITableViewDataSource , UITableViewDelegate {
    
     var notifications = [Notifications]()
     var ref: DatabaseReference!
    
    
    @IBOutlet weak var NotificationTabel: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationTabel.delegate = self
        NotificationTabel.dataSource = self
        ref = Database.database().reference()
        // Do any additional setup after loading the view.
        ref.child("Notifications").observeSingleEvent(of: .value, with: { (snapshot) in
            //print("-------------------------------------")
            //print(snapshot.value ?? " ")
            for child in snapshot.children {
                print("-------------------------------")
                print(child)
                let snap = child as! DataSnapshot
                let dict = snap.value as! [String: String]
               
                let id = dict["id"]!
                let NotificationImage = dict["NotificationImage"]!
                let NotificationText = dict["NotificationText"]!
                
                let notificationObject = Notifications(id: id, NotificationText: NotificationText, NotificationImage: NotificationImage)
                self.notifications.append(notificationObject)
                self.NotificationTabel.reloadData()
            }
            
        })    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.notifications.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "notCell") as! NotificationCell
            let notification = self.notifications[indexPath.row]
            cell.configureCellEn(notification: notification)
            return cell
            
        }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
}
