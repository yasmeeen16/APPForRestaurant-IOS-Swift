//
//  HomeCell.swift
//  otlob
//
//  Created by yasmeen on 6/15/19.
//  Copyright © 2019 yasmeen. All rights reserved.
//

import UIKit


class HomeCell: UITableViewCell {

    @IBOutlet weak var categorynameOutlet: UILabel!
    @IBOutlet weak var imageCell: UIImageView!
    @IBOutlet weak var categoryDescOutlet: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCellEn(category: Category) {
        
        let id = category.id
        let name = category.name
        let desc = category.desc
        let image = category.image
        if let url = URL(string: image!){
            do{
                let data = try Data(contentsOf: url)
                imageCell.image = UIImage(data: data)
            }catch let error{
                print(error.localizedDescription)
            }
        }
        
    
       
        categorynameOutlet.text = name
        categoryDescOutlet.text = desc
       
       
    }

}
