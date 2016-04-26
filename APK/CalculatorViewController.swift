//
//  ViewController.swift
//  APK
//
//  Created by Oskar Smith on 17/04/16.
//  Copyright © 2016 Oskar Smith. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var alcButton: UIButton!
    @IBOutlet weak var volButton: UIButton!
    @IBOutlet weak var sekButton: UIButton!
    
    @IBOutlet weak var alcTextField: UITextField!
    @IBOutlet weak var volTextField: UITextField!
    @IBOutlet weak var sekTextField: UITextField!
    
    var calculatorStateButtons : Array<UIButton> = []
    var displayInputs : Array<UITextField> = []
    
    enum CalculatorState: Int {
        case AlcoholInputState
        case VolumeInputState
        case PriceInputState
        case ResultInputState
    }
    
    var calculatorState: CalculatorState = .AlcoholInputState
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        calculatorStateButtons = [self.alcButton, self.volButton, self.sekButton]
        displayInputs = [self.alcTextField, self.volTextField, self.sekTextField]
    }

    var userIsInTheMiddleOfTypingANumber = false
    
    var alcohol = ""
    var volume = ""
    var price = ""

    
    // Add digits to display
    
    @IBAction func appendDigit(sender: UIButton) {
        
        let digit = sender.currentTitle

        for displayInput in displayInputs {
            
            if(displayInput.tag == calculatorState.rawValue) {
                displayInput.text =  displayInput.text! + digit!
            }
        }
    }
    

    
    // Switches display


    @IBAction func calculatorStateButtonDidPress(sender: UIButton) {
   
        guard let state = CalculatorState(rawValue: sender.tag) else {
            return
        }
        
        calculatorState = state
        
        for button in self.calculatorStateButtons {
            
            if button == sender {
                button.backgroundColor = UIColor.bolagetGreen()
                button.selected = true
            }
            else {
                button.selected = false
                button.backgroundColor = UIColor.bolagetYellow()
            }
        }
        
        for displayInput in displayInputs {
            
            print(displayInput.text)
            
            if displayInput.tag == calculatorState.rawValue {
                print("show displayInput \(displayInput.tag)")
                displayInput.hidden = false
            } else {
                print("hide displayInput \(displayInput.tag)")
                displayInput.hidden = true
            }
        }
    }
    
    // Remove digits from display
    
    func correctString(textField:UITextField)
    {
        let currentString = textField.text
        
        if currentString?.characters.count == 0 {
            return
        }
        
        textField.text = currentString!.substringToIndex(currentString!.endIndex.predecessor())
    }
    
    @IBAction func eraseButtonDidPress(sender: UIButton) {
        switch calculatorState {
        case .AlcoholInputState:
            correctString(self.alcTextField)
            break
        case .VolumeInputState:
            correctString(self.volTextField)
            break
        case .PriceInputState:
            correctString(self.sekTextField)
            break
        default:
            break
        }
        
    }
    
}