//
//  LinkDetailViewController.swift
//  FacebookDemo
//
//  Created by Yang Yang on 10/13/16.
//  Copyright © 2016 Yang Yang. All rights reserved.
//

import UIKit

class LinkDetailViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var commentBar: UIView!
    @IBOutlet weak var commentField: UITextField!
    
    var initialY: CGFloat!
    var offset: CGFloat!
    
    @IBAction func didPressBack(_ sender: AnyObject) {
        navigationController!.popViewController(animated: true)
    }

    @IBAction func onLike(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
    }
    
    @IBAction func onComment(_ sender: UIButton) {
        commentField.becomeFirstResponder()
    }
    
    @IBAction func didTap(_ sender: AnyObject) {
        view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.contentSize = imageView.frame.size
        
        commentField.becomeFirstResponder()
        initialY = commentBar.frame.origin.y
        
        NotificationCenter.default.addObserver(forName: Notification.Name.UIKeyboardWillShow, object: nil, queue: OperationQueue.main) { (notification: Notification) in
            UIView.animate(withDuration:0.2, animations: {
                let frame = (notification.userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
                    self.commentBar.frame.origin.y = self.initialY - frame.height + 49
            })
        }
        
        NotificationCenter.default.addObserver(forName: Notification.Name.UIKeyboardWillHide, object: nil, queue: OperationQueue.main) { (notification: Notification) in
            UIView.animate(withDuration:0.4, animations: {
                self.commentBar.frame.origin.y = self.initialY
            })
        }
    }

}
