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

        ref.child("category").observeSingleEvent(of: .value, with: { (snapshot) in
           
            for child in snapshot.children {
                print(child)
                let snap = child as! DataSnapshot
                let dict = snap.value as! [String: String]
                let desc = dict["desc"]!
                let id = dict["id"]!
                let image = dict["image"]!
                let name = dict["name"]!
                
                let categoryObject = Category(name: name, desc: desc, image: image, id: id)
                self.categoryArray.append(categoryObject)
            }
            self.hometabelview.reloadData()
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
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return categoryArray.count
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //tableView.deselectRow(at: indexPath, animated: true)
       let categoryid = self.categoryArray[indexPath.row].id
        let vc = storyboard?.instantiateViewController(withIdentifier: "CollabseViewController") as! CollabseViewController
        vc.categId = categoryid!
        vc.categImage = self.categoryArray[indexPath.row].image!
        vc.categName = self.categoryArray[indexPath.row].name!
        vc.categDesc = self.categoryArray[indexPath.row].desc!
        self.navigationController?.pushViewController(vc, animated: true)
        //performSegue(withIdentifier: "ShowDetails", sender: self)
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
    public func saveAdditionSizes(addition: Additions){
        let ref = self.ref.child("Additions")
        let ad = addition.additionMapper()
        let childRef = ref.childByAutoId()
        childRef.setValue(ad)
        addition.id = childRef.key
        childRef.child("id").setValue(addition.id)
    }
    public func saveNotification(notification: Notifications){
        let ref = self.ref.child("Notifications")
        let not = notification.NotificationMapper()
        let childRef = ref.childByAutoId()
        childRef.setValue(not)
        notification.id = childRef.key
        childRef.child("id").setValue(notification.id)
    }
    public func saveService(service: Services){
        let ref = self.ref.child("Services")
        let ser = service.serviceMapper()
        let childRef = ref.childByAutoId()
        childRef.setValue(ser)
        service.id = childRef.key
        childRef.child("id").setValue(service.id)
    }
}
