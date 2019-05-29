//
//  ViewController.swift
//  otlob
//
//  Created by yasmeen on 5/19/19.
//  Copyright © 2019 yasmeen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var EditBtn: UIButton!
 
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //button.setBackgroundImage(UIImage(named: "button"), for: .normal)
        EditBtn.layer.borderWidth = 2.5
        EditBtn.layer.borderColor = UIColor(red: 190, green: 0, blue: 0, alpha: 1).cgColor
        //EditBtn.layer.cornerRadius = 10
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
