//
//  SignInRootViewController.swift
//  DropboxDemo
//
//  Created by Yang Yang on 10/15/16.
//  Copyright © 2016 Yang Yang. All rights reserved.
//

import UIKit

class SignInRootViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        performSegue(withIdentifier: "signIn", sender: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
