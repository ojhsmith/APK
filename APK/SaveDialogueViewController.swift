//
//  SaveDialogueViewController.swift
//  APK
//
//  Created by Oskar Smith on 10/05/16.
//  Copyright © 2016 Oskar Smith. All rights reserved.
//

import UIKit
import CoreData

class SaveDialogueViewController: UIViewController, SelectCategoryViewControllerDelegate {
    
    @IBOutlet weak var dialogueHeader: UILabel!
    @IBOutlet weak var saveDialogue: SpringImageView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var saveDialogueButton: UIButton!
    @IBOutlet weak var cancelDialogueButton: UIButton!
    @IBOutlet weak var categoryButton: DesignableButton!
    
    var drinkCategory: CategoryName = .Any
    var drinkResult = 0.0
    var saved = false
    
    let limitLength = 10
    
    override func viewDidLoad() {
        nameTextField.becomeFirstResponder()
        
    }
    
    func saveDialogueButtonDidPress(sender: UIButton) {
        
        saved = true
        guard let drinkName = nameTextField.text where drinkName != "" else {
            dialogueHeader.text = "Namnge dryck"
            // TODO: shake animation
            return
        }
        
        if let appDelegate: AppDelegate = UIApplication.sharedApplication().delegate as? AppDelegate {
            let context: NSManagedObjectContext = appDelegate.managedObjectContext
            let newDrink = Drink(context: context)
            newDrink.name = drinkName
            newDrink.result = drinkResult
            newDrink.category = drinkCategory.rawValue
            newDrink.date = NSDate()
            
            do {
                try newDrink.managedObjectContext?.save()
            } catch {
                print(error)
            }
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if let _ = segue.destinationViewController as? CalculatorViewController{
            if let button = sender as? UIButton where button.currentTitle == "Spara" {
               saveDialogueButtonDidPress(button)
            }
        }
        
        if let selectCategoryViewController = segue.destinationViewController as? SelectCategoryViewController{
            selectCategoryViewController.delegate = self
        }
    }
    
    
    
    func selectCategoryViewControllerDidSelectCategory(selectCategoryViewController: SelectCategoryViewController, category: CategoryName)
    {
        categoryButton.backgroundColor = category.color()
        drinkCategory = category
    }
    
}
