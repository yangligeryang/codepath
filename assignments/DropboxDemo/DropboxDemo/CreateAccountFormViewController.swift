//
//  CreateAccountFormViewController.swift
//  DropboxDemo
//
//  Created by Yang Yang on 10/15/16.
//  Copyright © 2016 Yang Yang. All rights reserved.
//

import UIKit

class CreateAccountFormViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var firstNameField: UITextField!
    @IBOutlet weak var lastNameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var formImage: UIImageView!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var createButton: UIButton!
    
    let resetForm = UIImage(named: "create")
    let noPassword = UIImage(named: "create1")
    let weakPassword = UIImage(named: "create2")
    let sosoPassword = UIImage(named: "create3")
    let goodPassword = UIImage(named: "create4")
    let greatPassword = UIImage(named: "create5")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstNameField.delegate = self
        firstNameField.becomeFirstResponder()
        lastNameField.delegate = self
        emailField.delegate = self
        passwordField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func showActionSheet() {
        
        let alertController = UIAlertController(title: "Before you can complete your registration, you must accept the Dropbox Terms of Service.", message: nil, preferredStyle: .actionSheet)
        
        let agreeAction = UIAlertAction(title: "I Agree", style: .default) { (action) in
            self.performSegue(withIdentifier: "newAccount", sender: nil)
        }
        alertController.addAction(agreeAction)
        
        let viewAction = UIAlertAction(title: "View Terms", style: .default) { (action) in
            self.performSegue(withIdentifier: "termsService", sender: nil)
        }
        alertController.addAction(viewAction)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
        }
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true) {}
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if firstNameField.isFirstResponder {
            firstNameField.resignFirstResponder()
            lastNameField.becomeFirstResponder()
        } else if lastNameField.isFirstResponder {
            lastNameField.resignFirstResponder()
            emailField.becomeFirstResponder()
        } else if emailField.isFirstResponder {
            emailField.resignFirstResponder()
            passwordField.becomeFirstResponder()
        } else if passwordField.isFirstResponder {
            showActionSheet()
        }
        return false
    }

    @IBAction func onBack(_ sender: UIButton) {
        navigationController!.popViewController(animated: true)
    }

    @IBAction func didTap(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    @IBAction func onCreate(_ sender: UIButton) {
        showActionSheet()
    }
    
    @IBAction func onPasswordFocus(_ sender: UITextField) {
        let characterCount = passwordField.text?.characters.count
        if characterCount! == 0 {
            formImage.image = noPassword
        }
    }
    
    @IBAction func onPasswordChanged(_ sender: UITextField) {
        let characterCount = passwordField.text?.characters.count
        if characterCount! < 4 {
            formImage.image = weakPassword
        } else if characterCount! < 6 {
            formImage.image = sosoPassword
        } else if characterCount! < 8 {
            formImage.image = goodPassword
        } else {
            formImage.image = greatPassword
        }
        if characterCount! > 0 {
            createButton.isEnabled = true
        } else {
            formImage.image = noPassword
            createButton.isEnabled = false
        }
    }
    
    @IBAction func onPasswordBlur(_ sender: UITextField) {
        let characterCount = passwordField.text?.characters.count
        if characterCount! == 0 {
            formImage.image = resetForm
        }
        
    }
    
    
    
}
