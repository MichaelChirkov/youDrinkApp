//
//  Card.swift
//  YouDrink
//
//  Created by user on 18/06/2019.
//  Copyright © 2019 Chirkov. All rights reserved.
//

import UIKit

struct Card: Decodable {

    var title: String
    var frontImage: String?
    var backImage: String?
    var count: Int
}

struct ResponseData: Decodable{
    var cards: [Card]
}
