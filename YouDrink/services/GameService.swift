//
//  File.swift
//  YouDrink
//
//  Created by user on 19/06/2019.
//  Copyright © 2019 Chirkov. All rights reserved.
//

import Foundation
import CoreData


protocol GameService {
    
    var game: Game {get set}
    var participants: [Participant] {get set}
    var cards: [Card] {get set}
    
    var cardService: CardService {get set}
    var playerIndex: Int {get set}
    var currentPlayer: Participant {get set}
    
    func endGame()
    func nextPlayer()
    func faceUpCard()
//    static let shared = GameService()
//
//    private init() {}
//

//
//
//    func endGame() {
//        let game = getGame()
//        guard let unwrappedGame = game else { return }
//        unwrappedGame.endDate = NSDate()
//
//        CoreDataManager.shared.saveContext()
//
//        print("game endDate method is called")
//    }
}
