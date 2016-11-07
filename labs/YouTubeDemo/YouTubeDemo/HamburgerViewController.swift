//
//  HamburgerViewController.swift
//  YouTubeDemo
//
//  Created by Yang Yang on 11/3/16.
//  Copyright © 2016 Yang Yang. All rights reserved.
//

import UIKit

class HamburgerViewController: UIViewController {

    @IBOutlet weak var feedView: UIView!
    @IBOutlet weak var menuView: UIView!
    
    let main = UIStoryboard(name: "Main", bundle: nil)
    var menuViewController: UIViewController!
    var feedViewController: UIViewController!
    var feedViewOriginalCenter: CGPoint!
    var threedtransform = CATransform3DIdentity
    var animation = CABasicAnimation(keyPath: "transform")
    
    func setAnchorPoint(_ anchorPoint: CGPoint, forView view: UIView) {
        var newPoint = CGPoint(x: view.bounds.size.width * anchorPoint.x, y: view.bounds.size.height * anchorPoint.y)
        var oldPoint = CGPoint(x: view.bounds.size.width * view.layer.anchorPoint.x, y: view.bounds.size.height * view.layer.anchorPoint.y)
        
        newPoint = newPoint.applying(view.transform)
        oldPoint = oldPoint.applying(view.transform)
        
        var position = view.layer.position
        position.x -= oldPoint.x
        position.x += newPoint.x
        
        position.y -= oldPoint.y
        position.y += newPoint.y
        
        view.layer.position = position
        view.layer.anchorPoint = anchorPoint
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        menuViewController = main.instantiateViewController(withIdentifier: "MenuViewController") as! MenuViewController
        feedViewController = main.instantiateViewController(withIdentifier: "FeedViewController") as! FeedViewController
        
        menuViewController.view.frame = menuView.bounds
        menuView.addSubview(menuViewController.view)
        menuView.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        
//        threedtransform.m34 = 1.0 / 500.0
//        threedtransform = CATransform3DRotate(threedtransform, CGFloat(10 * M_PI / 180), 0, 1, 0)
//        animation.toValue = NSValue(caTransform3D:threedtransform)
//        animation.duration = 0.6
        
        setAnchorPoint(CGPoint(x: 1.0, y: 1.0), forView: feedView)
        feedViewController.view.frame = feedView.bounds
        feedView.addSubview(feedViewController.view)
        feedViewOriginalCenter = feedView.center
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didPanFeed(_ sender: UIPanGestureRecognizer) {
        
        let translation = sender.translation(in: view)
        let velocity = sender.velocity(in: view)
        var scale: CGFloat!
        var originX: CGFloat!
        
        if sender.state == .began {
            
            feedViewOriginalCenter = feedView.center
            
        } else if sender.state == .changed {
            
            originX = feedView.frame.origin.x
            scale = convertValue(inputValue: originX, r1Min: 0, r1Max: 321, r2Min: 0.9, r2Max: 1)
            menuView.transform = CGAffineTransform(scaleX: scale, y: scale)
            feedView.center = CGPoint(x: feedViewOriginalCenter.x + translation.x, y: feedViewOriginalCenter.y)
            
        } else if sender.state == .ended {
            
            if velocity.x > 0 {
                
                UIView.animate(withDuration: 0.6, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: [], animations: {
                    self.feedView.frame.origin.x = 321
                    self.menuView.transform = CGAffineTransform.identity
                }, completion: { (Bool) in
                })
                
            } else {
                
                UIView.animate(withDuration: 0.6, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 1, options: [], animations: {
                    self.feedView.frame.origin.x = 0
                    self.menuView.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
                }, completion: { (Bool) in
                })
                
            }
            
        }
        
    }

}
