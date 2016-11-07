//
//  ComposeViewController.swift
//  TumblrDemo
//
//  Created by Yang Yang on 11/6/16.
//  Copyright © 2016 Yang Yang. All rights reserved.
//

import UIKit

class ComposeViewController: UIViewController {
    
    @IBOutlet var actions: [UIButton]!
    
    let offset: CGFloat = 499
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        for action in actions {
            action.center = CGPoint(x: action.center.x, y: action.center.y + offset)
        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        for (index, action) in actions.enumerated() {
            let timedDelay = Double(index) * 0.1
            UIView.animate(withDuration: 0.4, delay: timedDelay, usingSpringWithDamping: 0.8, initialSpringVelocity: 4, options: [], animations: {
                action.center = CGPoint(x: action.center.x, y: action.center.y - self.offset)
            }, completion: { (Bool) in
            })
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didTapCancel(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}
