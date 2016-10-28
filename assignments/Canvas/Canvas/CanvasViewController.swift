//
//  CanvasViewController.swift
//  Canvas
//
//  Created by Yang Yang on 10/27/16.
//  Copyright © 2016 Yang Yang. All rights reserved.
//

import UIKit

class CanvasViewController: UIViewController, UIGestureRecognizerDelegate {

    @IBOutlet weak var trayView: UIView!
    @IBOutlet weak var trayArrow: UIImageView!
    
    var trayOriginalCenter: CGPoint!
    var trayTop: CGFloat!
    var trayOriginalTop: CGFloat!
    var trayDownOffset: CGFloat!
    var trayUp: CGPoint!
    var trayDown: CGPoint!
    var newlyCreatedFace: UIImageView!
    var newlyCreatedFaceOriginalCenter: CGPoint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        trayDownOffset = 178
        trayUp = trayView.center
        trayDown = CGPoint(x: trayView.center.x ,y: trayView.center.y + trayDownOffset)
        trayOriginalTop = trayView.frame.origin.y
        trayTop = trayOriginalTop
        
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
    func didPanNewFace(sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: view)
        let location = sender.location(in: view)
        newlyCreatedFace = sender.view as! UIImageView
        
        if sender.state == .began {
            
            newlyCreatedFaceOriginalCenter = newlyCreatedFace.center
            UIView.animate(withDuration: 0.2, animations: {
                self.newlyCreatedFace.transform = CGAffineTransform(scaleX: 2, y: 2)
            })
            
        } else if sender.state == .changed {
            
            newlyCreatedFace.center = CGPoint(x: newlyCreatedFaceOriginalCenter.x + translation.x, y: newlyCreatedFaceOriginalCenter.y + translation.y)
            
        } else if sender.state == .ended {
            
            if location.y > trayTop {
                newlyCreatedFace.center = newlyCreatedFaceOriginalCenter
                self.newlyCreatedFace.transform = CGAffineTransform(scaleX: 1.6, y: 1.6)
            } else {
                UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 12, initialSpringVelocity: 24, options: [], animations: {
                    self.newlyCreatedFace.transform = CGAffineTransform(scaleX: 1.6, y: 1.6)
                    }, completion: { (Bool) in
                })
            }
            
        }
        
    }
    
    func didPinchNewFace(sender: UIPinchGestureRecognizer) {
    
        let scale = sender.scale
        let faceView = sender.view as! UIImageView
        faceView.transform = faceView.transform.scaledBy(x: scale, y: scale)
        sender.scale = 1
        
    }
    
    func didRotateNewFace(sender: UIRotationGestureRecognizer) {
        
        let rotation = sender.rotation
        let faceView = sender.view as! UIImageView
        faceView.transform = faceView.transform.rotated(by: rotation)
        sender.rotation = 0
        
    }
    
    func didTapNewFace(sender: UITapGestureRecognizer) {
    
        let faceView = sender.view as! UIImageView
        faceView.removeFromSuperview()
    
    }

    @IBAction func didPanTray(_ sender: UIPanGestureRecognizer) {
        
        let translation = sender.translation(in: view)
        let velocity = sender.velocity(in: view)
        
        if sender.state == .began {
            trayOriginalCenter = trayView.center
        } else if sender.state == .changed {
            
            var translationAmount: CGFloat!
            
            if trayView.frame.origin.y >= trayOriginalTop {
                translationAmount = translation.y
            } else {
                translationAmount = translation.y / 10
            }
            
            trayView.center = CGPoint(x: trayOriginalCenter.x, y: trayOriginalCenter.y + translationAmount)
            
        } else if sender.state == .ended {
            
            if velocity.y > 0 {
                
                UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 8, options: [], animations: {
                    self.trayView.center = self.trayDown
                    }, completion: { (Bool) in
                })
                
                UIView.animate(withDuration: 0.4, animations: {
                    self.trayArrow.transform = self.trayArrow.transform.rotated(by: CGFloat(M_PI))
                })
                
            } else {
                
                UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 8, options: [], animations: {
                    self.trayView.center = self.trayUp
                    }, completion: { (Bool) in
                })
                UIView.animate(withDuration: 0.4, animations: {
                    self.trayArrow.transform = CGAffineTransform.identity
                })
                
            }
            
            trayTop = trayView.frame.origin.y
            
        }
        

    }
    
    @IBAction func didPanFace(_ sender: UIPanGestureRecognizer) {
        
        let translation = sender.translation(in: view)
        let imageView = sender.view as! UIImageView
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(didPanNewFace(sender:)))
        let pinchGestureRecognizer = UIPinchGestureRecognizer(target: self, action: #selector(didPinchNewFace(sender:)))
        let rotateGestureRecognizer = UIRotationGestureRecognizer(target: self, action: #selector(didRotateNewFace(sender:)))
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTapNewFace(sender:)))
        tapGestureRecognizer.numberOfTapsRequired = 2;
        
        if sender.state == .began {
            
            newlyCreatedFace = UIImageView(image: imageView.image)
            view.addSubview(newlyCreatedFace)
            newlyCreatedFace.center = imageView.center
            newlyCreatedFace.center.y += trayView.frame.origin.y
            newlyCreatedFaceOriginalCenter = newlyCreatedFace.center
            newlyCreatedFace.isUserInteractionEnabled = true
            newlyCreatedFace.addGestureRecognizer(panGestureRecognizer)
            newlyCreatedFace.addGestureRecognizer(pinchGestureRecognizer)
            newlyCreatedFace.addGestureRecognizer(rotateGestureRecognizer)
            newlyCreatedFace.addGestureRecognizer(tapGestureRecognizer)
            pinchGestureRecognizer.delegate = self
            
            UIView.animate(withDuration: 0.2, animations: {
                self.newlyCreatedFace.transform = self.newlyCreatedFace.transform.scaledBy(x: 2, y: 2)
            })
            
        } else if sender.state == .changed {
            
            newlyCreatedFace.center = CGPoint(x: newlyCreatedFaceOriginalCenter.x + translation.x, y: newlyCreatedFaceOriginalCenter.y + translation.y)
            
        } else if sender.state == .ended {
            
            UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 12, initialSpringVelocity: 24, options: [], animations: {
                    self.newlyCreatedFace.transform = CGAffineTransform(scaleX: 1.6, y: 1.6)
                }, completion: { (Bool) in
            })
            
        }
        
    }

    
}
