//
//  Meal.swift
//  otlob
//
//  Created by yasmeen on 6/15/19.
//  Copyright © 2019 yasmeen. All rights reserved.
//

import Foundation
import FirebaseAuth
class Meal{
    private var _id:String!
    private var _name:String!
    private var _price:String!
    private var _desc:String!
    private var _image:String!
    private var _subCat_id:String!
    
    init(name:String, price:String, desc:String, image:String!, subCat_id:String ,id:String) {
        self.id = id
        self.name = name
        self.price = price
        self.desc = desc
        self.image = image
        self.subCat_id = subCat_id
    }
    
        public var id:String!{
            get{
                return _id
            }
            set{
                _id = newValue
            }
        }
    
    public var subCat_id:String!{
        get{
            return _subCat_id
        }
        set{
            _subCat_id = newValue
        }
    }
    public var name:String!{
        get{
            return _name
        }
        set{
            _name = newValue
        }
    }
    public var desc:String!{
        get{
            return _desc
        }
        set{
            _desc = newValue
        }
    }
    public var image:String!{
        get{
            return _image
        }
        set{
            _image = newValue
        }
    }
    public var price:String!{
        get{
            return _price
        }
        set{
            _price = newValue
        }
    }
    

    public func mealMapper()->[String:Any]{
        var meal=[String:Any]()
        meal["id"] = self.id
        meal["name"] = self.name
        meal["price"] = self.price
        meal["image"] = self.image
        meal["desc"] = self.desc
        meal["subCat_id"] = self.subCat_id
        return meal
    }
    public static func mapToMeal(meal:[String:Any],key:String)->Meal{
        let meal = Meal(name: meal["name"] as! String, price: meal["price"] as! String, desc: meal["desc"] as! String, image: meal["image"] as! String, subCat_id: meal["subCat_id"] as! String, id: meal["id"] as! String)
        
        return meal
    }
    
}
