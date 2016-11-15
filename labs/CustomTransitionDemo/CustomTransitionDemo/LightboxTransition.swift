//
//  LightboxTransition.swift
//  CustomTransitionDemo
//
//  Created by Yang Yang on 11/15/16.
//  Copyright © 2016 Yang Yang. All rights reserved.
//

import UIKit

class LightboxTransition: BaseTransition {

    var originalY: CGFloat!
    var blackView: UIView!
    
    override func presentTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        
        originalY = toViewController.view.frame.origin.y
        
        toViewController.view.alpha = 0
        toViewController.view.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
        
        blackView = UIView()
        blackView.frame = fromViewController.view.bounds
        blackView.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        blackView.alpha = 0
        fromViewController.view.addSubview(blackView)
        
        UIView.animate(withDuration: duration, animations: {
            self.blackView.alpha = 0.8
            toViewController.view.alpha = 1
            toViewController.view.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        }) { (finished: Bool) -> Void in
            self.finish()
        }
    }
    
    override func dismissTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        
        fromViewController.view.alpha = 1
        fromViewController.view.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        
        UIView.animate(withDuration: duration, animations: {
            fromViewController.view.alpha = 0
            fromViewController.view.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
            self.blackView.alpha = 0
        }) { (finished: Bool) -> Void in
            self.blackView.removeFromSuperview()
            self.finish()
        }
    }
    
}
