//
//  LoginViewController.swift
//  CarouselDemo
//
//  Created by Yang Yang on 10/22/16.
//  Copyright © 2016 Yang Yang. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var fieldParentView: UIView!
    @IBOutlet weak var buttonParentView: UIView!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var loginLoading: UIActivityIndicatorView!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var loginText: UIImageView!
    
    var frameInitialY: CGFloat!
    var buttonInitialY: CGFloat!
    var buttonOffset: CGFloat!
    var keyboardFrame: CGRect!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.delegate = self
        scrollView.contentSize = scrollView.frame.size
        scrollView.contentInset.bottom = 106
        buttonInitialY = buttonParentView.frame.origin.y
        frameInitialY = buttonParentView.frame.origin.y
        
        NotificationCenter.default.addObserver(forName: Notification.Name.UIKeyboardWillShow, object: nil, queue: OperationQueue.main) { (notification: Notification) in
            
            self.keyboardFrame = (notification.userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
            self.buttonOffset = self.frameInitialY  + self.buttonParentView.frame.height + 24 - self.buttonInitialY
            
            UIView.animate(withDuration: 0.5, animations: {
                self.buttonParentView.frame.origin.y = self.buttonInitialY - self.buttonOffset
                self.scrollView.contentOffset.y = self.scrollView.contentInset.bottom
            })
            
        }
        NotificationCenter.default.addObserver(forName: Notification.Name.UIKeyboardWillHide, object: nil, queue: OperationQueue.main) { (notification: Notification) in
            
            UIView.animate(withDuration: 0.5, animations: {
                self.buttonParentView.frame.origin.y = self.buttonInitialY
                self.scrollView.contentOffset.y = 0
            })
        }
        
    }
    
    @IBAction func didTap(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }

    @IBAction func didPressBack(_ sender: UIButton) {
        navigationController!.popViewController(animated: true)
    }
    
    @IBAction func didPressLogin(_ sender: UIButton) {
        
        let emailAlert = UIAlertController(title: "Email Required", message: "Please enter your email address", preferredStyle: .alert)
        let emailOK = UIAlertAction(title: "OK", style: .default) { (UIAlertAction) in
            self.emailField.becomeFirstResponder()
        }
        emailAlert.addAction(emailOK)
        
        let passwordAlert = UIAlertController(title: "Password Required", message: "Please enter your password", preferredStyle: .alert)
        let passwordOK = UIAlertAction(title: "OK", style: .default) { (UIAlertAction) in
            self.emailField.resignFirstResponder()
            self.passwordField.becomeFirstResponder()
        }
        passwordAlert.addAction(passwordOK)
        
        let errorAlert = UIAlertController(title: "Invalid Email or Password", message: "Please enter a valid email and password.", preferredStyle: .alert)
        let errorOK = UIAlertAction(title: "OK", style: .default, handler: { (UIAlertAction) in
            self.passwordField.resignFirstResponder()
            self.emailField.becomeFirstResponder()
        })
        errorAlert.addAction(errorOK)
        
        if (emailField.text?.isEmpty)! {
            present(emailAlert, animated: true, completion: nil)
        } else if (passwordField.text?.isEmpty)! {
            present(passwordAlert, animated: true, completion: nil)
        } else {
            
            loginLoading.startAnimating()
            
            delay(2) {
                
                self.loginLoading.stopAnimating()
                
                if self.emailField.text == "test" && self.passwordField.text == "password" {
                    self.performSegue(withIdentifier: "loginSegue", sender: nil)
                } else {
                    self.present(errorAlert, animated: true, completion: nil)
                }
                
            }
            
        }
        
    }
    
    
}
