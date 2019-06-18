//
//  Participant+CoreDataClass.swift
//  YouDrink
//
//  Created by user on 18/06/2019.
//  Copyright © 2019 Chirkov. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Participant)
public class Participant: AbstractEntity {
    convenience init() {
        self.init(entity: CoreDataManager.shared.entityForName(entityName: "Participant"), insertInto: CoreDataManager.shared.persistentContainer.viewContext)
    }
}
