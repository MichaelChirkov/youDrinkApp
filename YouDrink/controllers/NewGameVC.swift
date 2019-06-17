//
//  NewGameVC.swift
//  YouDrink
//
//  Created by user on 09/06/2019.
//  Copyright © 2019 Chirkov. All rights reserved.
//

import UIKit

class NewGameVC: UIViewController {
    
    private var addParticipantButton: UIButton!
    private var participants = [Participant]()
    
    @IBOutlet weak var participantsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

         addParticipantButton = UIButton(frame: CGRect(origin: CGPoint(x: self.view.frame.width - 125, y: self.view.frame.height - 125), size: CGSize(width: 100, height: 100)))
        
        addParticipantButton.backgroundColor = UIColor.green
        addParticipantButton.setTitle("+", for: .normal)
        addParticipantButton.layer.cornerRadius = 0.5 * addParticipantButton.bounds.size.width
        addParticipantButton.clipsToBounds = true
        addParticipantButton.titleLabel?.font = UIFont.systemFont(ofSize: 40)
        addParticipantButton.addTarget(self, action: #selector(addNewParticipant), for: .touchUpInside)
        
        self.navigationController?.view.addSubview(addParticipantButton)
        
        self.navigationItem.title = "Участники"
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        addParticipantButton.removeFromSuperview()
    }
    
    
    @objc
    func addNewParticipant(sender: UIButton!) {
        let alert = UIAlertController(title: "Новый игрок", message: "Введите имя нового игрока", preferredStyle: .alert)
        
        let confirmAction = UIAlertAction(title: "confirm", style: .default) { action in
            let textField = alert.textFields?[0]
            var newParticipant = Participant()
            newParticipant.name = textField?.text
            self.participants.insert(newParticipant, at: 0)
            
            self.participantsTableView.reloadData()
        }
        
        let cancelAction = UIAlertAction(title: "cancel", style: .cancel, handler: nil)
        
        alert.addTextField {
            textField in
        }
       
        alert.addAction(cancelAction);
        alert.addAction(confirmAction);

        self.present(alert, animated: true, completion: nil)
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







extension NewGameVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return participants.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "participantCell", for: indexPath) as! ParticipantCell
        
        cell.participantNameLabel.text = participants[indexPath.row].name
        
        return cell
    }
}
