//
//  ViewController.swift
//  APK
//
//  Created by Oskar Smith on 17/04/16.
//  Copyright © 2016 Oskar Smith. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController
{

    @IBOutlet var displayInputs: [UITextField]!

    var userIsInTheMiddleOfTypingANumber: Bool = false
    
    @IBAction func appendDigit(sender: UIButton) {
        let digit = sender.currentTitle!
        
        for displayInput in displayInputs {
            if displayInput.tag == 0 {
                if userIsInTheMiddleOfTypingANumber {
                    displayInput.text = displayInput.text! + digit
                } else {
                    displayInput.text = digit
                    userIsInTheMiddleOfTypingANumber = true
                }
            }
        }
    }
}