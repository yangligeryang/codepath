//
//  MailboxViewController.swift
//  MailboxDemo
//
//  Created by Yang Yang on 10/28/16.
//  Copyright © 2016 Yang Yang. All rights reserved.
//

import UIKit

class MailboxViewController: UIViewController {

    @IBOutlet weak var feedViews: UIScrollView!
    @IBOutlet weak var inboxScroll: UIScrollView!
    @IBOutlet weak var laterScroll: UIScrollView!
    @IBOutlet weak var archiveScroll: UIScrollView!
    @IBOutlet weak var messageView: UIView!
    @IBOutlet weak var messageImage: UIImageView!
    @IBOutlet weak var messageDismiss: UIImageView!
    @IBOutlet weak var messageOrganize: UIImageView!
    @IBOutlet weak var listOverlay: UIImageView!
    @IBOutlet weak var laterOverlay: UIImageView!
    @IBOutlet weak var feedImage: UIImageView!
    @IBOutlet weak var navView: UIImageView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet var screen: UIView!
    @IBOutlet weak var segmentedNav: UISegmentedControl!
    
    let grayColor = UIColor(red:0.89, green:0.89, blue:0.89, alpha:1.00)
    let greenColor = UIColor(red:0.45, green:0.84, blue:0.41, alpha:1.00)
    let redColor = UIColor(red:0.91, green:0.33, blue:0.23, alpha:1.00)
    let yellowColor = UIColor(red:0.98, green:0.81, blue:0.30, alpha:1.00)
    let brownColor = UIColor(red:0.84, green:0.65, blue:0.47, alpha:1.00)
    var messageHeight: CGFloat!
    var messageOriginalCenter: CGPoint!
    var dismissOriginalCenter: CGPoint!
    var organizeOriginalCenter: CGPoint!
    var contentOriginalCenter: CGPoint!
    var feedOriginalCenter: CGPoint!
    var undoMessage: String! = "Undo"
    
    func removeMessage() {
        
        UIView.animate(withDuration: 0.6, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 1, options: [], animations: {
            self.feedImage.center = CGPoint(x: self.feedImage.center.x, y: self.feedImage.center.y - self.messageHeight)
            self.inboxScroll.contentSize = CGSize(width: 375, height: 1681 - self.messageHeight)
            self.messageView.frame.size.height = 0
            self.messageView.alpha = 0
        }) { (Bool) in
            self.messageView.backgroundColor = self.grayColor
            self.messageImage.frame.origin.x = 0
        }
        
    }
    
    func addMessage() {
    
        UIView.animate(withDuration: 0.6, delay: 0.2, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: [], animations: {
            self.messageView.alpha = 1
            self.messageView.frame.size.height = self.messageHeight
            self.feedImage.center = self.feedOriginalCenter
            self.inboxScroll.contentSize = CGSize(width: 375, height: 1681)
        }) { (Bool) in
        }
        
    }
    
    func didEdgePanContent (sender: UIScreenEdgePanGestureRecognizer) {
        
        let translation = sender.translation(in: view)
        let velocity = sender.velocity(in: view)
        
        if sender.state == .began {
            contentOriginalCenter = contentView.center
        } else if sender.state == .changed {
            if velocity.x > 0 {
                contentView.center = CGPoint(x: contentOriginalCenter.x + translation.x, y: contentOriginalCenter.y)
            }
        } else if sender.state == .ended {
            UIView.animate(withDuration: 0.6, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 1, options: [], animations: { 
                self.contentView.frame.origin.x = self.contentView.frame.size.width - 35
                }, completion: { (Bool) in
                    self.contentView.isUserInteractionEnabled = false
            })
        }
        
    }
    
    func didEdgePanScreen (sender: UIScreenEdgePanGestureRecognizer) {
        
        let translation = sender.translation(in: view)
        let velocity = sender.velocity(in: view)
        
        if sender.state == .began {
            contentOriginalCenter = contentView.center
        } else if sender.state == .changed {
            if velocity.x < 0 && contentView.frame.origin.x != 0 {
                contentView.center = CGPoint(x: contentOriginalCenter.x + translation.x, y: contentOriginalCenter.y)
            }
        } else if sender.state == .ended {
            UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: [], animations: {
                self.contentView.frame.origin.x = 0
                }, completion: { (Bool) in
                    self.contentView.isUserInteractionEnabled = true
            })
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        inboxScroll.contentSize = CGSize(width: 375, height: 1681)
        laterScroll.contentSize = CGSize(width: 375, height: feedImage.frame.size.height)
        archiveScroll.contentSize = CGSize(width: 375, height: feedImage.frame.size.height)
        messageHeight = messageView.frame.size.height
        messageOriginalCenter = messageImage.center
        dismissOriginalCenter = messageDismiss.center
        organizeOriginalCenter = messageOrganize.center
        feedOriginalCenter = feedImage.center
        
        let screenEdgePanGestureRecognizer = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(didEdgePanContent(sender:)))
        let screenEdgePanGestureRecognizerScreen = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(didEdgePanScreen(sender:)))
        screenEdgePanGestureRecognizer.edges = UIRectEdge.left
        screenEdgePanGestureRecognizerScreen.edges = UIRectEdge.right
        contentView.addGestureRecognizer(screenEdgePanGestureRecognizer)
        screen.addGestureRecognizer(screenEdgePanGestureRecognizerScreen)
        
        feedViews.contentSize = CGSize(width: 3 * 375, height: 542)
        feedViews.contentOffset = CGPoint(x: 375, y: 0)
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        let undoAlert = UIAlertController(title: undoMessage, message: nil, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (UIAlertAction) in
        }
        let undoAction = UIAlertAction(title: "Undo", style: .default) { (UIAlertAction) in
            self.addMessage()
        }
        undoAlert.addAction(cancelAction)
        undoAlert.addAction(undoAction)
        
        if motion == .motionShake {
            present(undoAlert, animated: true, completion: { })
        }
    }
    
    @IBAction func didPanMessage(_ sender: UIPanGestureRecognizer) {
        
        let translation = sender.translation(in: view)
        
        if sender.state == .began {
            
            messageOriginalCenter = messageImage.center
            messageDismiss.center = dismissOriginalCenter
            messageOrganize.center = organizeOriginalCenter
            messageDismiss.image = UIImage(named: "archive_icon")
            messageOrganize.image = UIImage(named: "later_icon")
            messageView.backgroundColor = grayColor
            
        } else if sender.state == .changed {
            
            messageImage.center = CGPoint(x: messageOriginalCenter.x + translation.x, y: messageOriginalCenter.y)
            
            if translation.x > 0 {
                messageDismiss.alpha = convertValue(inputValue: abs(translation.x), r1Min: 0, r1Max: 60, r2Min: 0, r2Max: 1)
            } else if translation.x < 0 {
                messageOrganize.alpha = convertValue(inputValue: abs(translation.x), r1Min: 0, r1Max: 60, r2Min: 0, r2Max: 1)
            }
            
            // swipe right
            if translation.x >= 60 {
                messageDismiss.center = CGPoint(x: dismissOriginalCenter.x + translation.x - 60, y: dismissOriginalCenter.y)
                if translation.x < 260 && messageView.backgroundColor != greenColor {
                    messageDismiss.image = UIImage(named: "archive_icon")
                    UIView.animate(withDuration: 0.2, animations: {
                        self.messageView.backgroundColor = self.greenColor
                    })
                }
            }
            if translation.x >= 260 {
                messageDismiss.image = UIImage(named: "delete_icon")
                if messageView.backgroundColor != redColor {
                    UIView.animate(withDuration: 0.2, animations: {
                        self.messageView.backgroundColor = self.redColor
                    })
                }
            }
        
            // swipe left
            if translation.x <= -60 {
                messageOrganize.center = CGPoint(x: organizeOriginalCenter.x + translation.x + 60, y: organizeOriginalCenter.y)
                if translation.x > -260 && messageView.backgroundColor != yellowColor {
                    messageOrganize.image = UIImage(named: "later_icon")
                    UIView.animate(withDuration: 0.2, animations: {
                        self.messageView.backgroundColor = self.yellowColor
                    })
                }
            }
            if translation.x <= -260 {
                messageOrganize.image = UIImage(named: "list_icon")
                if messageView.backgroundColor != brownColor {
                    UIView.animate(withDuration: 0.2, animations: {
                        self.messageView.backgroundColor = self.brownColor
                    })
                }
            }
            
            if abs(translation.x) < 60 {
                UIView.animate(withDuration: 0.2, animations: {
                    self.messageView.backgroundColor = self.grayColor
                })
            }
            
        } else if sender.state == .ended {
            
            
            if translation.x >= 60 {
                
                // swipe right
                messageOrganize.alpha = 0
                UIView.animate(withDuration: 0.6, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: [], animations: {
                    self.messageImage.frame.origin.x = self.messageImage.frame.size.width
                    self.messageDismiss.frame.origin.x = self.messageImage.frame.size.width
                    self.messageDismiss.alpha = 0
                    }, completion: { (Bool) in
                        self.removeMessage()
                        if translation.x >= 260 {
                            self.undoMessage = "Undo Delete"
                        } else {
                            self.undoMessage = "Undo Archive"
                        }
                })

            } else if translation.x <= -60 {
                
                // swipe left
                messageDismiss.alpha = 0
                UIView.animate(withDuration: 0.6, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: [], animations: {
                    self.messageImage.frame.origin.x = -1 * self.messageImage.frame.size.width
                    self.messageOrganize.frame.origin.x = -1 * self.messageImage.frame.size.width
                    self.messageOrganize.alpha = 0
                    }, completion: { (Bool) in
                        if translation.x > -260 {
                            UIView.animate(withDuration: 0.4, animations: {
                                self.laterOverlay.alpha = 1
                            })
                        } else {
                            UIView.animate(withDuration: 0.4, animations: {
                                self.listOverlay.alpha = 1
                            })
                        }
                })
                
            } else {
                
                // return to normal
                UIView.animate(withDuration: 0.6, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 1, options: [], animations: {
                    self.messageImage.center = self.messageOriginalCenter
                    }, completion: { (Bool) in
                })
                
            }
            
        }

    }
    
    @IBAction func didTapList(_ sender: UITapGestureRecognizer) {
        UIView.animate(withDuration: 0.6, animations: {
            self.listOverlay.alpha = 0
            }) { (Bool) in
                self.removeMessage()
                self.undoMessage = "Undo List"
        }
    }
    
    @IBAction func didTapLater(_ sender: UITapGestureRecognizer) {
        UIView.animate(withDuration: 0.6, animations: {
            self.laterOverlay.alpha = 0
        }) { (Bool) in
            self.removeMessage()
            self.undoMessage = "Undo Reschedule"
        }
    }
    
    @IBAction func didToggleNav(_ sender: UISegmentedControl) {
        let viewNumber : Int = Int(segmentedNav.selectedSegmentIndex)
        UIView.animate(withDuration: 0.6) {
            self.feedViews.contentOffset = CGPoint(x: viewNumber * 375, y: 0)
        }
    }

}
