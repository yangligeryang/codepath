//
//  ConversationViewController.swift
//  ParseDemo
//
//  Created by Yang Yang on 11/29/16.
//  Copyright © 2016 Yang Yang. All rights reserved.
//

import Parse
import UIKit

class ConversationViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    let refreshControl = UIRefreshControl()
    var conversation: [PFObject] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return conversation.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChatTableViewCell", for: indexPath) as! ChatTableViewCell
        let message = conversation[indexPath.row]
        if let text = message["text"] as? String {
            if text != "" {
                cell.chatText.text = text
                if let user = message["user"] as? PFUser {
                    cell.chatUser.text = user.username
                } else {
                    cell.chatUser.isHidden = true
                }
            }
        }
        return cell
    }
    
    func conversationQuery() {
        let query = PFQuery(className: "Message_ios_design").includeKey("user")
//        query.limit = 10
        query.order(byDescending: "createdAt")
        query.findObjectsInBackground { (messages: [PFObject]?, error: Error?) in
            if error == nil {
                print("Successfully retrieved \(messages!.count) scores.")
                if let messages = messages {
                    self.conversation = messages
                }
                self.tableView.reloadData()
            } else {
                print("Error: \(error!) \(error!.localizedDescription)")
            }
            self.refreshControl.endRefreshing()
        }
    }
    
    func refreshConversation() {
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ConversationViewController.conversationQuery), userInfo: nil, repeats: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableViewAutomaticDimension
        
        conversationQuery()
//        refreshConversation()
    
        refreshControl.addTarget(self, action: #selector(ConversationViewController.conversationQuery), for: .valueChanged)
        tableView.refreshControl = refreshControl
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didTapLogout(_ sender: UIButton) {
        PFUser.logOut()
        dismiss(animated: true, completion: nil)
    }

    @IBAction func didTapSend(_ sender: UIButton) {
        if textField.text != "" {
            let chat = PFObject(className: "Message_ios_design")
            chat["text"] = textField.text
            chat["user"] = PFUser.current()
            chat.saveInBackground(block: { (success: Bool, error: Error?) in
                if (success) {
                    print("Message sent")
                    self.textField.text = ""
                    self.conversationQuery()
                    self.view.endEditing(true)
                } else {
                    let alertController = UIAlertController(title: "Write a message", message: error?.localizedDescription, preferredStyle: .alert)
                    let okAction = UIAlertAction(title: "OK", style: .default, handler: { (action) in
                    })
                    alertController.addAction(okAction)
                    self.present(alertController, animated: true) {
                    }
                }
            })
        } else {
            let alertController = UIAlertController(title: "Write a message", message: "", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: { (action) in
            })
            alertController.addAction(okAction)
            present(alertController, animated: true) {
            }
        }
    }
    
}
