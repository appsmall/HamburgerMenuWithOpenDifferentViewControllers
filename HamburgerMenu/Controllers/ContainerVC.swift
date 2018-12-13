//
//  ContainerVC.swift
//  HamburgerMenu
//
//  Created by Appsmall on 13/12/18.
//  Copyright © 2018 Rahul Chopra. All rights reserved.
//

import UIKit

class ContainerVC: UIViewController {

    @IBOutlet weak var sideMenuView: UIView!
    @IBOutlet weak var contentContainerView: UIView!
    @IBOutlet weak var fadeView: UIView!
    @IBOutlet weak var sideMenuViewLeadingConstraint: NSLayoutConstraint!
    var isSideMenuOpen = false
    var sideMenuWidth = CGFloat()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        NotificationCenter.default.addObserver(self, selector: #selector(toggleSideMenu), name: NSNotification.Name(rawValue: "ToggleSideMenu"), object: nil)
    }
    
    func updateUI() {
        fadeView.backgroundColor = UIColor.clear
        fadeView.alpha = 0
        
        self.view.layoutIfNeeded()
        sideMenuWidth = sideMenuView.frame.size.width
        sideMenuViewLeadingConstraint.constant = -sideMenuWidth
    }

    
    @objc func toggleSideMenu() {
        if isSideMenuOpen {
            // close the side menu
            sideMenuViewLeadingConstraint.constant = -sideMenuWidth
            UIView.animate(withDuration: 0.2) {
                self.view.layoutIfNeeded()
                self.fadeView.alpha = 0
            }
            isSideMenuOpen = false
        }
        else {
            // open the side menu
            sideMenuViewLeadingConstraint.constant = 0
            sideMenuView.isHidden = false
            fadeView.backgroundColor = UIColor.darkGray
            UIView.animate(withDuration: 0.6) {
                self.view.layoutIfNeeded()
                self.fadeView.alpha = 0.7
            }
            isSideMenuOpen = true
        }
    }
    
    @IBAction func fadeViewTapped(_ sender: UITapGestureRecognizer) {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "ToggleSideMenu"), object: nil)
    }
}
