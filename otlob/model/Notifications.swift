//
//  Notifications.swift
//  otlob
//
//  Created by yasmeen on 6/24/19.
//  Copyright © 2019 yasmeen. All rights reserved.
//



import Foundation
import FirebaseAuth
class Notifications{
    private var _id:String!
    private var _NotificationText:String!
    private var _NotificationImage:String!

    
    init(id:String, NotificationText:String, NotificationImage:String) {
        self.id = id
        self.NotificationImage = NotificationImage
        self.NotificationText = NotificationText
    }
    
    
    public var id:String!{
        get{
            return _id
        }
        set{
            _id = newValue
        }
    }
    
    public var NotificationText:String!{
        get{
            return _NotificationText
        }
        set{
            _NotificationText = newValue
        }
    }
    public var NotificationImage:String!{
        get{
            return _NotificationImage
        }
        set{
            _NotificationImage = newValue
        }
    }

    
    public func NotificationMapper()->[String:Any]{
        var notification=[String:Any]()
        notification["id"] = self.id
        notification["NotificationText"] = self.NotificationText
        notification["NotificationImage"] = self.NotificationImage
        
        return notification
    }
    public static func mapToNotification(notification:[String:Any],key:String)->Notifications{
        let notification = Notifications(id: notification["id"] as! String, NotificationText: notification["NotificationText"] as! String , NotificationImage: notification["NotificationImage"] as! String)
        
        return notification
        
    }
    
}
