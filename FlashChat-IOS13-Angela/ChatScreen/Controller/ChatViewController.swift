//
//  ChatViewController.swift
//  FlashChat-IOS13-Angela
//
//  Created by Павел Грицков on 14.03.23.
//

import UIKit
import FirebaseCore
import FirebaseAuth
import FirebaseFirestore

class ChatViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var messages: [Message] = [
    Message(sender: "1@2.com", body: "Hi!"),
    Message(sender: "a@b.com", body: "Hello!"),
    Message(sender: "1@2.com", body: "What's up?")]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // скрыть кнопку назад
        navigationItem.hidesBackButton = true
        createLogOutBarButtonItem()
        setupTableView()
    }
}

private extension ChatViewController {
    func createLogOutBarButtonItem() {
        // TODO: перекрасить кнопку в белый
        let logOutBarButtonItem = UIBarButtonItem(title: "Log Out", style: .done, target: self, action: #selector(logOutPressed))
        navigationItem.rightBarButtonItem = logOutBarButtonItem
    }
    
    func setupTableView() {
        tableView.dataSource = self
        let cellNib = UINib(nibName: K.cellNibName, bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: K.cellIdentifier)
    }
}

@objc extension ChatViewController {
    func logOutPressed() {
        let firebaseAuth = Auth.auth()
        do {
          try firebaseAuth.signOut()
            navigationController?.popToRootViewController(animated: true)
        } catch let signOutError as NSError {
          print("Error signing out: %@", signOutError)
        }
    }
}

extension ChatViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath) as! MessageViewCell
        let text = messages[indexPath.row].body
        cell.configure(text: text)
        return cell
    }
    
    
}
