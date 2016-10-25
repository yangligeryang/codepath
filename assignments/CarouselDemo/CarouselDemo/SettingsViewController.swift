//
//  SettingsViewController.swift
//  CarouselDemo
//
//  Created by Yang Yang on 10/22/16.
//  Copyright © 2016 Yang Yang. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.contentSize = imageView.frame.size
    }
    
    @IBAction func didPressClose(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func didPressSignout(_ sender: UIButton) {
        
        let signoutActions = UIAlertController(title: "Are you sure you want to sign out?", message: nil, preferredStyle: .actionSheet)
        let confirmAction = UIAlertAction(title: "Sign Out", style: .destructive) { (UIAlertAction) in
            self.performSegue(withIdentifier: "signoutSegue", sender: nil)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (UIAlertAction) in
        }
        signoutActions.addAction(confirmAction)
        signoutActions.addAction(cancelAction)
        
        present(signoutActions, animated: true, completion: nil)
        
    }
    

}
