//
//  DataModelOfCollabseTabel.swift
//  otlob
//
//  Created by yasmeen on 5/30/19.
//  Copyright © 2019 yasmeen. All rights reserved.
//

import Foundation
class DataModelOfCollabseTabel {
    var HeaderName : String?
    var subtype = [String]()
    var isExpandable : Bool = false
    init(HeaderName : String,subtype: [String], isExpandable :Bool){
        self.HeaderName = HeaderName
        self.subtype = subtype
        self.isExpandable = isExpandable
        
    }
}
