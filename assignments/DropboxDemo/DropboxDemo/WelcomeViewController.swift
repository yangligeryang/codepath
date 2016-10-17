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
        
        scrollView.delegate = self
        scrollView.contentSize = CGSize(width: 1125, height: 667)
        
    }
    
    @objc(scrollViewDidEndDecelerating:) func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {

        let pageNumber : Int = Int(round(scrollView.contentOffset.x / 375))
            
        // Set the current page, so the dots will update
        pageControl.currentPage = pageNumber
    }
    
}
