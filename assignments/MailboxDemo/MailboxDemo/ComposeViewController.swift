//
//  ComposeViewController.swift
//  MailboxDemo
//
//  Created by Yang Yang on 10/31/16.
//  Copyright © 2016 Yang Yang. All rights reserved.
//

import UIKit

class ComposeViewController: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailField.becomeFirstResponder()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let destination = segue.destination as! MailboxViewController
    }
    
    @IBAction func didTapCancel(_ sender: UIBarButtonItem) {
        dismiss(animated: true) {
        }
    }
    
    @IBAction func didTapSend(_ sender: UIBarButtonItem) {
        dismiss(animated: true) {
        }
    }

}
