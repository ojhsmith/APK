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
    
    var calculatorState: CalculatorState = .AlcoholPercentageInputState
    

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
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        let activeState = UIImage.imageWithColor(UIColor(red:0.00, green:0.65, blue:0.28, alpha:1.00))
        alkButton.setBackgroundImage(activeState, forState: .Selected)
        volButton.setBackgroundImage(activeState, forState: .Selected)
        sekButton.setBackgroundImage(activeState, forState: .Selected)
    }
    
    @IBAction func numberButtonDidPress(sender: UIButton) {
        
        
        
        let input = String(sender.tag)
        
        switch calculatorState {
        case .AlcoholPercentageInputState:
             alkoholPercentage = alkoholPercentage + input
             inputLabel.text = alkoholPercentage
            alkButton.selected = true
        case .VolumeInputState:
            volume = volume + input
             inputLabel.text = volume
            volButton.selected = true
        case .PriceInputState:
            price = price + input
             inputLabel.text = price
            sekButton.selected = true
        default:
            break
        }
        
       
        
  
        
//        print(sender.tag)
    }
    
 
    
    @IBAction func calculatorStateButtonDidPress(sender: UIButton) {
        guard let state = CalculatorState(rawValue: sender.tag) else {
            return
        }
        
        calculatorState = state
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

