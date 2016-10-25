//
//  TermsViewController.swift
//  CarouselDemo
//
//  Created by Yang Yang on 10/24/16.
//  Copyright © 2016 Yang Yang. All rights reserved.
//

import UIKit

class TermsViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    
    let url = "https://www.dropbox.com/terms?mobile=1"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let requestURL = NSURL(string:url)
        let request = NSURLRequest(url: requestURL! as URL)
        webView.loadRequest(request as URLRequest)
    }

    @IBAction func onExit(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
}
