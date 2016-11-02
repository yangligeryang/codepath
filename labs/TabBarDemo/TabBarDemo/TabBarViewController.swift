//
//  TabBarViewController.swift
//  TabBarDemo
//
//  Created by Yang Yang on 11/1/16.
//  Copyright © 2016 Yang Yang. All rights reserved.
//

import UIKit

class TabBarViewController: UIViewController {
    
    @IBOutlet weak var containerView: UIScrollView!
    var lavenderViewController: UIViewController!
    var orchidViewController: UIViewController!
    var skyViewController: UIViewController!
    
    let main = UIStoryboard(name: "Main", bundle: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        containerView.contentSize = CGSize(width: containerView.frame.size.width * 3, height: containerView.frame.size.height)
        
        orchidViewController = main.instantiateViewController(withIdentifier: "OrchidViewController")
        orchidViewController.view.frame = containerView.bounds
        containerView.addSubview(orchidViewController.view)
        
        lavenderViewController = main.instantiateViewController(withIdentifier: "LavenderViewController")
        lavenderViewController.view.frame = containerView.bounds
        lavenderViewController.view.frame.origin.x = containerView.frame.size.width
        containerView.addSubview(lavenderViewController.view)
        
        skyViewController = main.instantiateViewController(withIdentifier: "SkyViewController")
        skyViewController.view.frame = containerView.bounds
        skyViewController.view.frame.origin.x = containerView.frame.size.width * 2
        containerView.addSubview(skyViewController.view)
    }
    
    @IBAction func didTapOrchidButton(_ sender: UIButton) {
        containerView.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
    }
    
    @IBAction func didTapLavenderButton(_ sender: UIButton) {
        containerView.setContentOffset(CGPoint(x: containerView.frame.size.width, y: 0), animated: true)
    }
    
    @IBAction func didTapSkyButton(_ sender: UIButton) {
        containerView.setContentOffset(CGPoint(x: containerView.frame.size.width * 2, y: 0), animated: true)
    }


}
