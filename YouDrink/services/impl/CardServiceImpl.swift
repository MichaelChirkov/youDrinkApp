//
//  CardServiceImpl.swift
//  YouDrink
//
//  Created by user on 25/07/2019.
//  Copyright © 2019 Chirkov. All rights reserved.
//

import Foundation

class CardServiceImpl : CardService {
   
    private var factory = CardFactory()
    
    
    func initCardsArray(fileName: String, gameVC: GameVC) -> [Card] {
        let jsonCards = loadFromJSON(fileName: fileName)
        var result = [Card]()
        
        for json in jsonCards {            
            for _ in 0...json.count {
                result.append(factory.createCard(json: json))
            }
        }
        
        return result.shuffled()
    }
    
    
    func loadFromJSON(fileName: String) -> [CardJSON]{
        var resultArray = [CardJSON]()

        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                resultArray = try decoder.decode(ResponseData.self, from: data).cards
            } catch {
                print("error:\(error)")
            }
        }
        
        return resultArray
    }
}
