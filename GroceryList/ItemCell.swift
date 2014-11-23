//
//  ItemCell.swift
//  GroceryList
//
//  Created by bearclough on 11/20/14.
//  Copyright (c) 2014 bearclough. All rights reserved.
//

import Foundation
import UIKit

class ItemCell : MGSwipeTableCell {
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var quantity: UILabel!
    
    
    required init(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
    }
    
    func configureForItem(name: String?, quantity: String?, priority: String?) {
        
        
        if let itemName = name {
            self.name.text = itemName
        }
        else {
            self.name.text = ""
        }
        
        if let itemQuantity = quantity {
            self.quantity.text = itemQuantity
        }
        else {
            self.quantity.text = ""
        }
        
        // determine image or color to display high priority
        
        // configure for swipe
        //self.configureForSwipe()
        
    }
    
    func configureForSwipe() {
        
        // TODO put in imgae for Got It!
        var leftButton = MGSwipeButton(title: "Got It!", backgroundColor: Colors().jade)
        self.leftButtons = [ leftButton ]
        self.leftSwipeSettings.transition = MGSwipeTransition.TransitionDrag
        
    }
    
    
}




