//
//  CollabseViewController./Users/yasmeen/Downloads/otlobios/otlob/CollabseViewController.swiftswift
//  otlob
//
//  Created by yasmeen on 5/30/19.
//  Copyright © 2019 yasmeen. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class CollabseViewController: UIViewController {
    
    var ref: DatabaseReference!
    @IBOutlet weak var categoryImage: UIImageView!
    @IBOutlet weak var categoryName: UILabel!
    @IBOutlet weak var CategoryDesc: UILabel!
    
    var categId = " "
    //var subcategId = " "
    var categImage = " "
    var categName = " "
    var categDesc = " "
    var dataHeaders = [String]()
    var data = [DataModelOfCollabseTabel]()
    
    
    @IBOutlet weak var tabelView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tabelView.tableFooterView = UIView()
       
        print(self.categId)
        print(self.categImage)
        // Do any additional setup after loading the view.
        if let url = URL(string: self.categImage){
            do{
                let data = try Data(contentsOf: url)
                categoryImage.image = UIImage(data: data)
            }catch let error{
                print(error.localizedDescription)
            }
        }
        categoryName.text = categName
        CategoryDesc.text = categDesc
        
        ref = Database.database().reference()
        ref.child("Subcategory").observeSingleEvent(of: .value, with: { (snapshot) in
            print(snapshot.value ?? "")
            for child in snapshot.children {
                let snap = child as! DataSnapshot
                let dict = snap.value as! [String: String]
                let catid = dict["category_id"]
                let subcatid = dict["id"]
                let subcatName = dict["name"]
                let desc = dict["disc"]
                let image = dict["image"]
                print(catid ?? " ")
                if catid == self.categId{
                    print("yes\(String(describing: subcatName))")
                   // let itemModel = DataModelOfCollabseTabel(HeaderName: subcatName!, subtype: [], isExpandable: false)
                    let itemModel = DataModelOfCollabseTabel(id: "", name: subcatName!, meals: [], desc: desc, image: image!, Cat_id: catid! ,isExpandable:false)
                
                    self.ref.child("Meals").observeSingleEvent(of: .value, with: { (snapshot) in
                      
                        for child in snapshot.children {
                            
                            let snap = child as! DataSnapshot
                            let dict = snap.value as! [String: String]
                            
                            let subcatidinMeal = dict["subCat_id"]
                            let Mealid = dict["id"]
                            let MealName = dict["name"]
                            let MealPrice = dict["price"]
                            let MealDesc = dict["desc"]
                            let MealImage = dict["image"]
                            
                            if subcatidinMeal == subcatid {
                              print("yes")
                                let itemMeal = Meal(name: MealName!, price: MealPrice!, desc: MealDesc!, image: MealImage!, subCat_id: subcatidinMeal!, id: Mealid!)
                                itemModel.meals.append(itemMeal)
                                //itemModel.subtype.append(MealName!)
                            }else{
                                print("no")
                            }
                        }
                    })
                    self.data.append(itemModel)
                    self.tabelView.reloadData()
                }
            }
            })
        }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
extension CollabseViewController :UITableViewDelegate,UITableViewDataSource{

    

//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let headerView = HeaderView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 50))
//        headerView.delegate = self
//        headerView.secindex = section
//        headerView.btn.setTitle(data[section].name, for: .normal)
//         // headerView.btn.setTitle(data[section].HeaderName, for: .normal)
//
//        return headerView
//    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
        //return data.count
    }
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 50
//    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
//        if data[section].isExpandable{
//            return data[section].meals.count
//        }else {
//            return 0
//        }
       
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = tableView.dequeueReusableCell(withIdentifier: "subcatcell") as! subcatcell
//        let meal = self.data[indexPath.section].meals[indexPath.row]
//        cell.configureCell(meal: meal)
        let category = self.data[indexPath.row]
        cell.SubCategoryNameOutlet.text = category.name
//        let image = category.image
//        if let url = URL(string: image!){
//            do{
//                let data = try Data(contentsOf: url)
//                cell.subcategoryImageOutlet.image = UIImage(data: data)
//            }catch let error{
//                print(error.localizedDescription)
//            }
//        }
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//
//        let cell = tableView.cellForRow(at: indexPath) as! MealCell
//        let vc = storyboard?.instantiateViewController(withIdentifier: "AddToCardViewController") as! AddToCardViewController
//        vc.MealId = cell.id
//        vc.MealName = cell.MealNameOutlet.text!
//        vc.MealPrice = cell.MealPriceOutlet.text!
//        vc.MealDetails = cell.MealDescOutlet.text!
//        vc.MealImage = cell.Mealimageurl
//        self.navigationController?.pushViewController(vc, animated: true)
        let cell = tabelView.cellForRow(at: indexPath) as! subcatcell
        let vc = storyboard?.instantiateViewController(withIdentifier: "MealsTabel") as! MealsTabel
        
        vc.meals = self.data[indexPath.row].meals
        vc.subcatImage = self.data[indexPath.row].image
        vc.subcatName = self.data[indexPath.row].name
        self.navigationController?.pushViewController(vc, animated: true)
    }
    

}
//extension CollabseViewController: headerDelegate{
//    func callHeader(idx: Int) {
//        data[idx].isExpandable = !data[idx].isExpandable
//        tabelView.reloadSections([idx], with: .automatic)
//    }
//
//
//}



