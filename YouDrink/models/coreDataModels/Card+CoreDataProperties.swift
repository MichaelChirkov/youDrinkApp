//
//  Card+CoreDataProperties.swift
//  YouDrink
//
//  Created by user on 09/06/2019.
//  Copyright © 2019 Chirkov. All rights reserved.
//
//

import Foundation
import CoreData


extension Card {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Card> {
        return NSFetchRequest<Card>(entityName: "Card")
    }

    @NSManaged public var title: String?
    @NSManaged public var type: String?

}
