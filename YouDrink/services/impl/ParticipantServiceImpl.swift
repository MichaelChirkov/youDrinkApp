//
//  ParticipantServiceImpl.swift
//  YouDrink
//
//  Created by user on 14/08/2019.
//  Copyright © 2019 Chirkov. All rights reserved.
//

import UIKit
import CoreData

class ParticipantServiceImpl: NSObject, ParticipantService {
    
    func searchParticipant(searchText: String) -> [Participant] {
       return findByPredicate(predicate: NSPredicate(format: "name CONTAINS %@", searchText))
    }
    
    
    func findAll() -> [Participant] {
       return findByPredicate(predicate: NSPredicate())
    }
    
    
    private func findByPredicate(predicate: NSPredicate) -> [Participant] {
        do {
            let fetchRequest: NSFetchRequest<Participant> = Participant.fetchRequest()
                        fetchRequest.predicate = predicate
            
            let results = try CoreDataManager.shared.persistentContainer.viewContext.fetch(fetchRequest)
            
            return results
        } catch {
            print("Error")
        }
        
        return [Participant]()
    }
    
    
    func save(name: String, photoAsData: NSData) -> Participant? {
        var thumbnail: NSData? = nil
       do {
            try thumbnail = createThumbnail(imagePNGData: Data(referencing: photoAsData))
        } catch let error {
            print("Exception catched... noPhotoPresented... \(error)")
            return nil
        }
        
        let participant = Participant(context: CoreDataManager.shared.persistentContainer.viewContext)
        participant.name = name
        participant.photo = photoAsData
    
        CoreDataManager.shared.saveContext()
        
        return participant
    }
    
    
    private func createThumbnail(imagePNGData: Data?) throws -> NSData {
        guard let data = imagePNGData else { throw GameException.noPhotoPresented }
        let options = [
            kCGImageSourceCreateThumbnailWithTransform: true,
            kCGImageSourceCreateThumbnailFromImageAlways: true,
            kCGImageSourceThumbnailMaxPixelSize: 300] as CFDictionary
        let source = CGImageSourceCreateWithData(data as CFData, nil)!
        let imageReference = CGImageSourceCreateThumbnailAtIndex(source, 0, options)!
        let thumbnail = UIImage(cgImage: imageReference)
        
        return thumbnail.pngData()! as NSData
        
    }
}
