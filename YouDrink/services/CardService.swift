//
//  CardService.swift
//  YouDrink
//
//  Created by user on 25/07/2019.
//  Copyright © 2019 Chirkov. All rights reserved.
//

import Foundation

protocol CardService {
    
   func initCardsArray(fileName: String) -> [Card]
}
