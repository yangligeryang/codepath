//
//  BlueViewController.swift
//  CustomTransitionDemo
//
//  Created by Yang Yang on 11/15/16.
//  Copyright © 2016 Yang Yang. All rights reserved.
//

import UIKit

class BlueViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    var fadeTransition: FadeTransition!
    var lightboxTransition: LightboxTransition!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        fadeTransition = FadeTransition()
        fadeTransition.duration = 2
        
        lightboxTransition = LightboxTransition()
        lightboxTransition.duration = 2
        
        let pinkViewController = segue.destination as! PinkViewController
        pinkViewController.text = textField.text
        pinkViewController.modalPresentationStyle = UIModalPresentationStyle.custom
        pinkViewController.transitioningDelegate = lightboxTransition
    }
    
    

}
