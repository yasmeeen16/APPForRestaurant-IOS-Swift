//
//  AddToCardViewController.swift
//  otlob
//
//  Created by yasmeen on 6/1/19.
//  Copyright © 2019 yasmeen. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class AddToCardViewController: UIViewController, UITextViewDelegate ,UITableViewDelegate, UITableViewDataSource, ExpandableHeaderForAdditionDelegate {

    var ref: DatabaseReference!
    @IBOutlet weak var MealImageOutlet: UIImageView!
    @IBOutlet weak var MealPriceOutlet: UILabel!
    @IBOutlet weak var MealNameOutlet: UILabel!
    @IBOutlet weak var DetailsOutlet: UITextView!
    @IBOutlet weak var AddToCardOutlet: UIButton!
    @IBOutlet weak var orderNumber: UILabel!
    @IBOutlet weak var BackgroundViewOfText: UIView!
    @IBOutlet weak var ShowInstructionOutlet: UIButton!
    @IBOutlet weak var textviewField: UITextView!
    
    @IBOutlet weak var tableHeight: NSLayoutConstraint!
    
    
    
    @IBOutlet weak var tableviewAdditions: UITableView!
    
    var flagToShoworder = 0
    var MealId = " "
    var MealName = " "
    var MealPrice = " "
    var MealDetails = " "
    var MealImage = " "
    var arrayOfAdditions = [" "," "," "," "," "," "," "," "," "," "," "]
    var arrayAddedInFirebase = [String]()
    var sections = [AdditionSection]()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableviewAdditions.delegate = self
        tableviewAdditions.dataSource = self
        
        
        //mark to set the table hieght programically
        tableHeight.constant = CGFloat(100)
        
       
        ref = Database.database().reference()
        print(MealId)
        ref.child("add").queryOrdered(byChild: "mealId").queryEqual(toValue: self.MealId).observeSingleEvent(of: .value, with: { (snapshot) in
                        for child in snapshot.children {
                            
                            print(self.MealId)
                            print(child)
                            let snap = child as! DataSnapshot
                            let dict = snap.value as! [String: String]
                            let id = dict["id"]
                            let name = dict["name"]
                            let mealId = dict["mealId"]
                            let required = dict["required"]
                            
                            var sectionItem = AdditionSection(add: Add(id: id!, Meal_id: mealId!, required: (required != nil), name: name!), addchoice: [], Expandable: false)
                            self.ref.child("AddChoice").queryOrdered(byChild: "addId").queryEqual(toValue: id).observeSingleEvent(of: .value, with: { (snapshot) in
                                 for child in snapshot.children {
                                    let snap = child as! DataSnapshot
                                    let dict = snap.value as! [String: String]
                                    let id = dict["id"]
                                    let name = dict["name"]
                                    let price = dict["price"]
                                    let addId = dict["addId"]
                                    let addchoiceitem = AddChoice(id: id!, Add_id: addId!, price: price!, name: name!, selected: false)
                                    sectionItem.addchoice.append(addchoiceitem)
                                }
                                print(sectionItem.addchoice.count)
                                self.sections.append(sectionItem)
                                self.tableviewAdditions.reloadData()
                            })
                            }
        })

        textviewField.text = "Placeholder"
        textviewField.textColor = UIColor.lightGray
        DetailsOutlet.isEditable = false
        DetailsOutlet.isSelectable = false
        DetailsOutlet.text = self.MealDetails
        MealNameOutlet.text = self.MealName
        MealPriceOutlet.text = self.MealPrice
        if let url = URL(string: MealImage){
            do{
                let data = try Data(contentsOf: url)
                MealImageOutlet.image = UIImage(data: data)
            }catch let error{
                print(error.localizedDescription)
            }
        }        // Do any additional setup after loading the view.
    }
    
    


    @IBAction func ShowInstructionsAction(_ sender: Any) {
        ///menuoutlet.titleLabel?.text = (sender as AnyObject).titleLabel??.text
        UIView.animate(withDuration: 0.25, animations:{
            self.BackgroundViewOfText.isHidden = !self.BackgroundViewOfText.isHidden
            self.textviewField.isHidden = !self.textviewField.isHidden
            self.view.layoutIfNeeded()
            
        })

        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textviewField.textColor == UIColor.lightGray {
            textView.text = nil
            textviewField.textColor = UIColor.black
        }
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        if textviewField.text.isEmpty {
            textviewField.text = "Placeholder"
            textviewField.textColor = UIColor.lightGray
        }
    }
    
  
    
    @IBAction func AddToCardAction(_ sender: Any) {
        if self.flagToShoworder == 0{
            print(self.MealId)
            print(Int(self.MealPrice) ?? 0)
            print(self.textviewField.text)
            print(Int(orderNumber.text!) ?? 0)
            let userID = Auth.auth().currentUser?.uid
            for a in arrayOfAdditions{
                if a != " "{
                  arrayAddedInFirebase.append(a)
                }
                
            }
            let or = Orders(id: " ", Meal_id: self.MealId, price:self.MealPrice, numberofMeals: Int(orderNumber.text!)!, user_id: userID! ,additions_ids : self.arrayAddedInFirebase)
            saveOrder(order: or)
        AddToCardOutlet.setTitle("Show order", for: .normal)
          
        }else{
            //performSegue(withIdentifier: "ShowMyOrder", sender: self)
            let vc = storyboard?.instantiateViewController(withIdentifier: "OrdersViewController") as! OrdersViewController
            vc.latestOrder = self.MealName
             self.navigationController?.pushViewController(vc, animated: true)
        }
       
    }
    
    @IBAction func ShoworderAction(_ sender: Any) {
        
        self.flagToShoworder = 1

    }
    @IBAction func ReduceOrderAction(_ sender: Any) {
        if Int(orderNumber.text!)! - 1 > 0{
        orderNumber.text = String(Int(orderNumber.text!)! - 1)
        }
    }
    
    @IBAction func IncreaseOrderAction(_ sender: Any) {
        orderNumber.text = String(Int(orderNumber.text!)! + 1)
        
    }
    public func saveOrder(order: Orders){
        let ref = self.ref.child("Orders")
        let or = order.orderMapper()
        let childRef = ref.childByAutoId()
        childRef.setValue(or)
        order.id = childRef.key
        childRef.child("id").setValue(order.id)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].addchoice.count
    }
   
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if(sections[indexPath.section].Expandable){
            return 44
        }else{
            return 0
        }
        
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 2
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?{
        let head = ExpandableHeaderForAddition()
        head.custumInit(title: sections[section].add.name, section: section, delegate: self)
        return head
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableviewAdditions.dequeueReusableCell(withIdentifier: "labelcell") as! additioncell
        cell.additionlabel.text = sections[indexPath.section].addchoice[indexPath.row].name
        cell.PriceOutlet.text = sections[indexPath.section].addchoice[indexPath.row].price
        //cell.textLabel?.text = sections[indexPath.section].addchoice[indexPath.row].name
        cell.chechbuttonOutlet.isSelected = sections[indexPath.section].addchoice[indexPath.row].selected
        cell.chechbuttonOutlet.addTarget(self, action: #selector(checkMarkButtonclicked(sender :)), for: .touchUpInside)
        return cell
    }
    @objc func checkMarkButtonclicked(sender : UIButton) {
      //sender.isSelected = !sender.isSelected
       
    }

    func ToggleSection(Header: ExpandableHeaderForAddition, section: Int) {
        sections[section].Expandable = !sections[section].Expandable
        tableviewAdditions.beginUpdates()
        for i in 0 ..< sections[section].addchoice.count {
            tableviewAdditions.reloadRows(at: [IndexPath(row : i,section: section )], with: .automatic)
        }
        tableviewAdditions.endUpdates()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (tableviewAdditions.cellForRow(at: indexPath) as? additioncell) != nil{
            let cell = tableviewAdditions.cellForRow(at: indexPath) as? additioncell
            
            for i in sections[indexPath.section].addchoice {
                let m = sections[indexPath.section].addchoice[indexPath.row]
                if i.id == m.id{
                    sections[indexPath.section].addchoice[indexPath.row].selected = !sections[indexPath.section].addchoice[indexPath.row].selected
                    if sections[indexPath.section].addchoice[indexPath.row].selected == true{
                        print(sections[indexPath.section].addchoice[indexPath.row].id)
                        print(indexPath.section)
                        self.arrayOfAdditions[indexPath.section] = (sections[indexPath.section].addchoice[indexPath.row].id)
                        print(arrayOfAdditions)
                    }else{
                        //self.arrayOfAdditions.removeLast()
                        print(arrayOfAdditions)
                    }
                }else{
                    i.selected = false
                }
            }
            
            
            tableviewAdditions.beginUpdates()
            for i in 0 ..< sections[indexPath.section].addchoice.count {
                tableviewAdditions.reloadRows(at: [IndexPath(row : i,section: indexPath.section )], with: .automatic)
            }
            tableviewAdditions.endUpdates()
            
            //cell?.chechbuttonOutlet.isSelected = !(cell?.chechbuttonOutlet.isSelected)!
            
        }
        }
}








