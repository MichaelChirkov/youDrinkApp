//
//  GameServiceImpl.swift
//  YouDrink
//
//  Created by user on 14/08/2019.
//  Copyright © 2019 Chirkov. All rights reserved.
//

import CoreData

class GameServiceImpl: NSObject, GameService {
    var participants: [Participant]
    
    var cards: [Card]
    
    var game: Game
    
    var cardService: CardService
    
    var playerIndex: Int
    
    var currentPlayer: Participant
    
    
    init(gameVC: GameVC) {
        self.cardService = CardServiceImpl()
        
        //will get RuntimeException here if game will not present
        self.game = CoreDataManager.shared.getGame()!
        self.participants = (game.participants?.allObjects as? [Participant])!
        self.currentPlayer = participants[0]
        self.cards = cardService.initCardsArray(fileName: "cards", gameVC: gameVC)
        self.playerIndex = 0
        
    }
    
    func endGame() {
        
    }
    
//        func getGame() -> Game {
//            var fetchedGames = [Game]()
//            
//          
//            
//            return fetchedGames[0]
//        }
    
    func nextPlayer() {
        if playerIndex > participants.count - 1 {
            playerIndex = 0
        }
        
        currentPlayer = participants[playerIndex]
    }
    
    func faceUpCard() {
        cards.remove(at: 0)
        playerIndex += 1
    }

}
