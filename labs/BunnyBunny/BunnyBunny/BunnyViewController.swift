//
//  BunnyViewController.swift
//  BunnyBunny
//
//  Created by Yang Yang on 10/18/16.
//  Copyright © 2016 Yang Yang. All rights reserved.
//

import UIKit

class BunnyViewController: UIViewController {

    @IBOutlet weak var bunnyImageView: UIImageView!
    @IBOutlet weak var responseText: UILabel!
    @IBOutlet weak var inputField: UITextField!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var initialOrigin:CGPoint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialOrigin = bunnyImageView.center
        responseText.text = "Hi there!!! 🤘"
    }

    @IBAction func didPressUp(_ sender: UIButton) {
        UIView.animate(withDuration: 0.3) { 
            self.bunnyImageView.center.y = self.bunnyImageView.center.y - 20
        }
    }

    @IBAction func didPressLeft(_ sender: UIButton) {
        UIView.animate(withDuration: 0.3) {
            self.bunnyImageView.center.x = self.bunnyImageView.center.x - 20
        }
    }
    
    @IBAction func didPressRight(_ sender: UIButton) {
        UIView.animate(withDuration: 0.3) {
            self.bunnyImageView.center.x = self.bunnyImageView.center.x + 20
        }
    }
    
    @IBAction func didPressDown(_ sender: UIButton) {
        UIView.animate(withDuration: 0.3) {
            self.bunnyImageView.center.y = self.bunnyImageView.center.y + 20
        }
    }
    
    @IBAction func onPressShrink(_ sender: UIButton) {
        UIView.animate(withDuration: 0.3) {
            self.bunnyImageView.transform = self.bunnyImageView.transform.scaledBy(x: 0.8, y: 0.8)
        }
    }
    
    @IBAction func onPressGrow(_ sender: UIButton) {
        UIView.animate(withDuration: 0.3) {
            self.bunnyImageView.transform = self.bunnyImageView.transform.scaledBy(x: 1.2, y: 1.2)
        }
    }

    @IBAction func didPressRotateLeft(_ sender: UIButton) {
        UIView.animate(withDuration: 0.3) { 
            self.bunnyImageView.transform = self.bunnyImageView.transform.rotated(by: CGFloat(-20 * M_PI / 180))
        }
    }

    @IBAction func didPressRotateRight(_ sender: UIButton) {
        UIView.animate(withDuration: 0.3) {
            self.bunnyImageView.transform = self.bunnyImageView.transform.rotated(by: CGFloat(20 * M_PI / 180))
        }
    }

    @IBAction func onPressReset(_ sender: UIButton) {
        bunnyImageView.center = initialOrigin
        UIView.animate(withDuration: 0.6) {
            self.bunnyImageView.transform = CGAffineTransform.identity
            self.bunnyImageView.alpha = 1
        }
    }
    
    @IBAction func didTap(_ sender: UITapGestureRecognizer) {
        let location = sender.location(in: view)
        UIView.animate(withDuration: 0.3) { 
            self.bunnyImageView.center = location
        }
    }
    
    @IBAction func didPressSend(_ sender: UIButton) {
        
        responseText.text = ""
        activityIndicator.startAnimating()
        
        var response: String
        
        if (inputField.text?.contains("hello"))! {
            response = "You said hello somewhere"
        } else if (inputField.text?.contains("your name"))! {
            response = "My name is Bunny"
        } else if (inputField.text?.contains("be my friend"))! {
            response = "Sure why not"
        } else if (inputField.text?.contains("bye"))! {
            response = "Goodbye!"
        } else {
            response = "This does not compute"
        }
        
        delay(2, closure: {
            self.responseText.text = response
            self.inputField.text = ""
            self.activityIndicator.stopAnimating()
        })
        
//        UIView.animate(withDuration: 0.6, delay: 1, options: [], animations: {
//            self.responseText.text = response
//            self.inputField.text = ""
//            }, completion: nil)
    }
    
    @IBAction func didTapLogout(_ sender: UIButton) {
        
        let alertController = UIAlertController(title: "Are you sure you want to log out?", message: nil, preferredStyle: .alert)
        
        let confirmAction = UIAlertAction(title: "Yes", style: .default) { (action: UIAlertAction) in
            self.dismiss(animated: true, completion: nil)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action: UIAlertAction) in
        }
        
        alertController.addAction(confirmAction)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true, completion: nil)

    }
    
    
}
