//
//  CalculatorBrain.swift
//  APK
//
//  Created by Oskar Smith on 25/04/16.
//  Copyright © 2016 Oskar Smith. All rights reserved.
//

import Foundation

class CalculatorBrain {
    
    func calculateAPK (_ alcTextField: Double, volTextField: Double, sekTextField: Double) -> Double {
        
        let result = ((alcTextField/100) * volTextField) / sekTextField
        
        let numberOfPlaces = 2.0
        let multiplier = pow(10.0, numberOfPlaces)
        let rounded = round(result * multiplier) / multiplier
        
        return rounded
    }
    
//    newDrink.setValue(calculateAPK, forKey: "result")
//    
//    do {
//    try newDrink.managedObjectContext?.save()
//    } catch {
//    print(error)
//    }
}
