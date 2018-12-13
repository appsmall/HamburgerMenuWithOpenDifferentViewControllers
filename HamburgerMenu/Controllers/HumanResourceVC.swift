//
//  HumanResourceVC.swift
//  HamburgerMenu
//
//  Created by Appsmall on 13/12/18.
//  Copyright © 2018 Rahul Chopra. All rights reserved.
//

import UIKit

class HumanResourceVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func hamburgerBtnPressed(_ sender: UIButton) {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "ToggleSideMenu"), object: nil)
    }

}
