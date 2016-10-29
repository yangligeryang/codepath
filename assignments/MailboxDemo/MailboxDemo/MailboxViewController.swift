//
//  MailboxViewController.swift
//  MailboxDemo
//
//  Created by Yang Yang on 10/28/16.
//  Copyright © 2016 Yang Yang. All rights reserved.
//

import UIKit

class MailboxViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var leftMenu: UIView!
    @IBOutlet weak var rightMenu: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.contentSize = CGSize(width: 375, height: 1681)
    }

}
