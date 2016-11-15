//
//  PhotoViewController.swift
//  DetailViewDemo
//
//  Created by Yang Yang on 11/15/16.
//  Copyright © 2016 Yang Yang. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController {

    var selectedImageView: UIImageView!
    var detailZoomTransition: DetailZoomTransition!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        detailZoomTransition = DetailZoomTransition()
        detailZoomTransition.duration = 1
        
        let detailViewController = segue.destination as! DetailViewController
        detailViewController.modalPresentationStyle = .custom
        detailViewController.transitioningDelegate = detailZoomTransition
        
        detailViewController.image = selectedImageView.image
    }
    
    @IBAction func didTapImage(_ sender: UITapGestureRecognizer) {
        selectedImageView = sender.view as! UIImageView
        performSegue(withIdentifier: "detailSegue", sender: nil)
    }

}
