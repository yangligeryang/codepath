//
//  IntroViewController.swift
//  CarouselDemo
//
//  Created by Yang Yang on 10/18/16.
//  Copyright © 2016 Yang Yang. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var scrollBackground: UIImageView!

    @IBOutlet weak var housePhoto: UIImageView!
    @IBOutlet weak var dogPhoto: UIImageView!
    @IBOutlet weak var fishPhoto: UIImageView!
    @IBOutlet weak var lakePhoto: UIImageView!
    @IBOutlet weak var deerPhoto: UIImageView!
    @IBOutlet weak var couplePhoto: UIImageView!
    
    // Arrays of initial transform values for tiles
    var yOffsets : [Float] = [-285, -240, -415, -408, -480, -500]
    var xOffsets : [Float] = [-30, 75, -66, 10, -200, -15]
    var scales : [Float] = [1, 1.65, 1.7, 1.6, 1.65, 1.65]
    var rotations : [Float] = [-10, -10, 10, 10, 10, -10]
    
    var offset: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.contentSize = scrollBackground.frame.size
        scrollView.delegate = self
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        offset = scrollView.contentOffset.y
    }
    
}
