//
//  ViewController.swift
//  AnimationDemo
//
//  Created by Yang Yang on 10/25/16.
//  Copyright © 2016 Yang Yang. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIGestureRecognizerDelegate {

    @IBOutlet weak var pigImageView: UIImageView!
    @IBOutlet weak var bikerImageView: UIImageView!
    @IBOutlet var pinchGestureRecognizer: UIPinchGestureRecognizer!
    
    var bikerOriginalCenter: CGPoint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        bikerOriginalCenter = bikerImageView.center
        pinchGestureRecognizer.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }

    @IBAction func didTapAnimatePigButton(_ sender: UIButton) {
        
//        let pi = CGFloat(M_PI)
        
//        UIView.animate(withDuration: 1, delay: 0, options: [.curveEaseInOut], animations: {
//                self.pigImageView.center.y += 150
//        }) { (Bool) in
//            
//            UIView.animate(withDuration: 1, delay: 0, options: [
//                UIViewAnimationOptions.autoreverse,
//                UIViewAnimationOptions.repeat
//                ], animations: {
//                    self.pigImageView.transform = CGAffineTransform(rotationAngle: 45 * pi / 180)
//            }) { (true) in
//            }
//            
//        }
        
//        UIView.animate(withDuration: 0.5, delay: 0.3, usingSpringWithDamping: 0.1, initialSpringVelocity: 100, options: [], animations: {
//                self.pigImageView.transform = self.pigImageView.transform.translatedBy(x: 0, y: -250)
//            }) { (Bool) in
//                UIView.animate(withDuration: 0.5, delay: 0.5, usingSpringWithDamping: 1, initialSpringVelocity: 100, options: [], animations: {
//                        self.pigImageView.transform = CGAffineTransform.identity
//                    }, completion: { (Bool) in
//                })
//        }
        
    }

    @IBAction func didTapBiker(_ sender: UITapGestureRecognizer) {
        
        let alertController = UIAlertController(title: "Whoa Dude", message: "Don't tap me", preferredStyle: .alert)
        let sorryAction = UIAlertAction(title: "Sorry man!", style: .default) { (UIAlertAction) in
        }
        alertController.addAction(sorryAction)
        present(alertController, animated: true) {
        }
        
    }
    @IBAction func didPanBiker(_ sender: UIPanGestureRecognizer) {
        
        let translation = sender.translation(in: view)
        let location = sender.location(in: view)
        print("Location x: \(location.x), y: \(location.y)")
        print("Translation x: \(translation.x), y: \(translation.y)")
        
        if sender.state == .began {
        // at beginning, called only once
            print("began")
            bikerOriginalCenter = bikerImageView.center
        } else if sender.state == .changed {
            // panning, called continuously
            print("changing")
            
            bikerImageView.center = CGPoint(x: bikerOriginalCenter.x + translation.x, y: bikerOriginalCenter.y + translation.y)
        } else if sender.state == .ended {
            // at end, called only once
            print("ended")
        }
        
    }
    @IBAction func didPanView(_ sender: UIPanGestureRecognizer) {
        
        let location = sender.location(in: view)
        print("x: \(location.x), y: \(location.y)")
        
    }
    @IBAction func didPinchBiker(_ sender: UIPinchGestureRecognizer) {
        
        let scale = sender.scale
        print("Scale \(scale)")
        bikerImageView.transform = bikerImageView.transform.scaledBy(x: scale, y: scale)
        sender.scale = 1
    }
    @IBAction func didRotateBiker(_ sender: UIRotationGestureRecognizer) {
        
        let rotation = sender.rotation
        print("Rotation \(rotation)")
        bikerImageView.transform = bikerImageView.transform.rotated(by: rotation)
        sender.rotation = 0
        
    }
    
}

