//
//  ChatTableViewCell.swift
//  ParseDemo
//
//  Created by Yang Yang on 11/29/16.
//  Copyright © 2016 Yang Yang. All rights reserved.
//

import UIKit

class ChatTableViewCell: UITableViewCell {

    @IBOutlet weak var chatText: UILabel!
    @IBOutlet weak var chatUser: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
