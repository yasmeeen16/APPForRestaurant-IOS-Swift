//
//  HomeTableViewController.swift
//  otlob
//
//  Created by yasmeen on 6/1/19.
//  Copyright © 2019 yasmeen. All rights reserved.
//

import UIKit
import LBTAComponents

struct DataCell {
    let image : UIImage?
    let name : String?
    let desc : String?
}

class HomeTableViewController: UITableViewController {
    var data = [DataCell]()
    override func viewDidLoad() {
        super.viewDidLoad()

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
