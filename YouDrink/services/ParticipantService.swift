//
//  ParticipantService.swift
//  YouDrink
//
//  Created by user on 14/08/2019.
//  Copyright © 2019 Chirkov. All rights reserved.
//

import Foundation


protocol ParticipantService {
    
    func findAll() -> [Participant]
    
    func searchParticipant(searchText: String) -> [Participant]
    
    func save(name: String, photoAsData: NSData) -> Participant?
}
