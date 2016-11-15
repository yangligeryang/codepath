//
//  PhotoZoomTransition.swift
//  FacebookDemo
//
//  Created by Yang Yang on 11/15/16.
//  Copyright © 2016 Yang Yang. All rights reserved.
//

import UIKit

class PhotoZoomTransition: BaseTransition {

    var aspectRatio: CGFloat!
    var largeFrame: CGRect!
    var feedViewFrame: CGRect!
    var feedImageViewFrame: CGRect!

    override func presentTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        
        toViewController.view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
        
        let photoViewController = toViewController as! PhotoViewController
        let photoContainer = photoViewController.photoContainer
        let photo = photoViewController.photo as UIImageView
        let photoImage = photoViewController.photoImage
        aspectRatio = CGFloat((photoImage?.size.height)! / (photoImage?.size.width)!)
        largeFrame = CGRect(x: 0, y: 0, width: 375, height: 375 * aspectRatio)
        
        if self.largeFrame.height < photoViewController.scrollView.frame.size.height {
            photoViewController.scrollView.frame.size.height = self.largeFrame.height
            photoViewController.scrollView.clipsToBounds = false
        }
        
        let tabViewController = fromViewController as! UITabBarController
        let navigationController = tabViewController.selectedViewController as! UINavigationController
        let feedViewController = navigationController.topViewController as! FeedViewController
        
        let feedImageView = feedViewController.selectedPhoto as UIImageView
        let feedViewIndex = Int(feedViewController.photoImages.index(of: feedImageView)!)
        feedViewFrame = feedViewController.photoViews[feedViewIndex].frame
        feedImageViewFrame = feedImageView.frame
        print(feedViewFrame)
        
        photoContainer?.frame = (photoContainer?.convert(feedViewFrame, to: containerView))!
        photo.frame = feedImageViewFrame
        
        UIView.animate(withDuration: duration, animations: {
            toViewController.view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            photoContainer?.frame = self.largeFrame
            photo.frame = self.largeFrame
            photoViewController.scrollView.center = photoViewController.view.center
        }) { (finished: Bool) -> Void in
            self.finish()
        }
    
    }
    
    override func dismissTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        
        fromViewController.view.alpha = 1
        fromViewController.view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        
        let photoViewController = fromViewController as! PhotoViewController
        let photoContainer = photoViewController.photoContainer
        let photo = photoViewController.photo
        
        UIView.animate(withDuration: duration, animations: {
            fromViewController.view.alpha = 0
            fromViewController.view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
            photoContainer?.frame = self.feedViewFrame
            photo?.frame = self.feedImageViewFrame
        }) { (finished: Bool) -> Void in
            self.finish()
        }
    }
    
}
