//
//  MealCellV2.swift
//  otlob
//
//  Created by yasmeen on 6/23/19.
//  Copyright © 2019 yasmeen. All rights reserved.
//

import UIKit

class MealCellV2: UITableViewCell {

    @IBOutlet weak var MealImageOutlet: UIImageView!
    
    @IBOutlet weak var MealNameOutlet: UILabel!
    
    @IBOutlet weak var MealDescOutlet: UILabel!
    @IBOutlet weak var MealPriceOutlet: UILabel!
    var id = ""
    var Mealimageurl = " "
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
