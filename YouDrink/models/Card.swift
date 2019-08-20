//
//  Card.swift
//  YouDrink
//
//  Created by user on 11/08/2019.
//  Copyright © 2019 Chirkov. All rights reserved.
//

import Foundation

protocol Card {
    var imageUrl: String { get }
    var classname: String { get }
    
    func action(viewController: GameVC)
}
