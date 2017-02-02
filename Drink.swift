//
//  Drink.swift
//  APK
//
//  Created by Oskar Smith on 18/04/16.
//  Copyright © 2016 Oskar Smith. All rights reserved.
//

import Foundation
import CoreData


public class Drink: NSManagedObject {

    class func entityName() -> String {
        return String(self)
    }
    
    convenience init(context: NSManagedObjectContext) {
        let eName = self.dynamicType.entityName()
        let entity = NSEntityDescription.entityForName(eName, inManagedObjectContext: context)!
        self.init(entity: entity, insertIntoManagedObjectContext: context)
    }

// Insert code here to add functionality to your managed object subclass
    
}
