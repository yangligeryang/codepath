//
//  SignInFormViewController.swift
//  DropboxDemo
//
//  Created by Yang Yang on 10/15/16.
//  Copyright © 2016 Yang Yang. All rights reserved.
//

import UIKit

class SignInFormViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var formImage: UIImageView!
    
    let resetImage = UIImage(named: "sign_in")
    let activeImage = UIImage(named: "sign_in1")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailField.delegate = self
        emailField.becomeFirstResponder()
        passwordField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if emailField.isFirstResponder {
            emailField.resignFirstResponder()
            passwordField.becomeFirstResponder()
        } else if passwordField.isFirstResponder {
            let characterCount = passwordField.text?.characters.count
            if characterCount! > 0 {
                performSegue(withIdentifier: "existingAccount", sender: nil)
            }
        }
        
        return false
    }

    @IBAction func onBack(_ sender: UIButton) {
        navigationController!.popViewController(animated: true)
    }
    
    @IBAction func onCreate(_ sender: UIButton) {
        performSegue(withIdentifier: "existingAccount", sender: nil)
    }
    
    @IBAction func didTap(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }

    @IBAction func onForgotPassword(_ sender: UIButton) {
        
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let forgotAction = UIAlertAction(title: "Forgot Password?", style: .default) { (action) in
        }
        alertController.addAction(forgotAction)
        
        let ssoAction = UIAlertAction(title: "Single Sign-On", style: .default) { (action) in
        }
        alertController.addAction(ssoAction)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
        }
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true) {}
        
    }
    
    @IBAction func onPasswordChanged(_ sender: UITextField) {
        let characterCount = passwordField.text?.characters.count
        if characterCount! > 0 {
            signInButton.isEnabled = true
            formImage.image = activeImage
        } else {
            formImage.image = resetImage
            signInButton.isEnabled = false
        }
    }

}
