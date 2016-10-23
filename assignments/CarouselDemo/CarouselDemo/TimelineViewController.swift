//
//  TimelineViewController.swift
//  CarouselDemo
//
//  Created by Yang Yang on 10/22/16.
//  Copyright © 2016 Yang Yang. All rights reserved.
//

import UIKit

class TimelineViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var scrubber: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.contentSize = imageView.frame.size
    }

}
