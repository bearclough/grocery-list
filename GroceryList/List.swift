//
//  List.swift
//  GroceryList
//
//  Created by bearclough on 10/5/14.
//  Copyright (c) 2014 bearclough. All rights reserved.
//

import Foundation
import Realm

class List: RLMObject {
    dynamic var name = ""
    dynamic var store = ""
    dynamic var items = RLMArray(objectClassName: Item.className())
    dynamic let createDate: NSDate
    
    init(name: String) {
        self.name = name
        self.createDate = NSDate();

    }
    
}

