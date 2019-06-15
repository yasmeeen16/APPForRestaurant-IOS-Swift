//
//  AddressCell.swift
//  otlob
//
//  Created by yasmeen on 6/11/19.
//  Copyright © 2019 yasmeen. All rights reserved.
//

import UIKit

class AddressCell: UITableViewCell {

    
    @IBOutlet weak var AddressDetailsOutlet: UITextView!
    @IBOutlet weak var imageiconOutlet: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        AddressDetailsOutlet.isEditable = false 
        AddressDetailsOutlet.isSelectable = false
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configureCellEn(add: Address) {
     
        let address = add.address
        let flat = add.flat
        let floor = add.floor
        let house = add.house
        let street = add.street
        let phone = add.phone
        let addressdetails = "\(String(describing: address!)),street:\(String(describing: street!)), house : \(String(describing: house!)), flat : \(String(describing: flat!)), floor : \(String(describing: floor!)), phone: \(String(describing: phone!)) "
       
       
        let url = NSURL(string:"http://studioshayan.ir/wp-content/uploads/2015/04/4i97rLRiE.png")
        
       
        AddressDetailsOutlet.text = addressdetails
        
        }
    
}
