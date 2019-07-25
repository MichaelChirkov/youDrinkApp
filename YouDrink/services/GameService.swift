//
//  File.swift
//  YouDrink
//
//  Created by user on 19/06/2019.
//  Copyright © 2019 Chirkov. All rights reserved.
//

import Foundation
import CoreData


class GameService {
    
    static let shared = GameService()
    
    private init() {}
    
    func getGame() -> Game? {
        
        do {
            let fetchRequest : NSFetchRequest<Game> = Game.fetchRequest()
            fetchRequest.predicate = NSPredicate(format: "endDate = nil")
            
            let results = try CoreDataManager.shared.persistentContainer.viewContext.fetch(fetchRequest)
            
            guard !results.isEmpty else {
                return nil
            }
            
            return results[0]
        } catch {
            print(error)
        }
        
        return nil
    }
}
