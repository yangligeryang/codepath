//
//  WelcomeViewController.swift
//  DropboxDemo
//
//  Created by Yang Yang on 10/16/16.
//  Copyright © 2016 Yang Yang. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var pageControl: UIPageControl!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.contentSize = CGSize(width: 1125, height: 667)
        scrollView.delegate = self
        
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView!) {
        // Get the current page based on the scroll offset
        let page : Int = Int(round(scrollView.contentOffset.x / 375))
        
        // Set the current page, so the dots will update
        pageControl.currentPage = page
    }
    
}
