//
//  SaveDialogueViewController.swift
//  APK
//
//  Created by Oskar Smith on 10/05/16.
//  Copyright © 2016 Oskar Smith. All rights reserved.
//

import UIKit
import CoreData

public extension UIView {
    func shake() {
        let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        animation.duration = 0.6
        animation.values = [-20.0, 20.0, -20.0, 20.0, -10.0, 10.0, -5.0, 5.0, 0.0 ]
        layer.addAnimation(animation, forKey: "shake")
    }
}

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
    
    
    override func viewDidLoad() {
        nameTextField.becomeFirstResponder()
        
    }
    
    func selectCategoryViewControllerDidSelectCategory(selectCategoryViewController: SelectCategoryViewController, category: CategoryName){
}

    func saveDrink() -> Bool {
        saved = true
        guard let drinkName = nameTextField.text where drinkName != "" else {
            dialogueHeader.text = "Namnge dryck"
            saveDialogue.shake()
            
            return false
        }
        
        let appDelegate: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
            let context: NSManagedObjectContext = appDelegate.managedObjectContext
            let newDrink = Drink(context: context)
            newDrink.name = drinkName
            newDrink.result = drinkResult
            newDrink.category = drinkCategory.rawValue
            newDrink.date = NSDate()
            
            do {
                try newDrink.managedObjectContext?.save()
                return false
            } catch {
                dialogueHeader.text = "Error saving drink"
                saveDialogue.shake()
                return false
            }
    }
    
    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject!) -> Bool {
       return self.saveDrink() // so here you try and save the drink! When that succeeds it wil return 'true' so we return true to the question wether it should perform the dam segue or not. If it fails, we retun NO dont perform the segue
    }
    
    func saveDialogueButtonDidPress(sender: UIButton) {
        self.performSegueWithIdentifier(<#T##identifier: String##String#>, sender: <#T##AnyObject?#>)
    }

//    
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        
//        if let _ = segue.destinationViewController as? CalculatorViewController{
//            if let button = sender as? UIButton where button.currentTitle == "Spara" {
//               saveDialogueButtonDidPress(button)
//            }
//        }
//        
//        if let selectCategoryViewController = segue.destinationViewController as? SelectCategoryViewController{
//            selectCategoryViewController.delegate = self
//        }
//    }
//    
//    
//    func selectCategoryViewControllerDidSelectCategory(selectCategoryViewController: SelectCategoryViewController, category: CategoryName)
//    {
//        categoryButton.backgroundColor = category.color()
//        drinkCategory = category
//    }
    
}
