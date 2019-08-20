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
    private let searchController = UISearchController(searchResultsController: nil)
    private var filteredParticipants = [Participant]()
    private var participantService = ParticipantServiceImpl()
    
    
    @IBAction func saveAndStartButton(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "startGameSegue", sender: nil)
    }
    
    
    @IBOutlet weak var participantsTableView: UITableView!
    
    
    @IBAction func unwindToNewGameVC(_ sender: UIStoryboardSegue) {
        self.participantsTableView.reloadData()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.addParticipantButton = initAddPlayerButton()
        
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search..."
        navigationItem.searchController = searchController
        definesPresentationContext = true
        
        self.navigationController?.view.addSubview(addParticipantButton)
        self.navigationItem.title = "Участники"
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        addParticipantButton.removeFromSuperview()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.view.addSubview(addParticipantButton)
    }
    
    
    @objc
    func addNewParticipant(sender: UIButton!) {
//        let alert = UIAlertController(title: "Новый игрок", message: "Введите имя нового игрока", preferredStyle: .alert)
//
//        let confirmAction = UIAlertAction(title: "confirm", style: .default) { action in
//            let textField = alert.textFields?[0]
//            let newParticipant = Participant()
//            newParticipant.name = textField?.text
//            self.participants.insert(newParticipant, at: 0)
//
//            self.participantsTableView.reloadData()
//        }
//
//        let cancelAction = UIAlertAction(title: "cancel", style: .cancel, handler: nil)
//
//        alert.addTextField {
//            textField in
//        }
//
//        alert.addAction(cancelAction);
//        alert.addAction(confirmAction);
//
//        self.present(alert, animated: true, completion: nil)
        performSegue(withIdentifier: "editPlayerSegue", sender: nil)
    }

    
   //  MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let newGame = Game()
        newGame.participants = NSSet(array: self.participants)
        newGame.startDate = NSDate()
        CoreDataManager.shared.saveContext()
    }
    
    private func initAddPlayerButton() -> UIButton {
        let button = UIButton(frame: CGRect(origin: CGPoint(x: self.view.frame.width - 125, y: self.view.frame.height - 125), size: CGSize(width: 100, height: 100)))
        
        button.backgroundColor = UIColor.green
        button.setTitle("+", for: .normal)
        button.layer.cornerRadius = 0.5 * button.bounds.size.width
        button.clipsToBounds = true
        button.titleLabel?.font = UIFont.systemFont(ofSize: 40)
        button.addTarget(self, action: #selector(addNewParticipant), for: .touchUpInside)
        
        return button
    }
    
    //MARK: own private methods
    private func searchBarIsEmpty() -> Bool {
        // Returns true if the text is empty or nil
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    private func isFiltering() -> Bool {
        return searchController.isActive && !searchBarIsEmpty()
    }
    
    
    private func filterContentForSearchText(_ searchText: String, scope: String = "All") {
       
        
//        filteredParticipants = participants.filter({( participant : Participant) -> Bool in
//            return participant.name!.lowercased().contains(searchText.lowercased())
        
        filteredParticipants = participantService.searchParticipant(searchText: searchText)
        
        participantsTableView.reloadData()
    }
    
    public func addParticipant(_ participant: Participant) {
        self.participants.append(participant)
    }
}





//MARK# tableView methods
extension NewGameVC: UITableViewDataSource, UITableViewDelegate, UISearchResultsUpdating {
    
    //MARK: UITableView methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering() {
            return filteredParticipants.count
        }
        
        return participants.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "participantCell", for: indexPath) as! ParticipantCell
        
        let participant: Participant = isFiltering() ? filteredParticipants[indexPath.row] : participants[indexPath.row]
        
        if isFiltering() {
            
        }
        
        cell.participantNameLabel.text = participant.name
        
        var image: UIImage?
        
        if let photo = participant.photo {
            image = UIImage(data: Data(referencing: photo))
        } else {
            image = UIImage(named: "noPhoto")
        }
    
        cell.participantImageView.image = image
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        participants.append(filteredParticipants[indexPath.row])
        searchController.searchBar.text? = ""
    }
    
    
    // MARK: - UISearchResultsUpdating Delegate
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
}
