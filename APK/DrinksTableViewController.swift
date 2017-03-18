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
    
    var selectedIndexPath: IndexPath? = nil
    var drinks = [NSManagedObject]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.separatorStyle = .none
        tableView.estimatedRowHeight = 60
        tableView.rowHeight = UITableViewAutomaticDimension
        
    }
    
    // MARK: Expand cell on tap
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
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
        tableView.reloadRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //1
        let appDelegate =
            UIApplication.shared.delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext
        
        //2
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Drink")
        let sortCategoryDescriptor = NSSortDescriptor(key: "category", ascending: false)
        let sortOrderDescriptor = NSSortDescriptor(key: "date", ascending: false)
        fetchRequest.sortDescriptors = [sortCategoryDescriptor, sortOrderDescriptor]

        //3
        do {
            let results =
                try managedContext.fetch(fetchRequest)
            drinks = results as! [NSManagedObject]
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
    }

    // MARK: Style section header
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Varunamn"
    }

    // MARK: Cell content
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
                return drinks.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "DrinkCell") as! DrinkTableViewCell
        
        if let drink = drinks[indexPath.row] as? Drink{
            cell.drinkResult.text = drink.resultString()
            cell.drinkTitle.text = drink.name
            
            let category = (CategoryName(rawValue: drink.category ?? "") ?? .Other)
            cell.drinkResult.textColor = category.color()
            if category == .Other {
                cell.drinkResult.textColor = UIColor.black
            }
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.delete) {

            switch editingStyle {
            case .delete:
                // remove the deleted item from the model
                let appDel: AppDelegate = UIApplication.shared.delegate as! AppDelegate
                let context: NSManagedObjectContext = appDel.managedObjectContext
                context.delete(drinks[indexPath.row] as NSManagedObject)
                drinks.remove(at: indexPath.row)
//                context.save(nil)
//                tableView.reloadData()
                // remove the deleted item from the `UITableView`
                self.tableView.deleteRows(at: [indexPath], with: .fade)
            default:
                return
            }
        }
    }
}










