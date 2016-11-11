//
//  CardsViewController.swift
//  TinderDemo
//
//  Created by Yang Yang on 11/10/16.
//  Copyright © 2016 Yang Yang. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController {

    var cardInitialCenter: CGPoint!
    var signFlip: CGFloat!
    var fadeTransition: FadeTransition!
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let destination = segue.destination as! ProfileViewController
        destination.profileImage = self.imageView.image
        destination.modalPresentationStyle = UIModalPresentationStyle.custom
        fadeTransition = FadeTransition()
        destination.transitioningDelegate = fadeTransition
        fadeTransition.duration = 0.4
        
    }
    
    @IBAction func didTapView(_ sender: UITapGestureRecognizer) {
        performSegue(withIdentifier: "profileViewSegue", sender: nil)
    }
    
    @IBAction func didSwipeView(_ sender: UIPanGestureRecognizer) {
        
        let translation = sender.translation(in: view)
        let cardView = sender.view!
        let location = sender.location(in: cardView)
        
        if sender.state == .began {
            
            cardInitialCenter = cardView.center
            if location.y > (cardView.frame.height / 2) {
                signFlip = -1
            } else {
                signFlip = 1
            }
            
        } else if sender.state == .changed {
            
            cardView.center.x = cardInitialCenter.x + translation.x
            let changeAngle = translation.x / 2 * CGFloat(M_PI) / 180 * signFlip
            cardView.transform = CGAffineTransform(rotationAngle: changeAngle)
            
        } else if sender.state == .ended {
            
            
            if translation.x > -50 && translation.x < 50 {
                
                UIView.animate(withDuration: 0.4, animations: {
                    cardView.center = self.cardInitialCenter
                    cardView.transform = CGAffineTransform.identity
                })
                
            } else {
                
                if translation.x <= -50 {
                    
                    UIView.animate(withDuration: 1.2, animations: {
                        cardView.center.x = -1 * cardView.frame.width
                        cardView.transform = CGAffineTransform(rotationAngle: cardView.frame.width * CGFloat(M_PI) * 360)
                    })
                    
                } else if translation.x >= 50 {
                    
                    UIView.animate(withDuration: 1.2, animations: {
                        cardView.center.x = 375 + cardView.frame.width
                        cardView.transform = CGAffineTransform(rotationAngle: (375 + cardView.frame.width) * CGFloat(M_PI) * 360)
                    })
                    
                }
                
            }
            
        }
        
    }

}
