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
        layer.add(animation, forKey: "shake")
    }
}

class SaveDialogueViewController: UIViewController, SelectCategoryViewControllerDelegate {    
    @IBOutlet weak var dialogueHeader: UILabel!
    @IBOutlet weak var saveDialogue: SpringImageView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var saveDialogueButton: UIButton!
    @IBOutlet weak var cancelDialogueButton: UIButton!
    @IBOutlet weak var categoryButton: DesignableButton!
    
    var drinkCategory: CategoryName = .Other
    var drinkResult = 0.0
    var saved = false
    
    
    override func viewDidLoad() {
        nameTextField.becomeFirstResponder()
        
    }
    
    func selectCategoryViewControllerDidSelectCategory(_ selectCategoryViewController: SelectCategoryViewController, category: CategoryName){
}

    func saveDrink() -> Bool {
        guard let drinkName = nameTextField.text, drinkName != "" else {
            dialogueHeader.text = "Namnge dryck"
            saveDialogue.shake()
            
            return false
        }
        
        let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
            let context: NSManagedObjectContext = appDelegate.managedObjectContext
            let newDrink = Drink(context: context)
            newDrink.name = drinkName
            newDrink.result = drinkResult as NSNumber?
            newDrink.category = drinkCategory.rawValue
            newDrink.date = Date()
            
            do {
                try newDrink.managedObjectContext?.save()
                return true
            } catch {
                dialogueHeader.text = "Error saving drink"
                saveDialogue.shake()
                return false
            }
    }
    
    @IBAction func saveDialogueButtonDidPress(_ sender: UIButton) {
        if self.saveDrink() {
            saved = true
            self.dismiss(animated: true, completion: nil)
        }
    }    
}
