//
//  CreateViewController.swift
//  CarouselDemo
//
//  Created by Yang Yang on 10/23/16.
//  Copyright © 2016 Yang Yang. All rights reserved.
//

import UIKit

class CreateViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var fieldParentView: UIView!
    @IBOutlet weak var buttonParentView: UIView!
    @IBOutlet weak var firstNameField: UITextField!
    @IBOutlet weak var lastNameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var checkboxButton: UIButton!
    @IBOutlet weak var createNav: UIImageView!
    @IBOutlet weak var createLoading: UIActivityIndicatorView!
    
    var buttonInitialY: CGFloat!
    var buttonOffset: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.delegate = self
        scrollView.contentSize = scrollView.frame.size
        scrollView.contentInset.bottom = 121
        buttonInitialY = buttonParentView.frame.origin.y
        buttonOffset = 96
                
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
        createNav.transform = transform
        fieldParentView.transform = transform
        createNav.alpha = 0
        fieldParentView.alpha = 0
        
        self.scrollView.contentOffset.y = 0
        self.buttonParentView.frame.origin.y = self.buttonInitialY
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        UIView.animate(withDuration: 0.3) {
            
            self.createNav.transform = CGAffineTransform.identity
            self.fieldParentView.transform = CGAffineTransform.identity
            self.createNav.alpha = 1
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
    
    @IBAction func didPressAgree(_ sender: UIButton) {
        checkboxButton.isSelected = !checkboxButton.isSelected
    }
    
    @IBAction func didPressCreate(_ sender: UIButton) {
        
        let emailAlert = UIAlertController(title: "Email Required", message: "Please enter your email address", preferredStyle: .alert)
        let emailOK = UIAlertAction(title: "OK", style: .default) { (UIAlertAction) in
        }
        emailAlert.addAction(emailOK)
        
        let passwordAlert = UIAlertController(title: "Password Required", message: "Please enter your password", preferredStyle: .alert)
        let passwordOK = UIAlertAction(title: "OK", style: .default) { (UIAlertAction) in
        }
        passwordAlert.addAction(passwordOK)
        
        let termsAlert = UIAlertController(title: "Terms & Conditions", message: "Please accept the Terms & Conditions", preferredStyle: .alert)
        let termsOK = UIAlertAction(title: "OK", style: .default) { (UIAlertAction) in
        }
        termsAlert.addAction(termsOK)
        
        if (emailField.text?.isEmpty)! {
            present(emailAlert, animated: true, completion: nil)
        } else if (passwordField.text?.isEmpty)! {
            present(passwordAlert, animated: true, completion: nil)
        } else if (!checkboxButton.isSelected) {
            present(termsAlert, animated: true, completion: nil)
        } else {
            
            createLoading.startAnimating()
            
            delay(2) {
                
                self.createLoading.stopAnimating()
                self.performSegue(withIdentifier: "createSegue", sender: nil)
                
            }
            
        }
    }
    

}
