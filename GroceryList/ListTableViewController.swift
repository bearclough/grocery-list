//
//  ListTableViewController.swift
//  GroceryList
//
//  Created by bearclough on 10/5/14.
//  Copyright (c) 2014 bearclough. All rights reserved.
//

import Foundation
import UIKit

class ListTableViewController: UITableViewController {
    
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
    
    // MARK: Table View Datasource
    
    override func tableView(_: UITableView, numberOfRowsInSection section: Int) -> Int {
        // return number of rows
        return 0;
    }
    
    override func tableView(_: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // return cell for function
        let cell = UITableViewCell();
        return cell;
    }
    
    // MARK: Table View Delegate
    
    override func tableView(_: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        // cell was selected
        
    }
    
    // MARK: Segue Handling
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        // handle segue transitions here
        
    }
    
    
    
}