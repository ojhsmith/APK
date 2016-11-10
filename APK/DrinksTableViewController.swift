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
        let smallHeight: CGFloat = 60.0
        let expandedHeight: CGFloat = 180.0
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
    
    // MARK: Fetch core data
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        //1
        let appDelegate =
            UIApplication.sharedApplication().delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext
        
        //2
        let fetchRequest = NSFetchRequest(entityName: "Drink")
       // let sortCategoryDescriptor = NSSortDescriptor(key: "category", ascending: false)
        let sortOrderDescriptor = NSSortDescriptor(key: "date", ascending: false)
        fetchRequest.sortDescriptors = [sortOrderDescriptor]
        
        //3
        do {
            let results =
                try managedContext.executeFetchRequest(fetchRequest)
            drinks = results as! [NSManagedObject]
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
    }
    
    
    // MARK: Style section header
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Varunamn"
    }

    // MARK: Cell content
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
                return drinks.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("DrinkCell") as! DrinkTableViewCell!
        
        if let drink = drinks[indexPath.row] as? Drink{
            cell.drinkResult.text = String(drink.result ?? 0)
            cell.drinkTitle.text = drink.name
            
            let category = (CategoryName(rawValue: drink.category ?? "") ?? .Any)
            cell.drinkResult.textColor = category.color()
            if category == .Any {
                cell.drinkResult.textColor = UIColor.blackColor()
            }
        }
        
        return cell
    }
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.Delete) {

            switch editingStyle {
            case .Delete:
                // remove the deleted item from the model
                let appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
                let context:NSManagedObjectContext = appDel.managedObjectContext
                context.deleteObject(drinks[indexPath.row] as NSManagedObject)
                drinks.removeAtIndex(indexPath.row)
//                context.save(nil)
//                tableView.reloadData()
                // remove the deleted item from the `UITableView`
                self.tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            default:
                return
                
            }
            
            }
//             handle delete (by removing the data from your array and updating the tableview)
        
    }
    

}










