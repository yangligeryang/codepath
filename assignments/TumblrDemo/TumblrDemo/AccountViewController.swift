//
//  AccountViewController.swift
//  TumblrDemo
//
//  Created by Yang Yang on 11/6/16.
//  Copyright © 2016 Yang Yang. All rights reserved.
//

import UIKit

class AccountViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    
    var fadeTransition: FadeTransition!

    override func viewDidLoad() {
        
        super.viewDidLoad()

        scrollView.contentSize = imageView.frame.size
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let destination = segue.destination
        destination.modalPresentationStyle = UIModalPresentationStyle.custom
        fadeTransition = FadeTransition()
        destination.transitioningDelegate = fadeTransition
        fadeTransition.duration = 0.4
        
    }

}
