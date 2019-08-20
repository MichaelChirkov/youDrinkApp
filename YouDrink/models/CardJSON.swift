//
//  Card.swift
//  YouDrink
//
//  Created by user on 18/06/2019.
//  Copyright © 2019 Chirkov. All rights reserved.
//

import UIKit

struct CardJSON: Decodable {

    var imageURL: String
    var count: Int
    var classname: String
}

struct ResponseData: Decodable{
    var cards: [CardJSON]
}
