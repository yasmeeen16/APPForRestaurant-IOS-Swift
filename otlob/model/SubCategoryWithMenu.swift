//
//  SubCategoryWithMenu.swift
//  otlob
//
//  Created by yasmeen on 6/17/19.
//  Copyright © 2019 yasmeen. All rights reserved.
//

import Foundation
import FirebaseAuth

class SubCategoryWithMenu{
    private var _id:String!
    private var _name:String!
    private var _meals:[Meal]!
    private var _desc:String!
    private var _image:String!
    private var _Cat_id:String!
    
    init(id:String, name:String, meals:[Meal], desc:String!, image:String ,Cat_id:String) {
        self.id = id
        self.name = name
        self.meals = meals
        self.desc = desc
        self.image = image
        self.Cat_id = Cat_id
    }
    
    public var id:String!{
        get{
            return _id
        }
        set{
            _id = newValue
        }
    }
    
    public var Cat_id:String!{
        get{
            return _Cat_id
        }
        set{
            _Cat_id = newValue
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
    public var meals:[Meal]!{
        get{
            return _meals
        }
        set{
            _meals = newValue
        }
    }
    
    
    public func subCategoryWithMenuMapper()->[String:Any]{
        var subcatWithMeunu=[String:Any]()
        subcatWithMeunu["id"] = self.id
        subcatWithMeunu["name"] = self.name
        subcatWithMeunu["desc"] = self.desc
        subcatWithMeunu["image"] = self.image
        subcatWithMeunu["Cat_id"] = self.Cat_id
        subcatWithMeunu["meals"] = self.meals
        
        return subcatWithMeunu
    }

    
}
