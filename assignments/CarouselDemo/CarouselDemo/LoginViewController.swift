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
    @IBOutlet weak var loginNav: UIImageView!
    
    var buttonInitialY: CGFloat!
    var buttonOffset: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.delegate = self
        scrollView.contentSize = scrollView.frame.size
        scrollView.contentInset.bottom = 106
        buttonInitialY = buttonParentView.frame.origin.y
        buttonOffset = self.buttonParentView.frame.height + 24
                
        NotificationCenter.default.addObserver(forName: Notification.Name.UIKeyboardWillShow, object: nil, queue: OperationQueue.main) { (notification: Notification) in
            
            UIView.animate(withDuration: 0.5, animations: {
                self.buttonParentView.frame.origin.y = self.buttonInitialY - self.buttonOffset
                self.scrollView.contentOffset.y = self.scrollView.contentInset.bottom
            })
            
        }
        NotificationCenter.default.addObserver(forName: Notification.Name.UIKeyboardWillHide, object: nil, queue: OperationQueue.main) { (notification: Notification) in
            
            UIView.animate(withDuration: 0.5, animations: {
                self.buttonParentView.frame.origin.y = self.buttonInitialY
            })
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        let transform = CGAffineTransform(scaleX: 0.2, y: 0.2)
        loginNav.transform = transform
        fieldParentView.transform = transform
        loginNav.alpha = 0
        fieldParentView.alpha = 0
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        UIView.animate(withDuration: 0.3) {
            
            self.loginNav.transform = CGAffineTransform.identity
            self.fieldParentView.transform = CGAffineTransform.identity
            self.loginNav.alpha = 1
            self.fieldParentView.alpha = 1
            
        }
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        if scrollView.contentOffset.y < scrollView.contentInset.bottom {
            view.endEditing(true)
        }
        
    }
    

    @IBAction func didPressBack(_ sender: UIButton) {
        navigationController!.popViewController(animated: true)
    }
    
    @IBAction func didPressLogin(_ sender: UIButton) {
        
        let emailAlert = UIAlertController(title: "Email Required", message: "Please enter your email address", preferredStyle: .alert)
        let emailOK = UIAlertAction(title: "OK", style: .default) { (UIAlertAction) in
        }
        emailAlert.addAction(emailOK)
        
        let passwordAlert = UIAlertController(title: "Password Required", message: "Please enter your password", preferredStyle: .alert)
        let passwordOK = UIAlertAction(title: "OK", style: .default) { (UIAlertAction) in
        }
        passwordAlert.addAction(passwordOK)
        
        let errorAlert = UIAlertController(title: "Invalid Email or Password", message: "Please enter a valid email and password.", preferredStyle: .alert)
        let errorOK = UIAlertAction(title: "OK", style: .default) { (UIAlertAction) in
        }
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
