//
//  LoginViewController.swift
//  TumblrDemo
//
//  Created by Yang Yang on 11/7/16.
//  Copyright © 2016 Yang Yang. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var loginForm: UIView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        emailField.becomeFirstResponder()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func didTapCancel(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }

    
}
