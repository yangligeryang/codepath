//
//  HomeViewController.swift
//  TumblrDemo
//
//  Created by Yang Yang on 11/6/16.
//  Copyright © 2016 Yang Yang. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    var fadeTransition: FadeTransition!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let destination = segue.destination
        destination.modalPresentationStyle = UIModalPresentationStyle.custom
        fadeTransition = FadeTransition()
        destination.transitioningDelegate = fadeTransition
        fadeTransition.duration = 0.4
        
    }

}
