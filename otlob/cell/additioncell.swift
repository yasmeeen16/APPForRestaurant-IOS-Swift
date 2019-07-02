//
//  additioncell.swift
//  otlob
//
//  Created by yasmeen on 7/1/19.
//  Copyright © 2019 yasmeen. All rights reserved.
//

import UIKit

class additioncell: UITableViewCell {

    @IBOutlet weak var additionlabel: UILabel!
    @IBOutlet weak var chechbuttonOutlet: UIButton!
    @IBOutlet weak var PriceOutlet: UILabel!
  

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }



    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
