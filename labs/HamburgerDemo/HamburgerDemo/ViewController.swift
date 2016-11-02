//
//  ViewController.swift
//  HamburgerDemo
//
//  Created by Yang Yang on 11/1/16.
//  Copyright © 2016 Yang Yang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var backContainerView: UIView!
    @IBOutlet weak var frontContainerView: UIView!
        
    let main = UIStoryboard(name: "Main", bundle: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let strawberryViewController = main.instantiateViewController(withIdentifier: "StrawberryViewController")
        let grapeViewController = main.instantiateViewController(withIdentifier: "GrapeViewController")
        strawberryViewController.view.frame = backContainerView.bounds
        backContainerView.addSubview(strawberryViewController.view)
        grapeViewController.view.frame = frontContainerView.bounds
        frontContainerView.addSubview(grapeViewController.view)
    }

    @IBAction func didPanTopView(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: view)
        frontContainerView.transform = frontContainerView.transform.translatedBy(x: translation.x, y: 0)
        sender.setTranslation(CGPoint.zero, in: view)
    }

}

