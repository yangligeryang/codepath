//
//  ProfileViewController.swift
//  TinderDemo
//
//  Created by Yang Yang on 11/10/16.
//  Copyright © 2016 Yang Yang. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var imageContainer: UIView!
    @IBOutlet weak var imageView: UIImageView!
    
    let duplicateImageFrame = CGRect(x: 16, y: 16, width: 343, height: 400)
    var duplicateImageView: UIImageView!
    var profileImage: UIImage!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        UIView.animate(withDuration: 0.4, animations: {
            self.imageView.alpha = 1
        }, completion: { (Bool) in
            self.duplicateImageView.removeFromSuperview()
        })
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        duplicateImageView = UIImageView(frame: duplicateImageFrame)
        duplicateImageView.image = profileImage
        imageView.image = profileImage
        imageContainer.addSubview(duplicateImageView)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func didTapDone(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }

}
