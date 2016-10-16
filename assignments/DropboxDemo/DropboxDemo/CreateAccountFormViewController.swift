//
//  CreateAccountFormViewController.swift
//  DropboxDemo
//
//  Created by Yang Yang on 10/15/16.
//  Copyright © 2016 Yang Yang. All rights reserved.
//

import UIKit

class CreateAccountFormViewController: UIViewController {

    @IBOutlet weak var firstNameField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstNameField.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onBack(_ sender: UIButton) {
        navigationController!.popViewController(animated: true)
    }

    @IBAction func didTap(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
}