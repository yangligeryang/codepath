//
//  TutorialViewController.swift
//  CarouselDemo
//
//  Created by Yang Yang on 10/22/16.
//  Copyright © 2016 Yang Yang. All rights reserved.
//

import UIKit

class TutorialViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var buttonParentView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.delegate = self
        scrollView.contentSize = CGSize(width: 4 * 375, height: 667)
    }
    
    @objc(scrollViewDidEndDecelerating:) func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        let pageNumber : Int = Int(round(scrollView.contentOffset.x / 375))
        pageControl.currentPage = pageNumber
        
        if pageControl.currentPage == 3 {
            UIView.animate(withDuration: 1, animations: { 
                self.pageControl.alpha = 0
                self.buttonParentView.alpha = 1
            })
        } else {
            UIView.animate(withDuration: 1, animations: {
                self.pageControl.alpha = 1
                self.buttonParentView.alpha = 0
            })
        }
        
    }

}
