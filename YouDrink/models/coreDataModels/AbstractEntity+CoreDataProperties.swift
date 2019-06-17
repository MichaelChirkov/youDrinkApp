//
//  AbstractEntity+CoreDataProperties.swift
//  YouDrink
//
//  Created by user on 09/06/2019.
//  Copyright © 2019 Chirkov. All rights reserved.
//
//

import Foundation
import CoreData


extension AbstractEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<AbstractEntity> {
        return NSFetchRequest<AbstractEntity>(entityName: "AbstractEntity")
    }

    @NSManaged public var id: Int32

}
