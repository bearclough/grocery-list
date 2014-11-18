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
    
    // MARK: Properties
    dynamic var name: String = ""
    dynamic var store: String = ""
    
    // MARK: Relationships
    dynamic var items = RLMArray(objectClassName: Item.className())
    
    override class func primaryKey() -> String {
        return "name"
    }
}

