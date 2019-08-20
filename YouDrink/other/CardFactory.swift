//
//  CardFactory.swift
//  YouDrink
//
//  Created by user on 14/08/2019.
//  Copyright © 2019 Chirkov. All rights reserved.
//

import UIKit

class CardFactory: NSObject {
    
    func createCard(json: CardJSON) -> Card {
        switch json.classname {
        case "SimpleCard":
            return SimpleCard(imageUrl: json.imageURL, classname: json.classname)
        default:
            return SimpleCard(imageUrl: json.imageURL, classname: json.classname)
        }
    }
}
