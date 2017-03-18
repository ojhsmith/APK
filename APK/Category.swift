//
//  Category.swift
//  APK
//
//  Created by Oskar Smith on 13/05/16.
//  Copyright © 2016 Oskar Smith. All rights reserved.
//

import Foundation
import UIKit

enum CategoryName: String {
    
    case Other            = "Övrig"
    case Beer           = "Öl"
    case RedWine        = "Rōtt vin"
    case WhiteWine      = "Vitt vin"
    case Whiskey        = "Whiskey"
    case AlkoholFree    = "Alkoholfritt"
    
    func color() -> UIColor {
        switch self {
        case .Other          : return UIColor.white
        case .Beer           : return UIColor.bolagetBeer()
        case .RedWine        : return UIColor.bolagetRedWine()
        case .WhiteWine      : return UIColor.bolagetWhiteWine()
        case .Whiskey        : return UIColor.bolagetWhiskey()
        case .AlkoholFree    : return UIColor.bolagetAlcoholFree()
        }
    }
}

class Category {
    var name : String?
    var color : Data?
}

