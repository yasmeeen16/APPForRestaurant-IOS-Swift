//
//  Orders.swift
//  otlob
//
//  Created by yasmeen on 6/22/19.
//  Copyright © 2019 yasmeen. All rights reserved.
//

import Foundation
import FirebaseAuth
class Orders{
    private var _id:String!
    private var _Meal_id:String!
    private var _price:String!
    private var _numberofMeals:Int!
    private var _user_id:String = " "
    private var _additions_ids = [String]()
    init(id:String, Meal_id:String, price:String, numberofMeals:Int , user_id:String, additions_ids:[String]) {
        self.id = id
        self.Meal_id = Meal_id
        self.price = price
        self.numberofMeals = numberofMeals
        self.user_id = user_id
        self.additions_ids = additions_ids
    }
    public var additions_ids:[String]!{
        get{
            return _additions_ids
        }
        set{
            _additions_ids = newValue
        }
    }
    public var user_id:String!{
        get{
            return _user_id
        }
        set{
            _user_id = newValue
        }
    }
    
    public var id:String!{
        get{
            return _id
        }
        set{
            _id = newValue
        }
    }
    
    public var Meal_id:String!{
        get{
            return _Meal_id
        }
        set{
            _Meal_id = newValue
        }
    }
    public var numberofMeals:Int!{
        get{
            return _numberofMeals
        }
        set{
            _numberofMeals = newValue
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
    
    
    public func orderMapper()->[String:Any]{
        var order=[String:Any]()
        order["id"] = self.id
        order["price"] = self.price
        order["numberofMeals"] = self.numberofMeals
        order["Meal_id"] = self.Meal_id
        order["user_id"] = self.user_id
        order["additions_ids"] = self.additions_ids
        return order
    }
    public static func mapToMeal(order:[String:Any],key:String)->Orders{
        let order = Orders(id: order["id"] as! String, Meal_id: order["Meal_id"] as! String, price: order["price"] as! String, numberofMeals: order["numberofMeals"] as! Int, user_id: order["user_id"] as! String, additions_ids: order["additions_ids"] as! [String])
        
        return order
        
    }
    
}
