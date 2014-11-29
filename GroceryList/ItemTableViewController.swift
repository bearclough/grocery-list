//
//  ItemTableViewController.swift
//  GroceryList
//
//  Created by bearclough on 10/18/14.
//  Copyright (c) 2014 bearclough. All rights reserved.
//

import Foundation
import UIKit
import Realm

class ItemTableViewController: UITableViewController, MGSwipeTableCellDelegate {
    
    // MARK: Properties
    var items: [Department: RLMArray]
    
    var list: List?
    var addItemBarButtonItem: UIBarButtonItem?
    
    let kItemCellIdentifier: String = "ItemCell"
    
    // MARK: Initializer
    required init(coder aDecoder: NSCoder) {
        
        self.items = Dictionary<Department, RLMArray>()
        
        super.init(coder: aDecoder)
        
    }
    
    // MARK: View Life Cycle
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // register reuse identifier for a UITableViewCell
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "itemCell")
        
        // add plus button to nav bar
        self.addItemBarButtonItem = UIBarButtonItem(
            image: UIImage(named: "Plus"),
            style: UIBarButtonItemStyle.Plain,
            target: self,
            action: Selector("addItem"))
        
        if let addItem = self.addItemBarButtonItem {
            
            self.navigationItem.rightBarButtonItem = addItem
            
        }
        
        self.refreshItemsInList()
        
        
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
    
    // MARK: Table View Datasource
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        // get number of cases in item department enum
        return Department.allValues.count
        
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        let headerTitle = Department.allValues[section].rawValue
        println("Title for section \(section) is \(headerTitle).")
        return headerTitle
    }
    
    
        
        
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        // get department of section
        let department = Department.allValues[section] as Department
        
        // get number of items in array of items for departmetn
        if let itemCount = self.items[department]?.count {
            
            // return number of rows
            println("Number of items = \(itemCount) for section \(section)")
            
            return Int(itemCount)
            
        }

        return 0
        
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        
        var cell: ItemCell? = self.tableView.dequeueReusableCellWithIdentifier(kItemCellIdentifier) as? ItemCell
        
        // if there is not an existing cell to use we'll create a new one
        if cell == nil {
            
            tableView.registerClass(ItemCell.classForCoder(), forCellReuseIdentifier: kItemCellIdentifier)
            cell = ItemCell(style: UITableViewCellStyle.Default, reuseIdentifier: kItemCellIdentifier)
            
        }
        
        // get item for cell
        if let department = Department.allValues[indexPath.section] as Department? {
            
            if let item = self.items[department]?.objectAtIndex(UInt(indexPath.row)) as Item? {
                
                // configure cell by calling helper method in ItemCell
                cell!.configureForItem(item.name, quantity: item.quantity, priority: item.priority)
                
            }
            
        }
        
        cell!.delegate = self
        
        return cell!;
        
    }
    
    
    // MARK: Table View Delegate
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        // cell was selected
        
    }
    
    // MARK: Segue Handling
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        // handle segue transition here
        
    }
    
    @IBAction func cancelCreateItem(segue: UIStoryboardSegue) {
        
        println("Returned from Create Item Segue")
        
    }
    
    
    @IBAction func createItem(segue: UIStoryboardSegue) {
        println("Returned from Create List Segue")
        
        // get information from the create view controller
        var createItemController = segue.sourceViewController as CreateItemViewController
        
        // create item
        self.createItem(createItemController.name, quantity: createItemController.quantity)
        self.refreshItemsInList()
        self.tableView.reloadData()
        
    }
    
    // MARK: Swipe Delegate Methods
    
    func swipeTableCell(cell: MGSwipeTableCell!, canSwipe direction: MGSwipeDirection) -> Bool {
        
        // only allow swiping in one direction
        if (direction == MGSwipeDirection.LeftToRight) {
            
            return true
            
        }
        
        return false
        
    }
    
    func swipeTableCell(cell: MGSwipeTableCell!, didChangeSwipeState state: MGSwipeState, gestureIsActive: Bool) {
        return
    }
    
    func swipeTableCell(cell: MGSwipeTableCell!, swipeButtonsForDirection direction: MGSwipeDirection, swipeSettings: MGSwipeSettings!, expansionSettings: MGSwipeExpansionSettings!) -> [AnyObject]! {
        
        if (direction == MGSwipeDirection.LeftToRight) {
            
            swipeSettings.transition = MGSwipeTransition.TransitionDrag
            expansionSettings.buttonIndex = 0
            expansionSettings.fillOnTrigger = true
            return self.createLeftButtons()
        }
        
        return []
    }
    
    func swipeTableCell(cell: MGSwipeTableCell!, tappedButtonAtIndex index: Int, direction: MGSwipeDirection, fromExpansion: Bool) -> Bool {
        
        if (direction == MGSwipeDirection.LeftToRight) {
            
            switch index {
                
            case 0:
                
                // delete item
                if let indexPath = self.tableView.indexPathForCell(cell) {
                    self.destroyItem(indexPath)
                }
                
            default:
                
                println("This button shouldn't be here something has gone terribly wrong :(")
                
            }
            
        }
        
        return true
        
    }
    
    func createLeftButtons() -> [AnyObject] {
        
        let leftButton = MGSwipeButton(title: "Got It!", backgroundColor: Colors().jade)
        let leftButtons = [ leftButton ]
        return leftButtons
        
    }
    
    
    // MARK: Interactivity
    
    func addItem() {
        
        self.performSegueWithIdentifier("addItemSegue", sender: self.addItemBarButtonItem)
        
    }
    
    // MARK: Helper Methods
    
    func refreshItemsInList() {
        
        // populate list of items b/c this is never called in init
        if let name = self.list?.name {
            
            // populate dictionary of item arrays
            for department in Department.allValues {
                // populate dictionay with items
                let itemPredicate = NSPredicate(format: "list.name = %@ AND department = %@", name, department.rawValue)
                println("Searching for all items in \(department.rawValue) for list \(name)")
                
                let departmentItems = Item.objectsWithPredicate(itemPredicate)
                
                // add to items dictionary
                self.items[department] = departmentItems
            }
            
        }
        
        
    }
    
    func createItem( name: String?, quantity: String? ) {
        
        /*var item = Item()
        if let itemName = name { item.name = itemName }
        if let itemQuantity = quantity {item.quantity = itemQuantity }
        
        // set items list to list view controller is pointing to
        item.list = self.list
        
        // create item in Realm
        let realm = RLMRealm.defaultRealm()
        realm.beginWriteTransaction()
        
        realm.addObject(item)
        
        self.list?.items.addObject(item)
        
        realm.commitWriteTransaction()*/
        
    }

    func destroyItem( indexPath: NSIndexPath ) {
        
        /*if let item = self.items.objectAtIndex(UInt(indexPath.row)) as? Item {
            
            let realm = RLMRealm.defaultRealm()
            realm.beginWriteTransaction()
            
            self.list?.items.removeObjectAtIndex(UInt(indexPath.row))
            realm.deleteObject(item)
            
            realm.commitWriteTransaction()
            
        }
        
        self.refreshItemsInList()
        self.tableView.reloadData()*/
        
    }
    
}