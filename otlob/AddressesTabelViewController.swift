//
//  AddressesTabelViewController.swift
//  otlob
//
//  Created by yasmeen on 6/8/19.
//  Copyright © 2019 yasmeen. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class AddressesTabelViewController: UIViewController ,UITableViewDataSource,UITableViewDelegate{
    
    var ref: DatabaseReference!
    var DatabaseHandle : DatabaseHandle?
    var mydata = [String]()
    var addressesData = [String:[AnyObject]]()
     var addresss:[Address] = [Address]()
    @IBOutlet weak var tabelview: UITableView!
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.addresss.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "addressCell") as! AddressCell
         let address = self.addresss[indexPath.row]
        
        cell.configureCellEn(add: address)
        
        return cell
    }
    

    @IBOutlet weak var AddAddressOutlet: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        tabelview.delegate = self
        tabelview.dataSource = self
        AddAddressOutlet.layer.borderColor = UIColor.red.cgColor
        // Do any additional setup after loading the view.
       
        //set the firebase refrence
        ref = Database.database().reference()
        
        //retrive our data
        let userID = Auth.auth().currentUser?.uid

        
        ref.child("users/\(userID!)/addresses").observeSingleEvent(of: .value, with: { (snapshot) in
            // Get user value
           
            
            if snapshot.value is NSNull {
                print("not found")
            } else {
                var loopCount = 1  //  count loops to see how may time trying to loop
                for child in snapshot.children {
                    print("##################################")
                    print(child)
                    let snap = child as! DataSnapshot
                    let dict = snap.value as! [String: String]
                    let phone = dict["phone"]!
                    let street = dict["street"]!
                    let house = dict["house"]!
                    let address = dict["address"]!
                    let flat = dict["flat"]!
                    let floor = dict["floor"]!
                   
                    let otherInstruction = dict["otherInstruction"]!
                    print("the bits ------")
                    print("address .... \(address)")
                    print("flat .... \(flat)")
                    print("floor .... \(floor)")
                    print("phone ........\(phone)")
                    print("street .....\(street)")
                    print("house ..... \(house)")
                    print("otherInstruction.....\(otherInstruction)")
                    
                    loopCount += 1
                    
                    let myaddress = Address(phone: phone, address: address, street: street, house: house, flat: flat, floor: floor, otherinstruction: otherInstruction)

                        self.addresss.append(myaddress)
                    
                }
            }
                self.tabelview.reloadData()

        }) { (error) in
            print(error.localizedDescription)
        }
    }


    

    @IBAction func SigninAction(_ sender: Any) {
        performSegue(withIdentifier: "Signinsegue", sender: self)
        
    }
    @IBAction func AddAddressAction(_ sender: Any) {
        performSegue(withIdentifier: "addaddresssegue", sender: self)
        
    }
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            addresss.remove(at: indexPath.row)
            tabelview.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 190
        
    }
    
    
   }
