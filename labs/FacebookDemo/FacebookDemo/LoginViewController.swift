//
//  LoginViewController.swift
//  FacebookDemo
//
//  Created by Yang Yang on 10/20/16.
//  Copyright © 2016 Yang Yang. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var fieldSuperView: UIView!
    @IBOutlet weak var labelSuperView: UIView!
    @IBOutlet weak var fbLogoImageView: UIImageView!
    @IBOutlet weak var loginLoading: UIActivityIndicatorView!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    var initialFormCenter: CGPoint!
    var offsetFormCenter: CGPoint!
    var initialLabelCenter: CGPoint!
    var offsetLabelCenter: CGPoint!
    var initialLogoCenter: CGPoint!
    var offsetLogoCenter: CGPoint!
        
    private func enableLogin() {
        
        if (emailField.text!.isEmpty) || (passwordField.text!.isEmpty) {
            loginButton.isEnabled = false
        } else {
            loginButton.isEnabled = true
        }
        
    }
    
    private func showLoginError() {
        loginButton.isEnabled = false
        let alertController = UIAlertController(title: "Your email or password is wrong", message: "Please fix to log into Facebook", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "ok", style: .default, handler: { (UIAlertAction) in
        })
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialLogoCenter = fbLogoImageView.center
        offsetLogoCenter = CGPoint(x: initialLogoCenter.x, y: initialLogoCenter.y - 12)
        initialFormCenter = fieldSuperView.center
        offsetFormCenter = CGPoint(x: initialFormCenter.x, y: initialFormCenter.y - 36)
        initialLabelCenter = labelSuperView.center
        offsetLabelCenter = CGPoint(x: initialLabelCenter.x, y: initialLabelCenter.y - 190)
        
        loginButton.isEnabled = false
        
        NotificationCenter.default.addObserver(forName: NSNotification.Name.UIKeyboardWillShow, object: nil, queue: OperationQueue.main) { (Notification) in
            
            print("Keyboard has shown")
            self.fbLogoImageView.center.y = self.offsetLogoCenter.y
            self.fieldSuperView.center.y = self.offsetFormCenter.y
            self.labelSuperView.center.y = self.offsetLabelCenter.y
            
        }
        
        NotificationCenter.default.addObserver(forName: NSNotification.Name.UIKeyboardDidHide, object: nil, queue: OperationQueue.main) { (Notification) in
            
            self.fbLogoImageView.center.y = self.initialLogoCenter.y
            self.fieldSuperView.center.y = self.initialFormCenter.y
            self.labelSuperView.center.y = self.initialLabelCenter.y
            print("Keyboard is hidden")
            
        }
    }

    @IBAction func didTap(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    @IBAction func onEmailEditing(_ sender: UITextField) {
        enableLogin()
    }
    
    @IBAction func onPasswordEditing(_ sender: UITextField) {
        enableLogin()
    }
    
    @IBAction func didLogin(_ sender: UIButton) {
        
        loginLoading.startAnimating()
        loginButton.isSelected = true
        
        delay(2) {
            self.loginLoading.stopAnimating()
            self.loginButton.isSelected = false
            if self.emailField.text == "test" {
                if self.passwordField.text == "password" {
                    let defaults = UserDefaults.standard
                    defaults.set("existing user", forKey: "user")
                    self.performSegue(withIdentifier: "loginSegue", sender: nil)
                } else {
                    self.showLoginError()
                }
            } else if self.emailField.text == "newUser" {
                if self.passwordField.text == "password" {
                    let defaults = UserDefaults.standard
                    defaults.set("new user", forKey: "user")
                    self.performSegue(withIdentifier: "loginSegue", sender: nil)
                } else {
                    self.showLoginError()
                }
            } else {
                self.showLoginError()
            }
        }
        
    }
    

}
