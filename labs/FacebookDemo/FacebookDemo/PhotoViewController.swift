//
//  PhotoViewController.swift
//  FacebookDemo
//
//  Created by Yang Yang on 11/14/16.
//  Copyright © 2016 Yang Yang. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var photoContainer: UIView!
    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var photoActions: UIImageView!
    @IBOutlet weak var doneButton: UIButton!
    
    var originalPhotoCenter: CGPoint!
    var photoImage: UIImage!
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let alpha: CGFloat = 1 - abs(scrollView.contentOffset.y) / originalPhotoCenter.y
        UIView.animate(withDuration: 0.4, animations: {
            self.view.backgroundColor = UIColor(white: 0, alpha: alpha)
        })
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        UIView.animate(withDuration: 0.2, animations: {
            self.photoActions.alpha = 0
            self.doneButton.alpha = 0
        })
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if abs(scrollView.contentOffset.y) > 100 {
            dismiss(animated: true, completion: nil)
        } else {
            UIView.animate(withDuration: 0.2, animations: {
                self.photoActions.alpha = 1
                self.doneButton.alpha = 1
            })
        }
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return photoContainer
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        photo.image = photoImage
        
        scrollView.delegate = self
        scrollView.contentSize = photoContainer.frame.size
        originalPhotoCenter = photoContainer.center
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func didTapDone(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }

}
