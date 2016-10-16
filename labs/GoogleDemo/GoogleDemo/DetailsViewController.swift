//
//  DetailsViewController.swift
//  GoogleDemo
//
//  Created by Yang Yang on 10/11/16.
//  Copyright © 2016 Yang Yang. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func didPressCancel(_ sender: AnyObject) {
        navigationController!.popViewController(animated: true)
    }

}
