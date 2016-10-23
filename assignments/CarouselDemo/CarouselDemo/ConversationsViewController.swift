//
//  ConversationsViewController.swift
//  CarouselDemo
//
//  Created by Yang Yang on 10/22/16.
//  Copyright © 2016 Yang Yang. All rights reserved.
//

import UIKit

class ConversationsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func didPressBack(_ sender: UIButton) {
        navigationController!.popViewController(animated: true)
    }

}
