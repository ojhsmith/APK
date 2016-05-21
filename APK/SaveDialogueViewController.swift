//
//  SaveDialogueViewController.swift
//  APK
//
//  Created by Oskar Smith on 10/05/16.
//  Copyright © 2016 Oskar Smith. All rights reserved.
//

import UIKit

class SaveDialogueViewController: UIViewController, SelectCategoryViewControllerDelegate {
    
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
    
    @IBAction func categoryButtonDidPress(sender: UIButton) {

    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if let selectCategoryViewController = segue.destinationViewController as? SelectCategoryViewController{
            selectCategoryViewController.delegate = self
        }
    }
    
    func selectCategoryViewControllerDidSelectCategory(selectCategoryViewController: SelectCategoryViewController, category: CategoryName)
    {
        print(category)
    }
    
}
