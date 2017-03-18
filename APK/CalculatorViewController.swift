//
//  ViewController.swift
//  APK
//
//  Created by Oskar Smith on 17/04/16.
//  Copyright © 2016 Oskar Smith. All rights reserved.
//

import UIKit
import CoreData

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    @IBOutlet weak var alcButton: UIButton!
    @IBOutlet weak var volButton: UIButton!
    @IBOutlet weak var sekButton: UIButton!
    @IBOutlet weak var resButton: UIButton!
    
    @IBOutlet weak var alcTextField: UITextField!
    @IBOutlet weak var volTextField: UITextField!
    @IBOutlet weak var sekTextField: UITextField!
    @IBOutlet weak var resTextField: UITextField!
    
    @IBOutlet weak var commaButton: UIButton!
    
    var calculatorStateButtons : Array<UIButton> = []
    var displayInputs : Array<UITextField> = []
    
    let calculatorBrain = CalculatorBrain()
    
    var result = 0.0
    
    enum CalculatorState: Int {
        case alcoholInputState
        case volumeInputState
        case priceInputState
        case resultInputState
    }
    
    var calculatorState: CalculatorState = .alcoholInputState
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        volTextField.isHidden = true
        sekTextField.isHidden = true
        alcButton.isSelected = true
        resButton.isEnabled = false
        saveButton.isEnabled = false
        calculatorStateButtons = [self.alcButton, self.volButton, self.sekButton]
        displayInputs = [self.alcTextField, self.volTextField, self.sekTextField]
//        displayInputs.map({$0.text = "1"})
    }

    var userIsInTheMiddleOfTypingANumber = false
    
    var alcohol = ""
    var volume = ""
    var price = ""

    
    // MARK: Add digits to display
    
    @IBAction func appendDigit(_ sender: UIButton) {
        
        let digit = sender.currentTitle
        
        for displayInput in displayInputs {
            
            if(displayInput.tag == calculatorState.rawValue) {
                displayInput.text =  displayInput.text! + digit!
                
                if displayInput.text?.range(of: ".") != nil {
                    commaButton.isEnabled = false
                } else {                    commaButton.isEnabled = true
                }
            }
        }
        if inputsDone() {
            resButton.isEnabled = true
        } else {
            resButton.isEnabled = false
        }
    }
    
    
    // MARK: Switches display

    @IBAction func calculatorStateButtonDidPress(_ sender: UIButton) {
        
        saveButton.isEnabled = false
        resTextField.isHidden = true
        resButton.isSelected = false
        resButton.backgroundColor = UIColor.bolagetYellow()
        
        guard let state = CalculatorState(rawValue: sender.tag) else {
            return
        }
        
        calculatorState = state
        
        commaButton.isEnabled = !activeTextFieldContainsComma()
        
        for button in self.calculatorStateButtons {
            
            if button == sender {
                button.backgroundColor = UIColor.bolagetGreen()
                button.isSelected = true
            }
            else {
                button.isSelected = false
                button.backgroundColor = UIColor.bolagetYellow()
            }
        }
        
        for displayInput in displayInputs {
            if displayInput.tag == calculatorState.rawValue {
                displayInput.isHidden = false
            } else {
                displayInput.isHidden = true
            }
        }
    }
    
    
    // MARK: Remove digits from display
    
    func correctString(_ textField: UITextField) {
        
        let currentString = textField.text
        
        if currentString?.characters.count == 0 {
            return
        }
        
        textField.text = currentString!.substring(to: currentString!.characters.index(before: currentString!.endIndex))
    }
    
    @IBAction func eraseButtonDidPress(_ sender: UIButton) {
        
        switch calculatorState {
        case .alcoholInputState:
            correctString(self.alcTextField)
            break
        case .volumeInputState:
            correctString(self.volTextField)
            break
        case .priceInputState:
            correctString(self.sekTextField)
            break
        default:
          break
        }
        
        if inputsDone() {
            resButton.isEnabled = true
        } else {
            resButton.isEnabled = false
        }
        
        commaButton.isEnabled = !activeTextFieldContainsComma()

    }

    func inputsDone () -> Bool {
        for displayInput in displayInputs {
            if displayInput.text == nil || displayInput.text == "" {
                return false
            }
        }
        return true
    }
    
    func activeTextFieldContainsComma () -> Bool {
        for displayInput in displayInputs {
            if displayInput.tag == calculatorState.rawValue && displayInput.text?.range(of: ".") != nil {
                return true
            }
        }
        return false
    }

 
    // MARK: Calculate APK
    
    @IBAction func resultButtonDidPress(_ sender: UIButton) {
        
        saveButton.isEnabled = true
        resTextField.isHidden = false
        resButton.backgroundColor = UIColor.bolagetGreen()
        resButton.isSelected = true
        
        for displayInput in displayInputs {
            displayInput.isHidden = true
        }
        
        for button in calculatorStateButtons {
            button.isSelected = false
            button.backgroundColor = UIColor.bolagetYellow()
        }

        guard let alcValue = Double(alcTextField.text!), let volValue = Double(volTextField.text!), let sekValue = Double(sekTextField.text!)  else {
            return
        }

        result = calculatorBrain.calculateAPK(alcValue, volTextField: volValue, sekTextField: sekValue)
        
        resTextField.text = String(result)
    }
    
        // MARK: Save APK
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "SaveDrinkSegue" {
            if let saveDialogueViewController = segue.destination as? SaveDialogueViewController{
                saveDialogueViewController.drinkResult = result
            }
        }
    }
    
        // MARK: Show tableview after save
    
    override func unwindToViewController(_ sender: UIStoryboardSegue) {
        
        if let saveDialogueViewController = sender.source as? SaveDialogueViewController{
            if saveDialogueViewController.saved == true {
                let secondViewController = self.storyboard!.instantiateViewController(withIdentifier: "DrinksTableViewController") as! DrinksTableViewController
                
                self.navigationController!.pushViewController(secondViewController, animated: true)

            }
        }
    }
}
