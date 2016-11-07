//
//  SearchViewController.swift
//  TumblrDemo
//
//  Created by Yang Yang on 11/6/16.
//  Copyright © 2016 Yang Yang. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    
    @IBOutlet weak var loadingImageView: UIImageView!
    @IBOutlet weak var feedImageView: UIImageView!
    
    var loading1: UIImage!
    var loading2: UIImage!
    var loading3: UIImage!
    var images: [UIImage]!
    var animatedImage: UIImage!

    override func viewDidLoad() {
        super.viewDidLoad()

        loading1 = UIImage(named: "loading-1")
        loading2 = UIImage(named: "loading-2")
        loading3 = UIImage(named: "loading-3")
        
        images = [loading1, loading2, loading3]
        animatedImage = UIImage.animatedImage(with: images, duration: 0.8)
        loadingImageView.image = animatedImage
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        delay(0.6, closure: {
            
            UIView.animate(withDuration: 1, animations: {
                self.loadingImageView.alpha = 0
            }, completion: { (Bool) in
                UIView.animate(withDuration: 0.6, animations: { 
                    self.feedImageView.alpha = 1
                })
            })
            
        })
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
