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
    
    override func viewDidLoad() {
        
        nameTextField.becomeFirstResponder()
        
    }
    
    @IBAction func saveDialogueButtonDidPress(sender: UIButton) {
        
        
    
    }
}
