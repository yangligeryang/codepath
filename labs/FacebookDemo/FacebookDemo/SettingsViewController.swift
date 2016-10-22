//
//  SettingsViewController.swift
//  FacebookDemo
//
//  Created by Yang Yang on 10/21/16.
//  Copyright © 2016 Yang Yang. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var logoutButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        scrollView.contentSize = imageView.frame.size
    }
    
    @IBAction func didLogout(_ sender: UIButton) {
        let alertController = UIAlertController(title: nil, message: "Are you sure you want to log out?", preferredStyle: .actionSheet)
        let logoutAction = UIAlertAction(title: "Log Out", style: .destructive) { (UIAlertAction) in
            self.performSegue(withIdentifier: "logoutSegue", sender: nil)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (UIAlertAction) in
        }
        alertController.addAction(logoutAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true, completion: nil)
    }
    
}
