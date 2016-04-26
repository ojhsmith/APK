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
    
    var calculatorStateButtons : Array<UIButton> = []
    
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
    
}