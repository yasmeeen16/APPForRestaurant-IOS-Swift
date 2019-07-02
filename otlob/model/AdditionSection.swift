//
//  AdditionSection.swift
//  otlob
//
//  Created by yasmeen on 6/30/19.
//  Copyright © 2019 yasmeen. All rights reserved.
//

import Foundation
struct AdditionSection {
    var add : Add
    var addchoice : [AddChoice]
    var Expandable : Bool
    
    init(add : Add , addchoice : [AddChoice] , Expandable : Bool) {
        self.add = add
        self.addchoice = addchoice
        self.Expandable = Expandable
    }
}
