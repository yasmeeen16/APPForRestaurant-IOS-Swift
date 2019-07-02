//
//  MealsTabel.swift
//  otlob
//
//  Created by yasmeen on 6/23/19.
//  Copyright © 2019 yasmeen. All rights reserved.
//

import UIKit

class MealsTabel: UIViewController , UITableViewDelegate , UITableViewDataSource{
    
    @IBOutlet weak var SubcatImageOutlet: UIImageView!
    
    @IBOutlet weak var subCategoryNameOutlet: UILabel!
    var meals = [Meal]()
    var subcatImage = ""
    var subcatName = ""
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.meals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mcell") as! MealCellV2
        let meal = self.meals[indexPath.row]
        cell.MealNameOutlet.text = meal.name
        cell.MealDescOutlet.text = meal.desc
        cell.MealPriceOutlet.text = meal.price
        let image = meal.image
        if let url = URL(string: image!){
            do{
                let data = try Data(contentsOf: url)
                cell.MealImageOutlet.image = UIImage(data: data)
            }catch let error{
                print(error.localizedDescription)
            }
        }
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.subCategoryNameOutlet.text = subcatName
        
        let image = subcatImage
        if let url = URL(string: image){
            do{
                let data = try Data(contentsOf: url)
                self.SubcatImageOutlet.image = UIImage(data: data)
            }catch let error{
                print(error.localizedDescription)
            }
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
                let cell = tableView.cellForRow(at: indexPath) as! MealCellV2
                let vc = storyboard?.instantiateViewController(withIdentifier: "AddToCardViewController") as! AddToCardViewController
                vc.MealId = self.meals[indexPath.row].id
                vc.MealName = self.meals[indexPath.row].name
                vc.MealPrice = self.meals[indexPath.row].price
                vc.MealDetails = self.meals[indexPath.row].desc
                vc.MealImage = self.meals[indexPath.row].image
                self.navigationController?.pushViewController(vc, animated: true)
        
    }
}
