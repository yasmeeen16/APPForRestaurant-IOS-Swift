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
    
    init(name:String, price:String, image:String!, required:NSNumber!, desc:String!) {
        self.name = name
        self.desc = desc
        self.image = image
        self.price = price
        self.required = required
        
    }
    
    //    public var id:String!{
    //        get{
    //            return _id
    //        }
    //        set{
    //            _id = newValue
    //        }
    //    }
  
    
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
        addition["desc"] = self.desc
        addition["name"] = self.name
        addition["image"] = self.image
        addition["price"] = self.price
        addition["required"] = self.required
        return addition
    }
    public static func mapToAddition(addition:[String:Any],key:String)->Additions{
        let addition = Additions(name: addition["name"] as! String, price: addition["price"] as! String, image: addition["image"] as! String, required: addition["required"] as! NSNumber, desc: addition["desc"] as! String)
        
        return addition
    }
    
}
