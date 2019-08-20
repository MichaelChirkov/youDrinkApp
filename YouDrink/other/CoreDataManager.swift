//
//  CoreDataManager.swift
//  YouDrink
//
//  Created by user on 13/06/2019.
//  Copyright © 2019 Chirkov. All rights reserved.
//

import Foundation
import CoreData


class CoreDataManager {
    
    static let shared = CoreDataManager()
    
    private init() {}
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "YouDrink")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
             
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    
    func entityForName(entityName: String) -> NSEntityDescription {
        return NSEntityDescription.entity(forEntityName: entityName, in: self.persistentContainer.viewContext)!
    }
    
    
    // MARK: - Core Data Saving support
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    
    func getGame() -> Game? {
        do {
            let fetchRequest: NSFetchRequest<Game> = Game.fetchRequest()
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
