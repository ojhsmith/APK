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
    var drinks = [NSManagedObject]()
    
    let calculatorBrain = CalculatorBrain()
    
    enum CalculatorState: Int {
        case AlcoholInputState
        case VolumeInputState
        case PriceInputState
        case ResultInputState
    }
    
    var calculatorState: CalculatorState = .AlcoholInputState
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        volTextField.hidden = true
        sekTextField.hidden = true
        alcButton.selected = true
        resButton.enabled = false
        saveButton.enabled = false
        calculatorStateButtons = [self.alcButton, self.volButton, self.sekButton]
        displayInputs = [self.alcTextField, self.volTextField, self.sekTextField]     
    }

    var userIsInTheMiddleOfTypingANumber = false
    
    var alcohol = ""
    var volume = ""
    var price = ""

    
    // MARK: Add digits to display
    
    @IBAction func appendDigit(sender: UIButton) {
        
        let digit = sender.currentTitle
        
        for displayInput in displayInputs {
            
            if(displayInput.tag == calculatorState.rawValue) {
                displayInput.text =  displayInput.text! + digit!
                
                if displayInput.text?.rangeOfString(",") != nil {
                    print("exists")
                    commaButton.enabled = false
                } else {
                    print("does not exist")
                    commaButton.enabled = true
                }
            }
        }
        if inputsDone() {
            resButton.enabled = true
        } else {
            resButton.enabled = false
        }
    }
    
    
    // MARK: Switches display

    @IBAction func calculatorStateButtonDidPress(sender: UIButton) {
        
        saveButton.enabled = false
        resTextField.hidden = true
        resButton.selected = false
        resButton.backgroundColor = UIColor.bolagetYellow()
        
        guard let state = CalculatorState(rawValue: sender.tag) else {
            return
        }
        
        calculatorState = state
        
        commaButton.enabled = !activeTextFieldContainsComma()
        
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
    
    
    // MARK: Remove digits from display
    
    func correctString(textField: UITextField) {
        
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
        
        if inputsDone() {
            resButton.enabled = true
        } else {
            resButton.enabled = false
        }
        
        commaButton.enabled = !activeTextFieldContainsComma()

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
            if displayInput.tag == calculatorState.rawValue && displayInput.text?.rangeOfString(",") != nil {
                return true
            }
        }
        return false
    }

 
    // MARK: Calculate APK
    
    @IBAction func resultButtonDidPress(sender: UIButton) {
        
        saveButton.enabled = true
        resTextField.hidden = false
        resButton.backgroundColor = UIColor.bolagetGreen()
        resButton.selected = true
        
        for displayInput in displayInputs {
            displayInput.hidden = true
        }
        
        for button in calculatorStateButtons {
            button.selected = false
            button.backgroundColor = UIColor.bolagetYellow()
        }

        guard var alcValue = Double(alcTextField.text!), var volValue = Double(volTextField.text!), var sekValue = Double(sekTextField.text!)  else {
            return
        }

        let result = calculatorBrain.calculateAPK(alcValue, volTextField: volValue, sekTextField: sekValue)
        
        resTextField.text = String(result)
    }
    
    // MARK: Save APK
    
    
        @IBAction func saveButtonDidPress(sender: UIBarButtonItem) {
        
        let appDelegate =
            UIApplication.sharedApplication().delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext
        
        let drink = Drink(context: managedContext)
        
        let alert = UIAlertController(title: "Spara uträkning",
                                      message: "Lägg till drycken i din lista för att enkelt kunna jämföra APK senare.",
                                      preferredStyle: .Alert)
        
        let saveAction = UIAlertAction(title: "Spara",
                                       style: .Default,
                                       handler: { (action:UIAlertAction) -> Void in
                                        
                                        let textField = alert.textFields!.first
                                        drink.name = textField?.text
        })
        
        let cancelAction = UIAlertAction(title: "Avbryt",
                                         style: .Default) { (action: UIAlertAction) -> Void in
        }
        
        alert.addTextFieldWithConfigurationHandler {
            (textField: UITextField) -> Void in
        }
        
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        presentViewController(alert,
                              animated: true,
                              completion: nil)
    }
    
    func saveDrink(name: String) {
        
        //1
        let appDelegate =
            UIApplication.sharedApplication().delegate as! AppDelegate
        
        let managedContext = appDelegate.self.managedObjectContext
        
        //2
        let entity =  NSEntityDescription.entityForName("Drink", inManagedObjectContext: managedContext)
        
        let drink = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: managedContext)
        
        //3
        drink.setValue(name, forKey: "name")
        
        //4
        do {
            try drink.managedObjectContext?.save()
            
        //5
        drinks.append(drink)
            
        } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
//            UIAlertController(title: "Hoppsan", message: "Nåt gick snett", preferredStyle: <#T##UIAlertControllerStyle#>)
        }
    }
}