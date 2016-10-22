//
//  FeedViewController.swift
//  FacebookDemo
//
//  Created by Yang Yang on 10/11/16.
//  Copyright © 2016 Yang Yang. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!

    var refreshControl: UIRefreshControl!
    
    func run(after wait: TimeInterval, closure: @escaping () -> Void) {
        let queue = DispatchQueue.main
        queue.asyncAfter(deadline: DispatchTime.now() + wait, execute: closure)
    }
    
    func onRefresh() {
        run(after: 2) {
            self.refreshControl.endRefreshing()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.contentSize = imageView.frame.size
        refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(onRefresh), for: .valueChanged)
        scrollView.insertSubview(refreshControl, at: 0)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        imageView.isHidden = true
        activityIndicator.startAnimating()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        delay(2) {
            self.activityIndicator.stopAnimating()
            self.imageView.isHidden = false
        }
    }
    
}
