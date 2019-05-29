//
//  loginViewController.swift
//  otlob
//
//  Created by yasmeen on 5/20/19.
//  Copyright © 2019 yasmeen. All rights reserved.
//

import UIKit

class loginViewController: UIViewController {


    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //let icon = UIImage(named: "o2")!
        //button.setImage(icon, for: .normal)
        //button.imageView?.contentMode = .scaleAspectFit
     //   button.imageEdgeInsets = UIEdgeInsets(top: 3, left: 3, bottom: 3, right:22)
        
        // Do any additional setup after loading the view.
        let _: UIButton = {
            let button = UIButton(type: .custom)
            button.setTitle("Logo", for: .normal)
            button.setImage(UIImage(named:"logo"), for: .normal)
            button.translatesAutoresizingMaskIntoConstraints = false
            // button.addTarget(self, action: #selector(handleLogo), for: .touchUpInside)
            return button
        }()
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
