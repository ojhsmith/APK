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

class CalculatorBrain {

    func calculateAPK (alcTextField: Double, volTextField: Double, sekTextField: Double) -> Double {
        
        let result = ((alcTextField/100) * volTextField) / sekTextField
        
        return result
    }
}