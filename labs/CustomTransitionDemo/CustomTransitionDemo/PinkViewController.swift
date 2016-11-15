//
//  PinkViewController.swift
//  CustomTransitionDemo
//
//  Created by Yang Yang on 11/14/16.
//  Copyright © 2016 Yang Yang. All rights reserved.
//

import UIKit

class PinkViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    var text: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        label.text = text
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func didTapDismiss(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}
