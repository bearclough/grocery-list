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
    
    var selectDepartmentView: SelectDepartmentView
    
    //@IBOutlet weak var selectDepartmentView: SelectDepartmentView!
    
    var name: String?
    var quantity: String?
    var department: Department?
    
    // MARK: Initializer
    required init(coder aDecoder: NSCoder) {
        
        var bounds: CGRect = UIScreen.mainScreen().bounds
        self.selectDepartmentView = SelectDepartmentView(frame: bounds)
        
        super.init(coder: aDecoder)
        
    }
    
    // MARK: View Life Cycle
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.view.addSubview(self.selectDepartmentView)
        
    }
    
    override func viewWillAppear(animated: Bool) {
        
        super.viewWillAppear(animated)
        
        // register observers
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("departmentGroupUpdated:"), name: SELECTED_RADIO_BUTTON_CHANGED, object: self.selectDepartmentView.departmentGroup)
        
    }
    
    override func viewDidAppear(animated: Bool) {
        
        super.viewDidAppear(animated)

    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        // deinitialize observers
        NSNotificationCenter.defaultCenter().removeObserver(self, name: SELECTED_RADIO_BUTTON_CHANGED, object: self.selectDepartmentView.departmentGroup)
        
    }
    
    // MARK: Lifetime
    deinit {
        
        // deinitialize observers
        NSNotificationCenter.defaultCenter().removeObserver(self, name: SELECTED_RADIO_BUTTON_CHANGED, object: self.selectDepartmentView.departmentGroup)
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
                
                if let department = Department(rawValue: self.selectDepartmentView.departmentGroup.selectedRadioButton.data.identifier)  {
                    
                    self.department = department
                    
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
    
    // MARK: Notification Handling
    
    func departmentGroupUpdated(notification: NSNotification) {
        
        println("Department group updated to \(self.selectDepartmentView.departmentGroup.selectedRadioButton.data.identifier)")
        
    }
    
}
