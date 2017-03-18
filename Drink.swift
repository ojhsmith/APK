//
//  Drink.swift
//  APK
//
//  Created by Oskar Smith on 18/04/16.
//  Copyright © 2016 Oskar Smith. All rights reserved.
//

import Foundation
import CoreData


open class Drink: NSManagedObject {

    class func entityName() -> String {
        return String(describing: self)
    }
    
    convenience init(context: NSManagedObjectContext) {
        let eName = type(of: self).entityName()
        let entity = NSEntityDescription.entity(forEntityName: eName, in: context)!
        self.init(entity: entity, insertInto: context)
    }

// Insert code here to add functionality to your managed object subclass
    
}
