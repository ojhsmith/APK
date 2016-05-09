//
//  DrinksTableViewController.swift
//  APK
//
//  Created by Oskar Smith on 04/05/16.
//  Copyright © 2016 Oskar Smith. All rights reserved.
//

import UIKit
import CoreData

class DrinksTableViewController: UITableViewController {
    
    var selectedIndexPath: NSIndexPath? = nil
    var drinks = [NSManagedObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.separatorStyle = .None
        tableView.estimatedRowHeight = 60
        tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    // MARK: Expand cell on tap
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("didSelectRowAtIndexPath was called")
        var cell = tableView.cellForRowAtIndexPath(indexPath) as! DrinkTableViewCell
        switch selectedIndexPath {
        case nil:
            selectedIndexPath = indexPath
        default:
            if selectedIndexPath! == indexPath {
                selectedIndexPath = nil
            } else {
                selectedIndexPath = indexPath
            }
        }
        tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        let smallHeight: CGFloat = 70.0
        let expandedHeight: CGFloat = 100.0
        let ip = indexPath
        if selectedIndexPath != nil {
            if ip == selectedIndexPath! {
                return expandedHeight
            } else {
                return smallHeight
            }
        } else {
            return smallHeight
        }
    }
    
    // MARK: Style section header
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return drinks.count
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Varunamn"
    }

    // MARK: Style cell content
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("DrinkCell") as! DrinkTableViewCell!

        cell.drinkTitle.text = "Kung"
        cell.drinkResult.text = "2.25"
        
//        cell!.textLabel!.text = drinks.valueForKey("name") as? String
        
        return cell
    }
    
    //    @IBAction func helpButtonDidPress(sender: UIBarButtonItem) {
    //            performSegueWithIdentifier("HelpSegue", sender: self)
    //    }

}
