//
//  QuestionCard.swift
//  YouDrink
//
//  Created by user on 14/08/2019.
//  Copyright © 2019 Chirkov. All rights reserved.
//

import UIKit

class QuestionCard: NSObject, Card {
    var imageUrl: String
    
    var classname: String
    
    init(imageUrl: String, classname: String) {
        self.imageUrl = imageUrl
        self.classname = classname
    }
    
    func action(viewController: GameVC) {
//        let participants = viewController.getParticipants()
//        
//        for player in participants {
//            if let index = player.cards.firstIndex(where: {$0.classname == self.classname}) {
//                print("Card has been removed from player with name \(player.name!)")
//                player.cards.remove(at: index)
//            }
//        }
//        
//        viewController.getCurrentPlayer().cards.append(self)
//        print("Extra life was added to current player")
    }
}
