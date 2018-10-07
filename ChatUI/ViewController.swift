//
//  ViewController.swift
//  ChatUI
//
//  Created by Anand on 10/7/18.
//  Copyright © 2018 Sunarc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var chats = [String]()
    @IBOutlet var txtView: UITextView!
    @IBOutlet var tblChat: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


    @IBAction func send() {
        chats.append(txtView.text)
        txtView.text = " "
        tblChat.reloadData()
        tblChat.scrollToRow(at: IndexPath(row: chats.count-1, section: 0), at: .bottom, animated: true)
    }
    
}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chats.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let chatCell = tableView.dequeueReusableCell(withIdentifier: "ChatCell", for: indexPath) as! ChatCell
        chatCell.txtChat.text = chats[indexPath.row]
        return chatCell
    }
    
}


class ChatCell: UITableViewCell {
    @IBOutlet var txtChat: UITextView!
}


