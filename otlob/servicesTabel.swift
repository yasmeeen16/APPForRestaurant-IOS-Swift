
//
//  servicesTabel.swift
//  otlob
//
//  Created by yasmeen on 6/25/19.
//  Copyright © 2019 yasmeen. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class servicesTabel: UIViewController , UITableViewDelegate ,UITableViewDataSource {
    var ref: DatabaseReference!
    var ArrayOfServices = [Services]()


    @IBOutlet weak var ServicesTabel: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        ServicesTabel.delegate = self
        ServicesTabel.dataSource = self
        //set the firebase refrence
        ref = Database.database().reference()
        ref.child("Services").observeSingleEvent(of: .value, with: { (snapshot) in
            for child in snapshot.children {
                let snap = child as! DataSnapshot
                let dict = snap.value as! [String: String]
                let id = dict["id"]!
                let name = dict["name"]!
                
                let serviceObject = Services(name: name, id: id)
                self.ArrayOfServices.append(serviceObject)
                print("==============================")
                print(self.ArrayOfServices.count)
            }
            self.ServicesTabel.reloadData()
            
        })
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ArrayOfServices.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "serviceCell") as! ServiceCell
        
        let service = self.ArrayOfServices[indexPath.row]
        cell.ServiceOutlet.text = service.name
        
        
        return cell
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65
    }
    
}
