//
//  DrinksTableViewController.swift
//  APK
//
//  Created by Oskar Smith on 04/05/16.
//  Copyright © 2016 Oskar Smith. All rights reserved.
//

import UIKit

class DrinksTableViewController: UITableViewController {
    
    @IBAction func helpButtonDidPress(sender: UIBarButtonItem) {
            performSegueWithIdentifier("HelpSegue", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.estimatedRowHeight = 60
        tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("DrinkCell") as! DrinkTableViewCell!

        cell.drinkTitle.text = "Kung"
        cell.drinkResult.text = "2.25"
        
        return cell
    }
}
