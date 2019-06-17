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
    private var _category_id:String!
    
    init(name:String, desc:String, image:String!, category_id:String ,id: String) {
        self.id = id
        self.name = name
        self.desc = desc
        self.image = image
        self.category_id = category_id
    }
    
        public var id:String!{
            get{
                return _id
            }
            set{
                _id = newValue
            }
        }
    
        public var category_id:String!{
            get{
                return _category_id
            }
            set{
                _category_id = newValue
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
    
    
    
    public func SubcategoryMapper()->[String:Any]{
        var subcategory=[String:Any]()
        subcategory["id"] = self.id
        subcategory["desc"] = self.desc
        subcategory["name"] = self.name
        subcategory["image"] = self.image
        subcategory["category_id"] = self.category_id
        return subcategory
    }
    public static func mapToSubCategory(subcategory:[String:Any],key:String)->SubCategory{
        let Subcategory = SubCategory(name: subcategory["name"] as! String, desc: subcategory["desc"] as! String, image: subcategory["image"] as! String, category_id: subcategory["category_id"] as! String, id: subcategory["id"] as! String)
        
        return Subcategory
    }
    
}
