//
//  CreateListViewController.swift
//  GroceryList
//
//  Created by bearclough on 10/19/14.
//  Copyright (c) 2014 bearclough. All rights reserved.
//

import Foundation
import UIKit

class CreateListViewController: UIViewController {
    
    // MARK: Properties
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var storeTextField: UITextField!
    
    var name: String?
    var store: String?
    
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
        
        // handle prepare for segue
        if let identifier = segue.identifier {
            
            switch identifier {
                
            case "createList":
                println("Preparing for Create List Segue, name = \(self.name), store = \(self.store)")
                
            case "cancelCreateList":
                println("Preparing for Cancel Create List Segue")
                
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
                
            case "createList":
                
                if let name = self.nameTextField.text { self.name = name }
                
                if let store = self.storeTextField.text {self.store = store }
                
                if (self.name != nil) {
                    return true;
                }
                
            case "cancelCreateList":
                return true
                
            default:
                return false
            }
            
        }
        
        return false;
        
    }
    
    
}