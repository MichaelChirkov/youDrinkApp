//
//  Participant+CoreDataProperties.swift
//  YouDrink
//
//  Created by user on 18/06/2019.
//  Copyright © 2019 Chirkov. All rights reserved.
//
//

import Foundation
import CoreData


extension Participant {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Participant> {
        return NSFetchRequest<Participant>(entityName: "Participant")
    }

    @NSManaged public var name: String?
    @NSManaged public var score: Int16
    @NSManaged public var game: Game?

}
