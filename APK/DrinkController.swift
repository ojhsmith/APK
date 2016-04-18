//
//  DrinkController.swift
//  APK
//
//  Created by Oskar Smith on 18/04/16.
//  Copyright © 2016 Oskar Smith. All rights reserved.
//

import Foundation

public class DrinkController
{
    
    static public func calculate(drink:Drink)->Float
    {
        guard   let _price = drink.price?.floatValue,
                 _volume = drink.volume?.integerValue,
                 _alcoholPercentage = drink.alcoholPercentage?.floatValue
        else {
            print ("debug: some values in drink are not set")
            return 0.0
        }
        
        return DrinkController.calculate(_volume, price:_price, alcoholPercentage:_alcoholPercentage)
    }
    
    static public func calculate(volume:Int, price:Float, alcoholPercentage:Float)->Float{
        
        guard volume != 0 && price != 0.0 && alcoholPercentage != 0.0
            else {
                return 0.0
        }
        
        return Float(volume) + price / alcoholPercentage;
    }
    
}
