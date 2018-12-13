//
//  SideMenuVC.swift
//  HamburgerMenu
//
//  Created by Appsmall on 13/12/18.
//  Copyright © 2018 Rahul Chopra. All rights reserved.
//

import UIKit

class SideMenuVC: UIViewController {
    
    struct Storyboard {
        static let kCellId = "SideMenuCell"
    }

    @IBOutlet weak var sideMenuTableView: UITableView!
    let menuItem = [(Menu.dashboard), (Menu.forms), (Menu.calendar), (Menu.humanResources), (Menu.guides), (Menu.logout)]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

// MARK:- TABLE VIEW DATA SOURCE & DELEGATE METHODS
extension SideMenuVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItem.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.kCellId, for: indexPath)
        let setting = menuItem[indexPath.row]
        cell.textLabel?.text = setting
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedMenu = menuItem[indexPath.row]
        handleCellSelection(selectedCell: selectedMenu)
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }

    func handleCellSelection(selectedCell : String){
        switch selectedCell {
        case Menu.dashboard:
            handleDashboardPressed()
            
        case Menu.forms:
            handleFormsPressed()
            
        case Menu.calendar:
            handleCalendarPressed()
            
        case Menu.humanResources:
            handleHumanResourcePressed()
            
        case Menu.guides:
            handleGuidesPressed()
            
        case Menu.logout:
            handleSignoutPressed()
            
        default:
            print("No need to perform any action")
        }
    }

    func handleDashboardPressed(){
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "ToggleSideMenu"), object: nil)
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "LoadViewController"), object: nil, userInfo: [storyboardIdParam: StoryboardId.dashboardVC])
    }

    func handleFormsPressed(){
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "ToggleSideMenu"), object: nil)
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "LoadViewController"), object: nil, userInfo: [storyboardIdParam: StoryboardId.formVC])
    }

    func handleCalendarPressed(){
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "ToggleSideMenu"), object: nil)
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "LoadViewController"), object: nil, userInfo: [storyboardIdParam: StoryboardId.calendarVC])
    }

    func handleHumanResourcePressed(){
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "ToggleSideMenu"), object: nil)
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "LoadViewController"), object: nil, userInfo: [storyboardIdParam: StoryboardId.humanResourceVC])
    }

    func handleGuidesPressed(){
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "ToggleSideMenu"), object: nil)
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "LoadViewController"), object: nil, userInfo: [storyboardIdParam: StoryboardId.guideVC])
    }

    func handleSignoutPressed(){
        let alert = UIAlertController(title: "Alert", message: "You pressed on logout button.", preferredStyle: .alert)
        let actionOk = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(actionOk)
        self.present(alert, animated: true, completion: nil)
    }
    
}

