//
//  login.swift
//  otlob
//
//  Created by yasmeen on 6/8/19.
//  Copyright © 2019 yasmeen. All rights reserved.
//

import UIKit
import TextFieldEffects
import FirebaseAuth

class login: UIViewController {

    @IBOutlet weak var PasswordOutlet: HoshiTextField!
    @IBOutlet weak var emailOutlet: HoshiTextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    @IBAction func LoginAction(_ sender: Any) {
        if isEmailValid(emailOutlet.text!), let _ = PasswordOutlet.text{
            if let email = emailOutlet.text  , let password = PasswordOutlet.text{
            Auth.auth().signIn(withEmail: email, password: password, completion: { (user, error) in
                if let firebaseError = error {
                    print(firebaseError.localizedDescription)
                    self.showToast(message: "data invalid")
                    return
                }
                self.showToast(message: "Logged in success")
                print("success!")
                
            })
        }
        }
        
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
