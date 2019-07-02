//
//  AddChoice.swift
//  otlob
//
//  Created by yasmeen on 6/30/19.
//  Copyright © 2019 yasmeen. All rights reserved.
//

import Foundation
class AddChoice{
    private var _id:String!
    private var _price:String!
    private var _name:String!
    private var _Add_id:String!
    private var _selected:Bool!
    
    init(id:String, Add_id:String,price: String , name:String ,selected : Bool) {
        self.id = id
        self.Add_id = Add_id
        self.name = name
        self.price = price
        self.selected = selected
    }
    
    public var selected:Bool!{
        get{
            return _selected
        }
        set{
            _selected = newValue
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
    
    public var price:String!{
        get{
            return _price
        }
        set{
            _price = newValue
        }
    }
    public var Add_id:String!{
        get{
            return _Add_id
        }
        set{
            _Add_id = newValue
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
    
    
    public func AddchoiceMapper()->[String:Any]{
        var add=[String:Any]()
        add["id"] = self.id
        add["name"] = self.name
        add["price"] = self.price
        add["Add_id"] = self.Add_id
        add["selected"] = self.selected
        return add
    }
    public static func mapToAddChoice(add:[String:Any],key:String)->AddChoice{
        let add = AddChoice(id: add["id"] as! String, Add_id: add["Add_id"] as! String, price: add["price"] as! String, name: add["name"] as! String, selected:  add["selected"] as! Bool)
        
        return add
        
    }
    
}
