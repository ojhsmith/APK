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

    var userIsInTheMiddleOfTypingANumber = false
    var alcohol = 0
    var volume = 0
    var price = 0

    
    // Add digits to display
    
    @IBAction func appendDigit(sender: UIButton) {
        let digit = sender.currentTitle!
        
        for displayInput in displayInputs {
            if displayInput.tag == 0 {
                if userIsInTheMiddleOfTypingANumber {
                    displayInput.text =  displayInput.text! + digit
                } else {
                    displayInput.text = digit
                    userIsInTheMiddleOfTypingANumber = true
                }
            }
        }
    }

    
    // Switches display

    @IBAction func calculatorState(sender: UIButton) {
        let state = sender.currentTitle!
        userIsInTheMiddleOfTypingANumber = false
        
        switch state {
//        case "alk":
//            displayValue = alcohol
//        case "ml":
//        case "sek":
        default: break
        }
    }
    
    
    // Calculates APK
    
    var operandStack = Array<Float>()
    
//    @IBAction func result()
//    {
//        if operandStack.count == 3 {
//            displayInputs[3] = (alcohol/100)*volume/price
//        }
//    }
    
//    var displayValue: Float {
//        get {
//            return NSNumberFormatter().numberFromString(displayInputs.text!)!.floatValue
//        }
//        set {
//            displayInputs.text = "\(newValue)"
//            userIsInTheMiddleOfTypingANumber = false
//        }
//    }
}