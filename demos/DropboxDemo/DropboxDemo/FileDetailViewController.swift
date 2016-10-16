//
//  FileDetailViewController.swift
//  DropboxDemo
//
//  Created by Yang Yang on 10/16/16.
//  Copyright © 2016 Yang Yang. All rights reserved.
//

import UIKit

class FileDetailViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!

    @IBOutlet weak var fileView: UIImageView!
    
    @IBOutlet weak var navMenu: UIView!
    @IBOutlet weak var navMenuImage: UIImageView!
    
    @IBOutlet weak var detailActions: UIView!
    
    @IBOutlet weak var nav: UIImageView!
    
    let navDefaultImage = UIImage(named: "detail_nav")
    let navSelectedImage = UIImage(named: "detail_nav_selected")
    let navMenuHeight = UIImage(named: "detail_menu")?.size.height
    
    var menuVisible = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        scrollView.contentSize = fileView.frame.size
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func onBack(_ sender: UIButton) {
        navigationController!.popViewController(animated: true)
    }
    
    @IBAction func onToggleMenu(_ sender: UIButton) {
        
        if menuVisible {
            UIView.animate(withDuration: 0.5, animations: {
                self.navMenu.alpha = 0
                self.nav.image = self.navDefaultImage
                self.navMenuImage.frame.origin.y = -1 * self.navMenuHeight!
            })
        } else {
            UIView.animate(withDuration: 0.5, animations: {
                self.navMenu.alpha = 1
                self.nav.image = self.navSelectedImage
                self.navMenuImage.frame.origin.y = 0
            })
        }
        
        self.menuVisible = !self.menuVisible

    }

    @IBAction func onExitMenu(_ sender: UIButton) {
        self.menuVisible = false
        UIView.animate(withDuration: 0.5, animations: {
            self.navMenu.alpha = 0
            self.nav.image = self.navDefaultImage
            self.navMenuImage.frame.origin.y = -1 * self.navMenuHeight!
        })
    }
    
    @IBAction func onFavorite(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
    }
    
    
}
