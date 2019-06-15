//
//  Category.swift
//  otlob
//
//  Created by yasmeen on 6/15/19.
//  Copyright © 2019 yasmeen. All rights reserved.
//

import Foundation
import FirebaseAuth
class Category{
    private var _id:String!
    private var _name:String!
    private var _desc:String!
    private var _image:String!
    
    
    init(name:String, desc:String, image:String!) {
        self.name = name
        self.desc = desc
        self.image = image
        
    }
    
    //    public var id:String!{
    //        get{
    //            return _id
    //        }
    //        set{
    //            _id = newValue
    //        }
    //    }
    
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

    
    
    public func categoryMapper()->[String:Any]{
        var category=[String:Any]()
        category["desc"] = self.desc
        category["name"] = self.name
        category["image"] = self.image
        return category
    }
    public static func mapToCategory(category:[String:Any],key:String)->Category{
        let category = Category(name: category["name"] as! String, desc: category["desc"] as! String, image: category["image"] as! String)
        
        return category
    }
    
}
