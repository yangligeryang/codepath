//
//  FeedViewController.swift
//  FacebookDemo
//
//  Created by Yang Yang on 10/11/16.
//  Copyright © 2016 Yang Yang. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var infiniteIndicator: UIActivityIndicatorView!
    @IBOutlet weak var emptyView: UIImageView!
    @IBOutlet var photoViews: [UIView]!
    @IBOutlet var photoImages: [UIImageView]!
    
    var refreshControl: UIRefreshControl!
    var numberOfImageViews: CGFloat = 1
    var user: String!
    var selectedPhotoView: UIView!
    var selectedPhoto: UIImageView!
    var transition: PhotoTransition!
    
    func onRefresh() {
        print("refreshing")
        delay(2, closure: {
            self.refreshControl.endRefreshing()
        })
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        if user != "new user" {
        
            print("Scrolling stopped")
            
            if scrollView.contentOffset.y + scrollView.frame.size.height >= scrollView.contentSize.height {
                
                print("You reached the bottom")
            
                delay(1, closure: {
                    let newFrame = self.imageView.frame
                    let newImage = UIImage(named: "home_feed")
                    let newImageView = UIImageView(frame: newFrame)
                    
                    newImageView.image = newImage
                    newImageView.frame.origin.y = self.imageView.frame.origin.y + self.numberOfImageViews * self.imageView.frame.size.height
                    
                    scrollView.addSubview(newImageView)
                    
                    self.infiniteIndicator.center.y = self.imageView.frame.size.height + 40 + self.numberOfImageViews * newImageView.frame.size.height
                    print(self.infiniteIndicator.frame.origin.y)
                    
                    scrollView.contentSize = CGSize(width: self.imageView.frame.size.width, height: self.imageView.frame.size.height + self.numberOfImageViews * newImageView.frame.size.height)
                    
                    self.numberOfImageViews += 1
                })
            }
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if user != "new user" {

            scrollView.delegate = self
            scrollView.contentSize = imageView.frame.size
            
            refreshControl = UIRefreshControl()
            refreshControl.addTarget(self, action: #selector(onRefresh), for: .valueChanged)
            scrollView.insertSubview(refreshControl, at: 0)
            
            infiniteIndicator.center.y = imageView.frame.size.height + 40
            scrollView.contentInset.bottom = 80

        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        let defaults = UserDefaults.standard
        user = defaults.object(forKey: "user") as! String
        
        if user == "new user" {
            emptyView.isHidden = false
            scrollView.isHidden = true
        }
        activityIndicator.startAnimating()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        delay(2) {
            self.activityIndicator.stopAnimating()
            self.imageView.isHidden = false
            for photo in self.photoViews {
                photo.isHidden = false
            }
        }
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! PhotoViewController
        destination.photoView = self.selectedPhotoView
        destination.photoImageView = self.selectedPhoto
        destination.photoImage = self.selectedPhoto.image
        destination.modalPresentationStyle = UIModalPresentationStyle.custom
        transition = PhotoTransition()
        destination.transitioningDelegate = transition
        transition.duration = 0.4

    }
    
    @IBAction func didTapPhoto(_ sender: UITapGestureRecognizer) {
        self.selectedPhotoView = sender.view as UIView!
        let index = photoViews.index(of: selectedPhotoView)
        self.selectedPhoto = self.photoImages[index!]
        performSegue(withIdentifier: "photoDetailSegue", sender: nil)
    }

}
