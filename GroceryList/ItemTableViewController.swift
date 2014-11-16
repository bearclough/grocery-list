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

class ItemTableViewController: UITableViewController {
    
    // MARK: Properties
    var items: RLMArray
    var list: List?
    var addItemBarButtonItem: UIBarButtonItem?
    
    // MARK: Initializer
    required init(coder aDecoder: NSCoder) {
        
        if let name = list?.name {
            
            let itemPredicate = NSPredicate(format: "list.name = %@", name)
            self.items = Item.objectsWithPredicate(itemPredicate)
            
        }
            
        else {
            
            self.items = RLMArray(objectClassName: Item.className())
            
        }
        
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
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        // return number of rows
        println("Number of items = \(items.count)")
        
        return Int(items.count)
        
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell: UITableViewCell = self.tableView.dequeueReusableCellWithIdentifier("itemCell") as UITableViewCell
        
        if let item = self.items.objectAtIndex(UInt(indexPath.row)) as? Item {
            cell.textLabel!.text = item.name
        }
        
        return cell;
        
    }
    
    
    // MARK: Table View Delegate
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        // cell was selected
        
    }
    
    // MARK: Segue Handling
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        // handle segue transition here
        
    }
    
    // MARK: Interactivity
    
    func addItem() {
        self.performSegueWithIdentifier("addItemSegue", sender: self.addItemBarButtonItem)
    }
    
}