//
//  Category.swift
//  APK
//
//  Created by Oskar Smith on 13/05/16.
//  Copyright © 2016 Oskar Smith. All rights reserved.
//

import Foundation

enum CategoryName: String {
    
    case Any            = "Övrig"
    case Beer           = "Öl"
    case RedWine        = "Rōtt vin"
    case WhiteWine      = "Vitt vin"
    case Whiskey        = "Whiskey"
    case AlkoholFree    = "Alkoholfritt"
}

class Category {
    var name : String?
    var color : NSData?
}

