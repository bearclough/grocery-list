//
//  ListTableViewController.swift
//  GroceryList
//
//  Created by bearclough on 10/5/14.
//  Copyright (c) 2014 bearclough. All rights reserved.
//

import Foundation
import UIKit
import Realm

class ListTableViewController: UITableViewController {
    
    // MARK: Properties
    
    var lists: RLMArray
    
    // MARK: Initializer
    
    required init(coder aDecoder: NSCoder) {
                
        self.lists = List.allObjects()
        super.init(coder: aDecoder)
        
    }
    
    
    // MARK: View Life Cycle
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // register reuse identiifier with a UITableViewCell
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "listCell")
        
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
        println("Number of lists = \(lists.count)")
        
        return Int(lists.count)
        
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        var cell: UITableViewCell = self.tableView.dequeueReusableCellWithIdentifier("listCell") as UITableViewCell
        
        if let list = self.lists.objectAtIndex(UInt(indexPath.row)) as? List {
            cell.textLabel!.text = list.name
            cell.accessoryType = .DisclosureIndicator
        }
        
        return cell;
    }
    
    
    override func dismissViewControllerAnimated(flag: Bool, completion: (() -> Void)?) {
    
        
    }
    
    // MARK: Table View Delegate
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        // cell was selected
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        self.performSegueWithIdentifier("showListItems", sender: indexPath)
    }
    
    // MARK: Segue Handling
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        // handle segue transitions here
        if let identifier = segue.identifier {
            
            
            switch identifier {
            case "showListItems":
                
                println("Preparing for showListItems segue")
                var itemTableViewController = segue.destinationViewController as ItemTableViewController
                
                if let indexPath = sender as? NSIndexPath {
                    itemTableViewController.list = self.lists.objectAtIndex(UInt(indexPath.row)) as? List
                }
                
                
            default:
                
                println("Preparing for \(identifier) segue")
                
            }
            
        }
        
        
    }
    
    @IBAction func cancelCreateList(segue: UIStoryboardSegue) {
        
        println("Returned from Cancel Create List Segue")
        
    }
    
    @IBAction func createList(segue: UIStoryboardSegue) {
    
        println("Returned from Create List Segue")
        
        var createListController = segue.sourceViewController as CreateListViewController
        
        // create list in memory
        var list = List()
        
        if let name = createListController.name {
            list.name = name
        }
        if let store = createListController.store {
            list.store = store
        }
        
        // create list in Realm
        let realm = RLMRealm.defaultRealm()
        realm.beginWriteTransaction()
        realm.addObject(list)
        realm.commitWriteTransaction()
        
        // reload table view data
        self.lists = List.allObjects()
        self.tableView.reloadData()
    }

    
    
}