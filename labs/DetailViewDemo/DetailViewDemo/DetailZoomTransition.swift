//
//  DetailZoomTransition.swift
//  DetailViewDemo
//
//  Created by Yang Yang on 11/15/16.
//  Copyright © 2016 Yang Yang. All rights reserved.
//

import UIKit

class DetailZoomTransition: BaseTransition {
    
    var originalDetailImageViewFrame: CGRect!
    
    override func presentTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        
        let detailViewController = toViewController as! DetailViewController
        let detailImageView = detailViewController.imageView
        originalDetailImageViewFrame = detailImageView?.frame
        
        let photoViewController = fromViewController as! PhotoViewController
        let selectedImageView = photoViewController.selectedImageView
        
        detailImageView!.frame = selectedImageView!.frame
        toViewController.view.alpha = 0
        
        UIView.animate(withDuration: duration, animations: {
            
            detailImageView?.frame = self.originalDetailImageViewFrame
            toViewController.view.alpha = 1
            
        }) { (finished: Bool) -> Void in
            self.finish()
        }
    }
    
    override func dismissTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        
        let detailViewController = fromViewController as! DetailViewController
        let detailImageView = detailViewController.imageView
        
        let photoViewController = toViewController as! PhotoViewController
        let selectedImageView = photoViewController.selectedImageView
        originalDetailImageViewFrame = selectedImageView?.frame
        
        fromViewController.view.alpha = 1
        
        UIView.animate(withDuration: duration, animations: {
            
            detailImageView?.frame = self.originalDetailImageViewFrame
            fromViewController.view.alpha = 0
        
        }) { (finished: Bool) -> Void in
            self.finish()
        }
    }

}
