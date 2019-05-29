//
//  Language.swift
//  otlob
//
//  Created by yasmeen on 5/27/19.
//  Copyright © 2019 yasmeen. All rights reserved.
//

import UIKit

class Language: UIViewController {
    //outlets
    @IBOutlet weak var Englishbtn: UIButton!
    @IBOutlet weak var ArabicBtn: UIButton!
    @IBOutlet weak var menuoutlet: UIButton!
    @IBOutlet weak var UAEOutlet: UIButton!
    @IBOutlet weak var QatarOutlet: UIButton!
    @IBOutlet weak var KwaitOutlet: UIButton!
    
    
    //actions
    @IBAction func MenuAction(_ sender: Any) {
        print("helloooo")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //English btn
        Englishbtn.layer.borderWidth = 2
        Englishbtn.layer.borderColor = UIColor(red: 255, green: 255, blue: 255, alpha: 1).cgColor
        Englishbtn.layer.cornerRadius = 5
        
        // Arabic btn
        ArabicBtn.layer.borderWidth = 2
        ArabicBtn.layer.borderColor = UIColor(red: 255, green: 255, blue: 255, alpha: 1).cgColor
        ArabicBtn.layer.cornerRadius = 5
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
