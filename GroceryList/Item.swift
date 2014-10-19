//
//  Item.swift
//  GroceryList
//
//  Created by bearclough on 10/5/14.
//  Copyright (c) 2014 bearclough. All rights reserved.
//

import Foundation
import Realm

class Item: RLMObject {
    
    // MARK: Properties
    dynamic var name = ""
    dynamic var quantity = ""
    
    // MARK: Relationship
    dynamic var list = List()
}
