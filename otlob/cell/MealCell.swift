//
//  MealCell.swift
//  otlob
//
//  Created by yasmeen on 6/17/19.
//  Copyright © 2019 yasmeen. All rights reserved.
//

import UIKit

class MealCell: UITableViewCell {

    @IBOutlet weak var MealImageOutlet: UIImageView!
    @IBOutlet weak var MealNameOutlet: UILabel!
    @IBOutlet weak var MealDescOutlet: UILabel!
    @IBOutlet weak var MealPriceOutlet: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(meal:Meal) {
        let id = meal.id
        let name = meal.name
        let desc = meal.desc
        let image = meal.image
        let price = meal.price
        //let mymeals = category.meals
        if let url = URL(string: image!){
            do{
                let data = try Data(contentsOf: url)
                MealImageOutlet.image = UIImage(data: data)
            }catch let error{
                print(error.localizedDescription)
            }
        }
        MealNameOutlet.text = name
        MealDescOutlet.text = desc
        MealPriceOutlet.text = price
  
    }

}
