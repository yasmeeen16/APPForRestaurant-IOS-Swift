//
//  CreateAccount.swift
//  otlob
//
//  Created by yasmeen on 6/8/19.
//  Copyright © 2019 yasmeen. All rights reserved.
//

import UIKit
import TextFieldEffects
import FirebaseAuth
import FirebaseDatabase

class CreateAccount: UIViewController {

    @IBOutlet weak var firstnameOutlet: HoshiTextField!
    @IBOutlet weak var lastnameOutlet: HoshiTextField!
    @IBOutlet weak var emailOutlet: HoshiTextField!
    @IBOutlet weak var PhoneOutlet: HoshiTextField!
    @IBOutlet weak var PasswordOutlet: HoshiTextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func CreateAccount(_ sender: Any) {
        if isEmailValid(emailOutlet.text!) && PhoneOutlet.text!.isValidContact && DataFiled(firstnameOutlet.text!) && DataFiled(lastnameOutlet.text!) && DataFiled(PasswordOutlet.text!)  {
             //self.showToast(message: "welcome")
            Auth.auth().createUser(withEmail: emailOutlet.text!, password: PasswordOutlet.text!, completion: { (user,error ) in
                if let firebaseError = error {
                    print(firebaseError.localizedDescription)
                    self.showToast(message: "email is used")
                    
                    print("error")
                    
                    return
                }
                self.showToast(message: "create account success")
                print("success!")
               
                let DB = Database.database().reference().child("users")
                 let userid = Auth.auth().currentUser?.uid
                let userDictionary : NSDictionary = ["id":userid! ,"firstName" :self.firstnameOutlet.text!, "lastName" : self.lastnameOutlet.text!,"Email":self.emailOutlet.text!, "phone":self.PhoneOutlet.text!]
                DB.child(userid!).setValue(userDictionary) {
                    (error, ref) in
                    if error != nil {
                        print(error!)
                    }
                    else {
                        print("Message saved successfully!")
                    }
                }
                
            })
        }else{
             self.showToast(message: "enter correct data")
            
        }

    }
   
    
    func DataFiled(_ value:String)->Bool{
        if ( value != "" ) {
            return true
        }
        return false
    }
    
    func isEmailValid(_ value: String) -> Bool {
        do {
            if try NSRegularExpression(pattern: "^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}$", options: .caseInsensitive).firstMatch(in: value, options: [], range: NSRange(location: 0, length: value.count)) == nil {
                print("no")
                return false
            }
        } catch {
            print("no")
            return false
        }
        
        print("yes")
        return true
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
    }


}
extension String {
    var isValidContact: Bool {
        let phoneNumberRegex = "^[0-9]\\d{10}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", phoneNumberRegex)
        let isValidPhone = phoneTest.evaluate(with: self)
        return isValidPhone
    }
}
