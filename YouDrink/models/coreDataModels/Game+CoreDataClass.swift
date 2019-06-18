//
//  Game+CoreDataClass.swift
//  YouDrink
//
//  Created by user on 18/06/2019.
//  Copyright © 2019 Chirkov. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Game)
public class Game: AbstractEntity {
    convenience init() {
        self.init(entity: CoreDataManager.shared.entityForName(entityName: "Game"), insertInto: CoreDataManager.shared.persistentContainer.viewContext)
    }
}
