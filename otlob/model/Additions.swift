//
//  Additions.swift
//  otlob
//
//  Created by yasmeen on 6/15/19.
//  Copyright © 2019 yasmeen. All rights reserved.
//

import Foundation
import FirebaseAuth
class Additions{
    private var _id:String!
    private var _name:String!
    private var _price:String!
    private var _required:NSNumber!
    private var _image:String!
    private var _desc:String!
    private var _meal_id:String!
    private var _size:String!
    
    
    init(id:String, name:String, price:String, image:String!, required:NSNumber!, desc:String!, meal_id:String) {
        self.name = name
        self.desc = desc
        self.image = image
        self.price = price
        self.required = required
        self.meal_id = meal_id
        
    }
    init(size:String , price:String , meal_id:String) {
        self.size = size
        self.price = price
        self.meal_id = meal_id
    }
    
    public var size :String!{
        get{
            return _size
        }
        set{
            _size = newValue
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
  
    public var meal_id:String!{
        get{
            return _meal_id
        }
        set{
            _meal_id = newValue
        }
    }
    public var required:NSNumber!{
        get{
            return _required
        }
        set{
            _required = newValue
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
    
    
    
    public func additionMapper()->[String:Any]{
        var addition=[String:Any]()
        addition["id"] = self.id
        addition["desc"] = self.desc
        addition["name"] = self.name
        addition["image"] = self.image
        addition["price"] = self.price
        addition["required"] = self.required
        addition["meal_id"] = self.meal_id
        return addition
    }
    public func additionSize()->[String:Any]{
        var addition=[String:Any]()
        addition["size"] = self.size
        addition["price"] = self.price
        addition["meal_id"] = self.meal_id
        return addition
    }
    public static func mapToAddition(addition:[String:Any],key:String)->Additions{
        let addition = Additions(id: addition["id"] as! String, name: addition["name"] as! String, price: addition["price"] as! String, image: addition["image"] as! String, required: addition["required"] as! NSNumber, desc: addition["desc"] as! String, meal_id: addition["meal_id"] as! String)
        
        return addition
    }
    public static func mapToAdditionsize(addition:[String:Any],key:String)->Additions{
        let addition = Additions(size: addition["size"] as! String, price: addition["price"] as! String , meal_id: addition["meal_id"] as! String)
        
        return addition
    }
}
