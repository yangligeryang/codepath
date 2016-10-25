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
    var yOffsets : [CGFloat] = [-365, -320, -525, -500, -620, -630]
    var xOffsets : [CGFloat] = [-100, 45, 65, 95, -120, -75]
    var scales : [CGFloat] = [1, 1.75, 1.8, 1.8, 1.7, 1.9]
    let rotations : [CGFloat] = [-10, -10, 10, 10, 10, -10]
    
    var photos : [UIImageView] = []
    var offset: CGFloat!
    
    private func transformValue(_ offset: CGFloat, value: CGFloat, type: String) -> CGFloat {
        var converted: CGFloat
        var r2Max: CGFloat
        var r2Min: CGFloat
        
        switch type {
            case "scale":
                r2Min = value
                r2Max = 1
            case "rotate":
                r2Min = CGFloat(Double(value) * M_PI / 180)
                r2Max = 0
            default:
                r2Min = value
                r2Max = 0
        }
        converted = convertValue(inputValue: offset, r1Min: 0, r1Max: 667, r2Min: r2Min, r2Max: r2Max)
        
        return converted
    }
    
    private func transformImage(_ offset: CGFloat,image: UIImageView,_ index: Int) {
    
        image.transform = CGAffineTransform(translationX: transformValue(offset, value: xOffsets[index], type: "translate"), y: transformValue(offset, value: yOffsets[index], type: "translate"))
        image.transform = image.transform.scaledBy(x: transformValue(offset, value: scales[index], type: "scale"), y: transformValue(offset, value: scales[index], type: "scale"))
        image.transform = image.transform.rotated(by: transformValue(offset, value: rotations[index], type: "rotate"))
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.contentSize = scrollBackground.frame.size
        scrollView.delegate = self
        
        photos.append(couplePhoto)
        photos.append(deerPhoto)
        photos.append(fishPhoto)
        photos.append(lakePhoto)
        photos.append(housePhoto)
        photos.append(dogPhoto)
        
        for (index, photo) in photos.enumerated() {
            transformImage(0, image: photo, index)
        }
        
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        offset = scrollView.contentOffset.y
        
        for (index, photo) in photos.enumerated() {
            transformImage(offset, image: photo, index)
        }
        
    }

}
