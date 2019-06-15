//
//  ViewController.swift
//  otlob
//
//  Created by yasmeen on 5/19/19.
//  Copyright © 2019 yasmeen. All rights reserved.
//

import UIKit
import TextFieldEffects
import FirebaseDatabase
import FirebaseAuth
class ViewController: UIViewController {

    @IBOutlet weak var otherinstructionoutlet: HoshiTextField!
    @IBOutlet weak var flooroutlet: HoshiTextField!
    @IBOutlet weak var flatoutlet: HoshiTextField!
    @IBOutlet weak var houseoutlet: HoshiTextField!
    @IBOutlet weak var streetoutlet: HoshiTextField!
    @IBOutlet weak var addressoutlet: HoshiTextField!
    @IBOutlet weak var Phoneoutlet: HoshiTextField!
    @IBOutlet weak var EditBtn: UIButton!
 
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //button.setBackgroundImage(UIImage(named: "button"), for: .normal)
        EditBtn?.layer.borderWidth = 1.5
        EditBtn?.layer.borderColor = UIColor(red: 190, green: 0, blue: 0, alpha: 1).cgColor
        //EditBtn.layer.cornerRadius = 10
        
    }

    @IBAction func saveAddressAction(_ sender: Any) {
        if DataFiled(Phoneoutlet.text!) && DataFiled(addressoutlet.text!) && DataFiled(streetoutlet.text! ){
            let ref = Database.database().reference().child("users")
            let userid = Auth.auth().currentUser?.uid
            print(userid ?? 0)
            let addressDictionary : NSDictionary = ["phone" :self.Phoneoutlet.text!, "address" : self.addressoutlet.text!,"street":self.streetoutlet.text!, "house":self.houseoutlet.text! , "flat":self.flatoutlet.text!,"floor":self.flooroutlet.text!,"otherInstruction":self.otherinstructionoutlet.text!]
           /// self.ref.child("users/\(user.uid)/username").setValue(username)
            ref.child("\(userid!)/addresses/").childByAutoId().setValue(addressDictionary)

        }else{
            showToast(message: "please fill your data")
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func DataFiled(_ value:String)->Bool{
        if ( value != "" ) {
            return true
        }
        return false
    }
    func showToast(message : String) {
        
        let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 75, y: self.view.frame.size.height-100, width: 150, height: 50))
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        toastLabel.textAlignment = .center;
        toastLabel.font = UIFont(name: "Montserrat-Light", size: 12.0)
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds  =  true
        self.view.addSubview(toastLabel)
        UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
    }}
