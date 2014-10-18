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
    dynamic var name: String = ""
    dynamic var store: String = ""
    
    dynamic var items = RLMArray(objectClassName: Item.className())
    
    /*init(name: String, store: String) {
        self.name = name
        self.store = store
        
        super.init()
    }*/
    
    
    
    /*dynamic let createDate: NSDate
    
    init(name: String) {
        self.name = name
        self.createDate = NSDate();
    }*/
    
}

