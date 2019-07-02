//
//  File.swift
//  otlob
//
//  Created by yasmeen on 6/25/19.
//  Copyright © 2019 yasmeen. All rights reserved.
//

import Foundation
import FirebaseAuth
class Services{
    private var _id:String!
    private var _name:String!

    
    init(name:String,id:String!) {
        self.id = id
        self.name = name
      
    }
    
    public var id:String!{
        get{
            return _id
        }
        set{
            _id = newValue
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

    
    public func serviceMapper()->[String:Any]{
        var service=[String:Any]()
        service["id"] = self.id
        service["name"] = self.name
        return service
    }
    public static func mapToservice(service:[String:Any],key:String)->Services{
        let service = Services(name: service["name"] as! String, id: service["id"] as! String)
        
        return service
    }
    
}
