//
//  CalculatorBrain.swift
//  APK
//
//  Created by Oskar Smith on 25/04/16.
//  Copyright © 2016 Oskar Smith. All rights reserved.
//

import Foundation

// Calculates APK

var operandStack = Array<Float>()

//class CalculatorBrain {
//    
//    enum Type {
//        case Alcohol(Double)
//        case Volume(Double)
//        case Price(Double)
//    }
//    
//    var types = [Type]()
//    
//    var drinkInputs = Dictionary<String, Type>()
//    
//        { $0 / 100 * $1 / $2 }
//    
//    func performOperation(symbol: String)  {
//        
//    }
//    
//    func result() -> Double? {
//        
//    }
//}

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