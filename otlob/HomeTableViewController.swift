//
//  HomeTableViewController.swift
//  otlob
//
//  Created by yasmeen on 6/1/19.
//  Copyright © 2019 yasmeen. All rights reserved.
//

import UIKit
import LBTAComponents
import Firebase
import FirebaseDatabase

struct DataCell {
    let image : UIImage?
    let name : String?
    let desc : String?
}

class HomeTableViewController: UITableViewController {
    //var data = [DataCell]()
    var ref: DatabaseReference!
    @IBOutlet var hometabelview: UITableView!
    var mydata = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        hometabelview.delegate = self
        hometabelview.dataSource = self
        //set the firebase refrence
        ref = Database.database().reference()
        
        ref.child("category").observeSingleEvent(of: .value, with: { (snapshot) in
            // Get user value
            print(snapshot.value!)
            
//            let snap = snapshot.value as! NSDictionary
//            print("$$$$$$$$$$$$$$$$$$$$$$$$")
//            print(snap["Eastern meals"] ?? " ")
        
            //let value = snapshot.value as? NSDictionary
           /// let score = value?["score"] as? String ?? ""
            
           // print(score)
                  
                     // let snap = child as! DataSnapshot
                     //let dict = snap.value as! [String: String]
                   // print("&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&")
                  
//                    let phone = dict["phone"]!
//                    let street = dict["street"]!
//                    let house = dict["house"]!
//                    let address = dict["address"]!
//                    let flat = dict["flat"]!
//                    let floor = dict["floor"]!
//
//                    let otherInstruction = dict["otherInstruction"]!
//                    print("the bits ------")
//                    print("address .... \(address)")
//                    print("flat .... \(flat)")
//                    print("floor .... \(floor)")
//                    print("phone ........\(phone)")
//                    print("street .....\(street)")
//                    print("house ..... \(house)")
//                    print("otherInstruction.....\(otherInstruction)")
//
//                    loopCount += 1
//
//                    let myaddress = Address(phone: phone, address: address, street: street, house: house, flat: flat, floor: floor, otherinstruction: otherInstruction)
//
//                    self.addresss.append(myaddress)
                    
            
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        //cell?.textLabel?.text = data[indexPath.row].subtype[indexPath.row]
        
       
        
        return cell!
        
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 10
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "ShowDetails", sender: self)
    }

}
