//
//  Category.swift
//  APK
//
//  Created by Oskar Smith on 13/05/16.
//  Copyright © 2016 Oskar Smith. All rights reserved.
//

import Foundation

enum CategoryName: Int {
    
    case Any
    case Beer
    case RedWine
    case WhiteWine
    case Whiskey
    case AlkoholFree
}

class Category {
    var name : String?
    var color : NSData?
}

