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



//extension Double {
//    func format(f: String) -> String {
//        return NSString(format: "%\(f)f", self) as String
//    }
//}
//
//let myDouble = 1.234567
//println(myDouble.format(".3")

class CalculatorBrain {
    
    func calculateAPK (alcTextField: Double, volTextField: Double, sekTextField: Double) -> Double {
        
        let result = ((alcTextField/100) * volTextField) / sekTextField
        
        let numberOfPlaces = 2.0
        let multiplier = pow(10.0, numberOfPlaces)
        let rounded = round(result * multiplier) / multiplier
        
        return rounded
    }
    
    
}