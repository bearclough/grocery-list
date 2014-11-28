//
//  User.swift
//  GroceryList
//
//  Created by bearclough on 11/23/14.
//  Copyright (c) 2014 bearclough. All rights reserved.
//

import Foundation
import Realm

class User : RLMObject {
    
    // MARK: Properties
    dynamic var userName: String = ""
    dynamic var firstName: String = ""
    dynamic var lastName: String = ""
    dynamic var email: String = ""
    dynamic var avatar: NSData = NSData()
    
    
    // MARK: Relationships
    dynamic var ownedLists = RLMArray(objectClassName: List.className())
    dynamic var allowedLists = RLMArray(objectClassName: List.className())
    dynamic var fellowShoppers = RLMArray(objectClassName: User.className())
    
    override class func primaryKey() -> String {
        return "userName"
    }
    
    
}