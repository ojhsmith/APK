//
//  ViewController.swift
//  APK
//
//  Created by Oskar Smith on 17/04/16.
//  Copyright © 2016 Oskar Smith. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    var alkoholPercentage = ""
    var volume = ""
    var price = ""
    
    enum CalculatorState: Int {
        case AlcoholPercentageInputState
        case VolumeInputState
        case PriceInputState
        case ResultInputState
    }

    var calculatorState: CalculatorState = .AlcoholPercentageInputState {
        
        didSet {
            switch calculatorState {
            case .AlcoholPercentageInputState:
                inputLabel.text = alkoholPercentage
            case .VolumeInputState:
                inputLabel.text = volume
            case .PriceInputState:
                inputLabel.text = price
            default:
                break
            }
        }
    }

    @IBOutlet weak var commaButton: UIButton!
    @IBOutlet weak var zeroButton: UIButton!
    @IBOutlet weak var oneButton: UIButton!
    @IBOutlet weak var twoButton: UIButton!
    @IBOutlet weak var threeButton: UIButton!
    @IBOutlet weak var fourButton: UIButton!
    @IBOutlet weak var fiveButton: UIButton!
    @IBOutlet weak var sixButton: UIButton!
    @IBOutlet weak var sevenButton: UIButton!
    @IBOutlet weak var eightButton: UIButton!
    @IBOutlet weak var nineButton: UIButton!
    
    @IBOutlet weak var eraseButton: UIButton!
    
    @IBOutlet weak var alkButton: UIButton!
    @IBOutlet weak var volButton: UIButton!
    @IBOutlet weak var sekButton: UIButton!
    
    @IBOutlet weak var resultButton: UIButton!
    
    @IBOutlet weak var inputLabel: UILabel!
    
    var calculatorStateButtons : Array<UIButton> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        calculatorStateButtons = [self.alkButton, self.volButton, self.sekButton]
    
    }
    
    @IBAction func calculatorStateButtonDidPress(sender: UIButton) {
 
        for button in self.calculatorStateButtons {
            
            if button == sender {
                button.selected = true
                button.backgroundColor = UIColor.bolagetGreen()
                inputLabel.text = String(sender.tag)
            }
            else {
                button.selected = false
                button.backgroundColor = UIColor.bolagetYellow()
            }
        }
        
        guard let state = CalculatorState(rawValue: sender.tag) else {
            return
        }
   
        calculatorState = state
        
        if inputLabel.text == "" && sender.tag == 0 {
            inputLabel.text = "%"
            inputLabel.textColor = UIColor.darkGrayColor()
        } else if inputLabel.text == "" && sender.tag == 1 {
            inputLabel.text = "ml"
            inputLabel.textColor = UIColor.darkGrayColor()
        } else if inputLabel.text == "" && sender.tag == 2 {
            inputLabel.text = "sek"
            inputLabel.textColor = UIColor.darkGrayColor()
        }
    }
    
    @IBAction func numberButtonDidPress(sender: UIButton) {
        
//        createDrink()
        
        let input = String(sender.tag)
        
        inputLabel.textColor = UIColor.whiteColor()
        
        switch calculatorState {
        case .AlcoholPercentageInputState:
            alkoholPercentage = alkoholPercentage + input
            inputLabel.text = alkoholPercentage
        case .VolumeInputState:
            volume = volume + input
            inputLabel.text = volume
        case .PriceInputState:
            price = price + input
            inputLabel.text = price
        default:
            break
        }
    }
    
    @IBAction func eraseButtonDidPress(sender: UIButton) {
        
        
        
    }

    
    // Bart's data stuff
    
//    func createDrink()
//    {
//        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
//        let managedObjectContext = appDelegate.managedObjectContext
//        let drink = Drink(context: managedObjectContext)
//        
//        drink.name = "Oskar"
//        
//        do{
//           try managedObjectContext.save()
//        } catch _{
//           print ("error saving object")
//        }
//    }
//    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

