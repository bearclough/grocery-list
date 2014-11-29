//
//  CreateItemViewController.swift
//  GroceryList
//
//  Created by bearclough on 11/17/14.
//  Copyright (c) 2014 bearclough. All rights reserved.
//

import Foundation
import UIKit

class CreateItemViewController: UIViewController {
    // MARK: Properties
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var quantityTextField: UITextField!
    @IBOutlet weak var selectDepartmentView: SelectDepartmentView!
    
    var name: String?
    var quantity: String?
    
    // MARK: Initializer
    required init(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        
    }
    
    // MARK: View Life Cycle
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(animated: Bool) {
        
        super.viewWillAppear(animated)
        
    }
    
    override func viewDidAppear(animated: Bool) {
        
        super.viewDidAppear(animated)
        
    }
    
    // MARK: Lifetime
    deinit {
        // deinitialize observers
        
    }
    
    // MARK: Segue Handling
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if let identifier = segue.identifier {
            
            println("Should perform segue with \(identifier)")
            
            switch identifier {
                
            case "createItem":
                println("Preparing for Create Item Segue, name = \(self.name)")
                
            case "cancelCreateItem":
                println("Preparing for Cancel Create Item Segue")
                
            default:
                println("Preparing for \(identifier) Segue")
                
            }
            
        }
    }
    
    override func shouldPerformSegueWithIdentifier(identifier: String?, sender: AnyObject?) -> Bool {
        
        // check if fields are properly filled out for create
        if let identifier = identifier {
            println("Should perform segue with \(identifier)")
            
            switch identifier {
            case "createItem":
                
                if let name = self.nameTextField.text {
                    self.name = name
                }
                
                if let quantity = self.quantityTextField.text {
                    self.quantity = quantity
                }
                
                if (self.name != "") {
                    return true
                }
                
            case "cancelCreateItem":
                return true
            
            default:
                return false
                
            }
        
        }
        
        return false
    }
    
}
