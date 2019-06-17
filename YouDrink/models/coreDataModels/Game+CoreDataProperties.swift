//
//  Game+CoreDataProperties.swift
//  YouDrink
//
//  Created by user on 09/06/2019.
//  Copyright © 2019 Chirkov. All rights reserved.
//
//

import Foundation
import CoreData


extension Game {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Game> {
        return NSFetchRequest<Game>(entityName: "Game")
    }

    @NSManaged public var startDate: NSDate?
    @NSManaged public var endDate: NSDate?
    @NSManaged public var cardCount: Int16
    @NSManaged public var participants: NSSet?

}

// MARK: Generated accessors for participants
extension Game {

    @objc(addParticipantsObject:)
    @NSManaged public func addToParticipants(_ value: Participant)

    @objc(removeParticipantsObject:)
    @NSManaged public func removeFromParticipants(_ value: Participant)

    @objc(addParticipants:)
    @NSManaged public func addToParticipants(_ values: NSSet)

    @objc(removeParticipants:)
    @NSManaged public func removeFromParticipants(_ values: NSSet)

}
