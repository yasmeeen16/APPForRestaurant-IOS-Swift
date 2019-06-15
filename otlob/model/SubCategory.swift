//
//  SubCategory.swift
//  otlob
//
//  Created by yasmeen on 6/15/19.
//  Copyright © 2019 yasmeen. All rights reserved.
//

import Foundation
import FirebaseAuth
class SubCategory{
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
    
    
    
    public func SubcategoryMapper()->[String:Any]{
        var subcategory=[String:Any]()
        subcategory["desc"] = self.desc
        subcategory["name"] = self.name
        subcategory["image"] = self.image
        return subcategory
    }
    public static func mapToSubCategory(subcategory:[String:Any],key:String)->SubCategory{
        let Subcategory = SubCategory(name: subcategory["name"] as! String, desc: subcategory["desc"] as! String, image: subcategory["image"] as! String)
        
        return Subcategory
    }
    
}
