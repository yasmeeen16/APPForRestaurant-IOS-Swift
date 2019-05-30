//
//  CollabseViewController.swift
//  otlob
//
//  Created by yasmeen on 5/30/19.
//  Copyright © 2019 yasmeen. All rights reserved.
//

import UIKit

class CollabseViewController: UIViewController {

    var data = [DataModelOfCollabseTabel(HeaderName: "the most sels", subtype:["chesses1","chesses2","chesses3"], isExpandable: false ),DataModelOfCollabseTabel(HeaderName: "the most sels1", subtype:["chesses1","chesses2","chesses3"], isExpandable: false ),DataModelOfCollabseTabel(HeaderName: "the most sels2", subtype:["chesses1","chesses2","chesses3"], isExpandable: false )]
    @IBOutlet weak var tabelView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
extension CollabseViewController :UITableViewDelegate,UITableViewDataSource{

    

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = HeaderView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 40))
        return headerView
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 6
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cells")
        cell?.textLabel?.text = "yasmeen"
        return cell!
    }}
