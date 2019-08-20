//
//  CardService.swift
//  YouDrink
//
//  Created by user on 25/07/2019.
//  Copyright © 2019 Chirkov. All rights reserved.
//

import Foundation

protocol CardService {
    
   func loadFromJSON(fileName: String) -> [CardJSON]
    
   func initCardsArray(fileName: String, gameVC: GameVC) -> [Card]
}
