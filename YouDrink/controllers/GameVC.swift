//
//  GameVC.swift
//  YouDrink
//
//  Created by user on 18/06/2019.
//  Copyright © 2019 Chirkov. All rights reserved.
//

import UIKit

class GameVC: UIViewController {
    
    private var currentGame: Game!
    private var participants: [Participant]!
    private var cards: [Card]!
    private var flipped: Bool = false
    private var cardService: CardService!
    
    
    //MARK: UI elements
    @IBOutlet weak var participantNameLabel: UILabel!
    @IBOutlet weak var cardLabel: UILabel!
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var exitButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.cardService = CardServiceImpl()
        
        currentGame = GameService.shared.getGame()
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(flip))
        
        self.participants = currentGame.participants?.allObjects as? [Participant]
        self.participantNameLabel.text = participants[0].name
        self.cards = cardService.initCardsArray(fileName: "cards")
        self.cardView.addGestureRecognizer(gesture)
        self.exitButton.titleLabel?.text = "Закончить"
        self.cardLabel.text = ""
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        currentGame.endDate = NSDate()
        
        CoreDataManager.shared.saveContext()
        
        print("game endDate")
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    @objc
    func flip(_ sender:UITapGestureRecognizer){
        if self.cards.count != 0 {
            if self.flipped == false{
                self.cardView.backgroundColor = .white
                self.cardLabel.text = self.cards[0].title
                self.cards.remove(at: 0)
                self.flipped = true
            }
            else {
                self.cardLabel.text = ""
                self.cardView.backgroundColor = .orange
                self.flipped = false
            }
        } else {
            //SHOW ALERT THAT GAME IS END
        }
    }
    
}
