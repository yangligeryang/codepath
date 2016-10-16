//
//  SettingsViewController.swift
//  GoogleDemo
//
//  Created by Yang Yang on 10/11/16.
//  Copyright © 2016 Yang Yang. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func didPressDoneButton(_ sender: AnyObject) {
        print("didPressDone")
        dismiss(animated: true, completion: nil)
    }

}
