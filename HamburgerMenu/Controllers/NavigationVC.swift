//
//  NavigationVC.swift
//  HamburgerMenu
//
//  Created by Appsmall on 13/12/18.
//  Copyright © 2018 Rahul Chopra. All rights reserved.
//

import UIKit

class NavigationVC: UINavigationController {

    // MARK:- VIEW CONTROLLERS
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeFirstVC()
    }

    // MARK:- CORE FUNCTIONS
    func initializeFirstVC() {
        NotificationCenter.default.addObserver(self, selector: #selector(loadViewControllers), name: NSNotification.Name(rawValue: "LoadViewController"), object: nil)
        
        if let dashboardVC = self.storyboard?.instantiateViewController(withIdentifier: StoryboardId.dashboardVC) as? DashboardVC {
            self.pushViewController(dashboardVC, animated: true)
        }
    }

    @objc func loadViewControllers(notification: NSNotification) {
        if let userInfo = notification.userInfo as? [String:Any] {
            if let storyboardId = userInfo[storyboardIdParam] as? String {
                if let selectedVC = self.storyboard?.instantiateViewController(withIdentifier: storyboardId) {
                    if let presentedVC = self.viewControllers.first {
                        if selectedVC.classForCoder == presentedVC.classForCoder {
                            // Nothing will do when click on same view controller
                        }
                        else {
                            // Set selected view controller in the navigation stack
                            self.setViewControllers([selectedVC], animated: true)
                        }
                    }
                }
            }
        }
    }
}
