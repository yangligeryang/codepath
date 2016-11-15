//
//  PhotoViewController.swift
//  FacebookDemo
//
//  Created by Yang Yang on 11/14/16.
//  Copyright © 2016 Yang Yang. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var photoContainer: UIView!
    @IBOutlet weak var photo: UIImageView!
    
    var aspectRatio: CGFloat!
    var photoView: UIView!
    var photoImageView: UIImageView!
    var photoImage: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        aspectRatio = CGFloat(photoImage.size.height / photoImage.size.width)
        
        UIView.animate(withDuration: 0.6, animations: {
//            self.photoContainer.frame.size = CGSize(width: 375, height: 375 * self.aspectRatio)
            self.photoContainer.frame = CGRect(x: 0, y: 0, width: 375, height: 375 * self.aspectRatio)
            self.photo.frame = self.photoContainer.frame
            print(self.photo.frame)
        })
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        photoContainer.frame = photoView.frame
        photoContainer.frame.origin.y += 57
        photo.frame = photoImageView.frame
        photo.image = photoImage
        
    }

    @IBAction func didTapDone(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }

}
