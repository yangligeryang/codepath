//
//  LoginViewController.swift
//  ParseDemo
//
//  Created by Yang Yang on 11/29/16.
//  Copyright © 2016 Yang Yang. All rights reserved.
//

import Parse
import UIKit

class LoginViewController: UIViewController {
    
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didTapSignup(_ sender: UIButton) {
        
        let user = PFUser()
        user.username = emailField.text!
        user.password = passwordField.text!
        user.email = emailField.text!
        
        if user.username != "" && user.password != "" {
        
            user.signUpInBackground { (success: Bool, error: Error?) in
                if error != nil {
                    let alertController = UIAlertController(title: "Signup error", message: error?.localizedDescription, preferredStyle: .alert)
                    let okAction = UIAlertAction(title: "OK", style: .default, handler: { (action) in
                    })
                    alertController.addAction(okAction)
                    self.present(alertController, animated: true) {
                    }
                } else {
                    print("Yay")
                    self.performSegue(withIdentifier: "loginSegue", sender: nil)
                }
            }
            
        } else if user.username != "" {
            let alertController = UIAlertController(title: "Password required", message: "", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: { (action) in
            })
            alertController.addAction(okAction)
            present(alertController, animated: true) {
            }
        } else {
            let alertController = UIAlertController(title: "Email and password required", message: "", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: { (action) in
            })
            alertController.addAction(okAction)
            present(alertController, animated: true) {
            }
        }
        
    }
    
    @IBAction func didTapLogin(_ sender: UIButton) {
        PFUser.logInWithUsername(inBackground: emailField.text!, password: passwordField.text!) { (user: PFUser?, error: Error?) in
            if user == nil {
                let alertController = UIAlertController(title: "Login error", message: error?.localizedDescription, preferredStyle: .alert)
                let okAction = UIAlertAction(title: "OK", style: .default, handler: { (action) in
                })
                alertController.addAction(okAction)
                self.present(alertController, animated: true) {
                }
            } else {
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            }
        }
    }

}
