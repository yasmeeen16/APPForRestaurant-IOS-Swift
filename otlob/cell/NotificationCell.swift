//
//  NotificationCell.swift
//  otlob
//
//  Created by yasmeen on 6/24/19.
//  Copyright © 2019 yasmeen. All rights reserved.
//

import UIKit

class NotificationCell: UITableViewCell {

    @IBOutlet weak var ImageNotificationOutlet: UIImageView!
    
    @IBOutlet weak var textNotificationOutlet: UITextView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configureCellEn(notification : Notifications) {
        
        let id = notification.id
        let image = notification.NotificationImage
        if let url = URL(string: image!){
            do{
                let data = try Data(contentsOf: url)
                ImageNotificationOutlet.image = UIImage(data: data)
            }catch let error{
                print(error.localizedDescription)
            }
        }
       textNotificationOutlet.text = notification.NotificationText
        
        
    }
}
