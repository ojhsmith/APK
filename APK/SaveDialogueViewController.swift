//
//  SaveDialogueViewController.swift
//  APK
//
//  Created by Oskar Smith on 10/05/16.
//  Copyright © 2016 Oskar Smith. All rights reserved.
//

import UIKit

class SaveDialogueViewController: UIViewController {
    
    @IBOutlet weak var saveDialogue: SpringImageView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var saveDialogueButton: UIButton!
    @IBOutlet weak var cancelDialogueButton: UIButton!
    @IBOutlet weak var categoryButton: DesignableButton!
    
    override func viewDidLoad() {
        
        nameTextField.becomeFirstResponder()
        
    }
    
    @IBAction func saveDialogueButtonDidPress(sender: UIButton) {

    }
    
//    @IBAction func categoryButtonDidPress(sender: UIButton) {
//        let categoryViewController: SelectCategoryViewController = self.storyboard!.instantiateViewControllerWithIdentifier("categoryView") as! SelectCategoryViewController
//        
//        self.presentViewController(categoryViewController, animated: true) { 
//            
//        }
//    }
    
}
