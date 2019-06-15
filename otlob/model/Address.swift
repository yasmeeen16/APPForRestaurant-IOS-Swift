//
//  Address.swift
//  otlob
//
//  Created by yasmeen on 6/11/19.
//  Copyright © 2019 yasmeen. All rights reserved.
//


import Foundation
import FirebaseAuth
class Address{
    private var _id:String!
    private var _phone:String!
    private var _address:String!
    private var _street:String!
    private var _house:String!
    private var _flat:String!
    private var _floor:String!
    private var _otherinstruction:String!
    
    init(phone:String, address:String, street:String, house:String!,flat:String,floor:String , otherinstruction: String ) {
        self.phone = phone
        self.address = address
        self.street = street
        self.house = house
        self.flat = flat
        self.floor = floor
        self.otherinstruction = otherinstruction
        
    }
    
//    public var id:String!{
//        get{
//            return _id
//        }
//        set{
//            _id = newValue
//        }
//    }
    
    public var phone:String!{
        get{
            return _phone
        }
        set{
            _phone = newValue
        }
    }
    public var address:String!{
        get{
            return _address
        }
        set{
            _address = newValue
        }
    }
    public var street:String!{
        get{
            return _street
        }
        set{
            _street = newValue
        }
    }
    public var house:String!{
        get{
            return _house
        }
        set{
            _house = newValue
        }
    }
    
    public var flat:String!{
        get{
            return _flat
        }
        set{
            _flat = newValue
        }
    }
    
    public var floor:String!{
        get{
            return _floor
        }
        set{
            _floor = newValue
        }
    }
    
    public var otherinstruction:String!{
        get{
            return _otherinstruction
        }
        set{
            _otherinstruction = newValue
        }
    }
    public func addressMapper()->[String:Any]{
        var address=[String:Any]()
        //address["id"] = self.id
        address["phone"] = self.phone
        address["address"] = self.address
        address["street"] = self.street
        address["house"] = self.house
        address["flat"] = self.flat
        address["floor"] = self.floor
        address["otherinstruction"] = self.otherinstruction
        return address
    }
    public static func mapToAddress(address:[String:Any],key:String)->Address{
        let address = Address(phone: address["phone"] as! String, address: address["address"] as! String,
                              street: address["street"] as! String, house: address["house"] as! String, flat: address["flat"] as! String, floor: address["floor"] as! String, otherinstruction: address["otherinstruction"] as! String)
        
        return address
    }

}
