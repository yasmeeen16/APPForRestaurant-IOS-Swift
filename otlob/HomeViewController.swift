//
//  HomeViewController.swift
//  otlob
//
//  Created by yasmeen on 5/28/19.
//  Copyright © 2019 yasmeen. All rights reserved.
//

import UIKit
import LBTAComponents

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavigationBarItem()
        
        // Do any additional setup after loading the view.
    }
    private func setUpNavigationBarItem(){
          let imageTitle = UIImageView(image: #imageLiteral(resourceName: "restaurant"))
        imageTitle.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        imageTitle.contentMode = .scaleAspectFit
       // btn.setTitle(" ▽ Octoper City ", for: .normal)
        navigationItem.titleView = imageTitle
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
