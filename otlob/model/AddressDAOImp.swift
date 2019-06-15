//
//  addressDAOImp.swift
//  otlob
//
//  Created by yasmeen on 6/11/19.
//  Copyright © 2019 yasmeen. All rights reserved.
//



import Foundation
import Firebase
import FirebaseDatabase
class AddressDAOImp {
    private var ref: DatabaseReference
    private let node = "users"
    var Users:[Address] = [Address]()
    init(databaseReference ref: DatabaseReference,id:String){
        self.ref = ref.child(node).child(id)
    }
    public func saveUser(address: Address){
        let ad = address.addressMapper()
        let childRef = ref
        childRef.setValue(ad)
       // address.id=childRef.key
        //childRef.child("id").setValue(user.id)
    }
//    public func getAddress(addressId:String) -> Address{
//        var user = User(email: "", id: ""
//            , name: "", phone: "", token: "", photoUrl: "")
//        ref.child(userId).observeSingleEvent(of: .value, with: { (snapshot) in
//            var name = ""
//            var email = ""
//            var phone = ""
//            var token = ""
//            var photoUrl = ""
//            // Get user value
//            let data = snapshot.value as? [String:Any]
//            for (key,value) in data! {
//                if key == "name" {
//                    name = value as! String
//                }
//                if key == "email" {
//                    email = value as! String
//                }
//                if key == "phone" {
//                    phone = value as! String
//                }
//                if key == "token" {
//                    token = value as! String
//                }
//                if key == "photoUrl" {
//                    photoUrl = value as! String
//                }
//            }
//            user = User(email: email, id: userId
//                , name: name, phone: phone, token: token, photoUrl: photoUrl)
//        }) { (error) in
//            print(error.localizedDescription)
//        }
//        return user
//    }
//    static var FirebaseToken : String? {
//        return InstanceID.instanceID().token()
//    }
}
