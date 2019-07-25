//
//  CardServiceImpl.swift
//  YouDrink
//
//  Created by user on 25/07/2019.
//  Copyright © 2019 Chirkov. All rights reserved.
//

import Foundation

class CardServiceImpl : CardService{
    
    func initCardsArray(fileName: String) -> [Card]{
        var resultArray = [Card]()

        if let url = Bundle.main.url(forResource: fileName, withExtension: "json"){
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(ResponseData.self, from: data)
                
                for card in jsonData.cards {
                    for _ in 0...card.count {
                        resultArray.append(card)
                    }
                }
                
            } catch {
                print("error:\(error)")
            }
        }
        
        return resultArray
    }
}
