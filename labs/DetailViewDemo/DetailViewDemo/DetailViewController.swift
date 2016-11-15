//
//  DetailViewController.swift
//  DetailViewDemo
//
//  Created by Yang Yang on 11/15/16.
//  Copyright © 2016 Yang Yang. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    var image: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageView.image = image
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func didTapDismiss(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}
