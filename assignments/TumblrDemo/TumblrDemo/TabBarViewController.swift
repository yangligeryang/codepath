//
//  TabBarViewController.swift
//  TumblrDemo
//
//  Created by Yang Yang on 11/6/16.
//  Copyright © 2016 Yang Yang. All rights reserved.
//

import UIKit

class TabBarViewController: UIViewController {

    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var bubbleImageView: UIImageView!
    
    let main = UIStoryboard(name: "Main", bundle: nil)
    var homeViewController: UIViewController!
    var searchViewController: UIViewController!
    var accountViewController: UIViewController!
    var trendingViewController: UIViewController!
    var controllers: [UIViewController]!
    var selectedController: UIViewController!
    
    @IBOutlet var buttons: [UIButton]!
    var selectedIndex: Int = 0
    
    var fadeTransition: FadeTransition!
    
    func addChildView(_ content: UIViewController) {
        
        if (selectedController != nil) {
            removeChildView(selectedController)
        }
        addChildViewController(content)
        content.view.frame = self.contentView.bounds
        self.contentView.addSubview(content.view)
        content.didMove(toParentViewController: self)
        selectedController = content
        
    }
    
    func removeChildView(_ content: UIViewController) {
        
        content.willMove(toParentViewController: nil)
        content.view.removeFromSuperview()
        content.removeFromParentViewController()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        homeViewController = main.instantiateViewController(withIdentifier: "HomeViewController")
        searchViewController = main.instantiateViewController(withIdentifier: "SearchViewController")
        accountViewController = main.instantiateViewController(withIdentifier: "AccountViewController")
        trendingViewController = main.instantiateViewController(withIdentifier: "TrendingViewController")
        
        controllers = [homeViewController, searchViewController, accountViewController, trendingViewController]
        didTapButton(buttons[selectedIndex])
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let destination = segue.destination
        destination.modalPresentationStyle = UIModalPresentationStyle.custom
        fadeTransition = FadeTransition()
        destination.transitioningDelegate = fadeTransition
        fadeTransition.duration = 0.4
        
    }
    
    @IBAction func didTapButton(_ sender: UIButton) {
        
        buttons[selectedIndex].isSelected = false
        sender.isSelected = true
        selectedIndex = sender.tag
        addChildView(controllers[selectedIndex])
        
        if selectedIndex == 1 {
            
            UIView.animate(withDuration: 0.6, delay: 0.4, options: [], animations: { () -> Void in
                self.bubbleImageView.alpha = 0
            }, completion: nil)
            
        } else {
            
            UIView.animate(withDuration: 0.6, animations: {
                self.bubbleImageView.alpha = 1
            }, completion: { (Bool) in
                UIView.animate(withDuration: 1, delay: 0, options: [.autoreverse,.repeat], animations: { () -> Void in
                    self.bubbleImageView.transform = CGAffineTransform(translationX: 0, y: 6)
                }, completion: nil)
            })
        
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
