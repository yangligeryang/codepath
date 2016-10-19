//
//  LoginViewController.swift
//  BunnyBunny
//
//  Created by Yang Yang on 10/18/16.
//  Copyright © 2016 Yang Yang. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var loginButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        emailField.becomeFirstResponder()
        loginButton.alpha = 0.5
    }
    
    private func enableLogin() {
        
        if emailField.text != "" && passwordField.text != "" {
            loginButton.isEnabled = true
            UIView.animate(withDuration: 0.4, animations: {
                self.loginButton.alpha = 1
            })
        } else {
            loginButton.isEnabled = false
            UIView.animate(withDuration: 0.4, animations: {
                self.loginButton.alpha = 0.5
            })
        }
    
    }
    
    @IBAction func onEmailChange(_ sender: UITextField) {
        enableLogin()
    }
    
    @IBAction func onPasswordChange(_ sender: UITextField) {
        enableLogin()
    }
    
    @IBAction func didTapLogin(_ sender: UIButton) {
        
        activityIndicator.startAnimating()
        if emailField.text == "kingsley" && passwordField.text == "dog" {
            delay(0.8, closure: {
                self.activityIndicator.stopAnimating()
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            })
        } else {
            delay(0.4, closure: {
                self.activityIndicator.stopAnimating()
                
                let alertController = UIAlertController(title: "Bad credentials", message: "Did you forget your password?", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "OK", style: .default, handler: { (action: UIAlertAction) in
                    print("you pressed ok")
                })
                
                alertController.addAction(okAction)
                self.present(alertController, animated: true, completion: nil)
            })
            print("bad password")
        }
    }

}
