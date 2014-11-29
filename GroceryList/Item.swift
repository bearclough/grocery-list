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
    dynamic var department = ""
    dynamic var priority = ""
    
    // MARK: Relationship
    dynamic var list = List()
    
}

enum Priority: String {
    case Urgent = "urgent"
    case Default = "default"
}

enum Department: String {
    case Produce = "produce"
    case Meat = "meat"
    case Dairy = "dairy"
    case General = "general"
    case FozenFood = "frozen food"
    case PersonalCare = "personal care"
    
    static let allValues = [Produce, Meat, Dairy, FozenFood, PersonalCare, General]
}



