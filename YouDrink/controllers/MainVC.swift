//
//  MainVC.swift
//  YouDrink
//
//  Created by user on 09/06/2019.
//  Copyright © 2019 Chirkov. All rights reserved.
//

import UIKit
import CoreData

class MainVC: UIViewController {

    @IBOutlet weak var startGameButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        print("viewDidLoad")
        do {
            let fetchRequest : NSFetchRequest<Game> = Game.fetchRequest()
            fetchRequest.predicate = NSPredicate(format: "endDate = nil")
            
            let results = try CoreDataManager.shared.persistentContainer.viewContext.fetch(        fetchRequest)
            
            print(results)
            
        } catch {
            print(error)
        }
        
//        self.navigationController?.setNavigationBarHidden(true, animated: true)
        startGameButton.setTitle("Начать", for: .normal)
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
