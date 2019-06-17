//
//  HomeTableViewController.swift
//  otlob
//
//  Created by yasmeen on 6/1/19.
//  Copyright © 2019 yasmeen. All rights reserved.
//

import UIKit
import LBTAComponents
import Firebase
import FirebaseDatabase


class HomeTableViewController: UITableViewController {
    //var data = [DataCell]()
    var ref: DatabaseReference!
    @IBOutlet var hometabelview: UITableView!
    var categoryArray:[Category] = [Category]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hometabelview.delegate = self
        hometabelview.dataSource = self
        //set the firebase refrence
        ref = Database.database().reference()
        
        
        let category1 = Category(name: "Eastern meals", desc: "Eastern meals", image: "https://middleeastfoodd.weebly.com/uploads/1/4/1/0/14106618/1005379_orig.jpg", id: "")
        //saveCategory(category: category1)
        
        let category2 = Category(name: "Western Food", desc: "Western Food", image: "https://eatbook.sg/wp-content/uploads/2018/08/Triios-Corner-Food-4-1024x683.jpg", id: "")
        //saveCategory(category: category2)
        
        let category3 = Category(name: "Indian food", desc: "Indian food", image: "https://www.bbcgoodfood.com/sites/default/files/recipe-collections/collection-image/2018/04/saag-paneer.jpg", id: "")
        //saveCategory(category: category3)
        
        let category4 = Category(name: "Chinese food", desc: "Chinese food", image: "https://www.thespruceeats.com/thmb/Nrs7arecTmnmcsNJGvcVB895RmE=/1948x1095/filters:fill(auto,1)/close-up-of-chinese-food-in-cooking-pan-548328747-588bad8d3df78caebc820f53.jpg", id: "")
        //saveCategory(category: category4)
        
        let category5 = Category(name: "Italian food", desc: "Italian food", image: "https://blog.feedspot.com/wp-content/uploads/2017/04/italian-food.jpg", id: "")
        //saveCategory(category: category5)
        //--------------------------------------------
        let subcategory1 = SubCategory(name: "drinks", desc: "drinks", image: "https://static.hussle.com/community/images/750x385/c1540987169.png", category_id: "-LhV3YRMbh5OyM2JO4oK", id: "")
        //saveSubCategory(subcategory: subcategory1)
        
        let subcategory2 = SubCategory(name: "pizza", desc: "pizza", image: "https://rokhjahannama.ir/wp-content/uploads/2018/09/s284287166891139567_p50_i1_w1920.jpeg", category_id: "-LhV3YRMbh5OyM2JO4oK", id: "")
        //saveSubCategory(subcategory: subcategory2)
        
        let subcategory3 = SubCategory(name: "Pasta", desc: "Pasta", image: "https://www.inspiredtaste.net/wp-content/uploads/2018/12/Easy-Pasta-Salad-Recipe-2-1200.jpg", category_id: "-LhV3YRMbh5OyM2JO4oK", id: "")
        //saveSubCategory(subcategory: subcategory3)
        
        let subcategory4 = SubCategory(name: "chickens", desc: "chickens", image: "https://www.tasteofhome.com/wp-content/uploads/2018/01/Crispy-Fried-Chicken_EXPS_FRBZ19_6445_C01_31_3b.jpg", category_id: "-LhV3YRMbh5OyM2JO4oK", id: "")
        //saveSubCategory(subcategory: subcategory4)
        
        let subcategory5 = SubCategory(name: "meats", desc: "meats", image: "https://st3.depositphotos.com/1031681/18195/i/1600/depositphotos_181957498-stock-photo-beef-medallions-grilled-vegetables-board.jpg", category_id: "-LhV3YRMbh5OyM2JO4oK", id: "")
        //saveSubCategory(subcategory: subcategory5)
        //-----------------------------------
        let meal1 = Meal(name: "chocolate truffle cheesecake", price: "60LE", desc: "chocolate-truffle-cheesecake", image: "https://spicysouthernkitchen.com/wp-content/uploads/chocolate-truffle-cheesecake-4.jpg", subCat_id: "-LhV5Z5wqoLVwxzW8xuu", id: " ")
       // saveMeal(meal: meal1)
        let meal2 = Meal(name: "Chocolate-Strawberry-Treats-Dessert-Recipe", price: "60LE", desc: "Chocolate-Strawberry-Treats-Dessert-Recipe", image: "https://www.happyfoodstube.com/wp-content/uploads/2016/02/Chocolate-Strawberry-Treats-Dessert-Recipe.jpg", subCat_id: "-LhV5Z5wqoLVwxzW8xuu", id: " ")
        //saveMeal(meal: meal2)
        let meal3 = Meal(name: "chocolate truffle cheesecake", price: "60LE", desc: "chocolate-truffle-cheesecake", image: "https://spicysouthernkitchen.com/wp-content/uploads/chocolate-truffle-cheesecake-4.jpg", subCat_id: "-LhV5Z5wqoLVwxzW8xuu", id: " ")
        //saveMeal(meal: meal3)
        let meal4 = Meal(name: "chocolate-cheesecake", price: "60LE", desc: "chocolate-cheesecake", image: "https://d2mkh7ukbp9xav.cloudfront.net/recipeimage/tzztrfk8-0cdbe-185943-cfcd2-q9182mes/08de4af2-0835-4cda-8474-ba7196736995/main/all-in-one-strawberry-and-white-chocolate-cheesecake.jpg", subCat_id: "-LhV5Z5wqoLVwxzW8xuu", id: " ")
        //saveMeal(meal: meal4)
        //-------------------------------------------
        let addition1 = Additions(id: "", name: "ice cream", price: "20LE", image: "https://d2gk7xgygi98cy.cloudfront.net/4163-3-large.jpg", required: 1, desc: "ice cream", meal_id: "-LhVH4QTLxHEk257yslq")
        //saveAddition(addition: addition1)
        //---------------------------------------------
        ref.child("category").observeSingleEvent(of: .value, with: { (snapshot) in
            //print("-------------------------------------")
            //print(snapshot.value ?? " ")
            for child in snapshot.children {
                print("-------------------------------")
                print(child)
                let snap = child as! DataSnapshot
                let dict = snap.value as! [String: String]
                let desc = dict["desc"]!
                let id = dict["id"]!
                let image = dict["image"]!
                let name = dict["name"]!
               
                
                print("the bits ------")
                print("address .... \(id)")
                print("flat .... \(desc)")
                print("floor .... \(image)")
                print("phone ........\(name)")

                
               
                
                let categoryObject = Category(name: name, desc: desc, image: image, id: id)
                
                self.categoryArray.append(categoryObject)
                
                
                
                print(self.categoryArray.count)
                self.hometabelview.reloadData()
            }
            
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! HomeCell
       
        let category = self.categoryArray[indexPath.row]
        cell.configureCellEn(category: category)
       
        return cell
        
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return categoryArray.count
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //tableView.deselectRow(at: indexPath, animated: true)
       
        performSegue(withIdentifier: "ShowDetails", sender: self)
    }
    
    public func saveCategory(category: Category){
        let ref = self.ref.child("category")
        let cat = category.categoryMapper()
        let childRef = ref.childByAutoId()
        childRef.setValue(cat)
        category.id = childRef.key
        childRef.child("id").setValue(category.id)
    }
    
    public func saveSubCategory(subcategory: SubCategory){
        let ref = self.ref.child("Subcategory")
        let subcat = subcategory.SubcategoryMapper()
        let childRef = ref.childByAutoId()
        childRef.setValue(subcat)
        subcategory.id = childRef.key
        childRef.child("id").setValue(subcategory.id)
    }
    public func saveMeal(meal: Meal){
        let ref = self.ref.child("Meals")
        let ml = meal.mealMapper()
        let childRef = ref.childByAutoId()
        childRef.setValue(ml)
        meal.id = childRef.key
        childRef.child("id").setValue(meal.id)
    }
    public func saveAddition(addition: Additions){
        let ref = self.ref.child("Additions")
        let ad = addition.additionMapper()
        let childRef = ref.childByAutoId()
        childRef.setValue(ad)
        addition.id = childRef.key
        childRef.child("id").setValue(addition.id)
    }
}
