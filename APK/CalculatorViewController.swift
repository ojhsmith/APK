//
//  ViewController.swift
//  APK
//
//  Created by Oskar Smith on 17/04/16.
//  Copyright © 2016 Oskar Smith. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    calculatorStateButtons = [self.alcButton, self.volButton, self.sekButton]
    }


    @IBOutlet var displayInputs: [UITextField]!

    var userIsInTheMiddleOfTypingANumber = false
    var alcohol = ""
    var volume = ""
    var price = ""

    
    // Add digits to display
    
    @IBAction func appendDigit(sender: UIButton) {
        let digit = sender.currentTitle
        
            for displayInput in displayInputs {
                if userIsInTheMiddleOfTypingANumber {
                    displayInput.text =  displayInput.text! + digit!
                } else {
                    displayInput.text = digit
                    userIsInTheMiddleOfTypingANumber = true
                }
            }
    }

    // Remove digits from display
    
    @IBAction func eraseButtonDidPress(sender: UIButton) {
        let currentString = self.displayInputs[sender.tag].text
        
        if currentString?.characters.count == 0 {
            return
        }
        
        let truncatedString = currentString!.substringToIndex(currentString!.endIndex.predecessor())
        
        switch calculatorState {
        case .AlcoholInputState:
            alcohol = truncatedString
            displayInputs[sender.tag].text = (alcohol.characters.count == 0 ? "%" : alcohol)
        case .VolumeInputState:
            volume = truncatedString
            displayInputs[sender.tag].text = (volume.characters.count == 0 ? "ml" : volume)
        case .PriceInputState:
            price = truncatedString
            displayInputs[sender.tag].text = (price.characters.count == 0 ? "sek" : price)
        default:
            break
        }

    }
    
    
    
    
    // Switches display
    
    @IBOutlet weak var alcButton: UIButton!
    @IBOutlet weak var volButton: UIButton!
    @IBOutlet weak var sekButton: UIButton!
    
    var calculatorStateButtons : Array<UIButton> = []
  
    enum CalculatorState: Int {
        case AlcoholInputState
        case VolumeInputState
        case PriceInputState
        case ResultInputState
    }
    
    var calculatorState: CalculatorState = .AlcoholInputState

    @IBAction func calculatorStateButtonDidPress(sender: UIButton) {
   
        guard let state = CalculatorState(rawValue: sender.tag) else {
            return
        }
        
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

        userIsInTheMiddleOfTypingANumber = false
        
        switch state {
        case .AlcoholInputState:
            alcohol = alcohol + displayInputs[sender.tag].text!
            displayInputs[sender.tag].text = alcohol
        case .VolumeInputState:
            volume = volume + displayInputs[sender.tag].text!
            displayInputs[sender.tag].text = volume
        case .PriceInputState:
            price = price + displayInputs[sender.tag].text!
            displayInputs[sender.tag].text = price
        default: break
        }
    }
}