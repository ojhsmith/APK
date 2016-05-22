//
//  Drink+CoreDataProperties.swift
//  APK
//
//  Created by Oskar Smith on 22/05/16.
//  Copyright © 2016 Oskar Smith. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Drink {

    @NSManaged var alcoholPercentage: NSNumber?
    @NSManaged var name: String?
    @NSManaged var price: NSNumber?
    @NSManaged var result: NSNumber?
    @NSManaged var volume: NSNumber?
    @NSManaged var category: String?

}
