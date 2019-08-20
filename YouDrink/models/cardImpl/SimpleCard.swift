//
//  SimpleCard.swift
//  YouDrink
//
//  Created by user on 14/08/2019.
//  Copyright © 2019 Chirkov. All rights reserved.
//

import UIKit

class SimpleCard: NSObject, Card {
    var imageUrl: String
    
    var classname: String
    
    init(imageUrl: String, classname: String) {
        self.imageUrl = imageUrl
        self.classname = classname
    }
    
    func action(viewController: GameVC) {
        print("SimpleCard action was called and do nothing")
    }

}
