//
//  Add.swift
//  otlob
//
//  Created by yasmeen on 6/30/19.
//  Copyright © 2019 yasmeen. All rights reserved.
//

import Foundation
import FirebaseAuth
class Add{
    private var _id:String!
    private var _Meal_id:String!
    private var _name:String!
    private var _required:Bool!
    
    
    init(id:String, Meal_id:String,required:Bool , name:String) {
        self.id = id
        self.Meal_id = Meal_id
        self.name = name
        self.required = required
       
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
    public var required:Bool!{
        get{
            return _required
        }
        set{
            _required = newValue
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
    
    
    public func addMapper()->[String:Any]{
        var add=[String:Any]()
        add["id"] = self.id
        add["name"] = self.name
        add["required"] = self.required
        add["Meal_id"] = self.Meal_id
      
        return add
    }
    public static func mapToadd(add:[String:Any],key:String)->Add{
        let add = Add(id: add["id"] as! String, Meal_id: add["Meal_id"] as! String, required: add["required"] as! Bool, name: add["name"] as! String)
        
        return add
        
    }
    
}
