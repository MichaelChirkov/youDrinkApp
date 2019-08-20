//
//  GameVC.swift
//  YouDrink
//
//  Created by user on 18/06/2019.
//  Copyright © 2019 Chirkov. All rights reserved.
//

import UIKit

class GameVC: UIViewController {
    
//    private var currentGame: Game!
//    private var participants: [Participant]!
//    private var cards: [Card]!
//    
//    private var cardService: CardService!
//    private var playerIndex = 0
//    private var currentPlayer: Participant!
//    {
//        willSet {
//            self.participantNameLabel.text = newValue!.name
//        }
//    }
    
    private var flipped: Bool = false
    private var gameService: GameService!
    
    //MARK: UI elements
    @IBOutlet weak var participantNameLabel: UILabel!
    @IBOutlet weak var cardLabel: UILabel!
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var exitButton: UIButton!
    
    
    //MARK: UIViewController methods override
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.gameService = GameServiceImpl(gameVC: self)
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(flip))
     
        self.cardView.addGestureRecognizer(gesture)
        self.exitButton.titleLabel?.text = "Закончить"
        self.cardLabel.text = ""
    }
    
    
    @objc
    func flip(_ sender:UITapGestureRecognizer){
        if gameService.cards.count != 0 {
            if flipped == false {
                cardView.backgroundColor = .white
                flipped = true
               gameService.faceUpCard()
            }
            else {
                cardLabel.text = ""
                cardView.backgroundColor = .orange
                flipped = false
                gameService.nextPlayer()
            }
        }
        else {
            showEndGameAlert()
            self.gameService.endGame()
        }
    }
    
    @IBAction func endGame(_ sender: UIButton) {
        gameService.endGame()
    }
    
    func showEndGameAlert() {
        let alertController = UIAlertController(title: "Game is over", message: "Game is over 2", preferredStyle: .alert)
        
        let confirmAction = UIAlertAction(title: "ok", style: .default) { action in
            self.performSegue(withIdentifier: "unwindSegue", sender: nil)
        }
        
        alertController.addAction(confirmAction);
        
        self.present(alertController, animated: true, completion: nil)
    }
}
