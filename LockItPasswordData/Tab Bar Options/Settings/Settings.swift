//
//  Settings.swift
//  LOCKIT
//
//  Created by JJ Zapata on 4/23/19.
//  Copyright © 2019 JJ Zapata. All rights reserved.
//

import UIKit
import FirebaseAuth
import GoogleMobileAds
import StoreKit

class Settings: UIViewController, GADBannerViewDelegate {
    
    // Buttons
    @IBOutlet var AppleWatch: UIButton!
    @IBOutlet var Contact: UIButton!
    @IBOutlet var ReportError: UIButton!
    @IBOutlet var DarkBackView: UIView!
    @IBOutlet var switcheroo: UISwitch!
    
    // Variables
    var options = ["Apple Watch Configuration", "Contact", "Submit Error"]
    var segueIdentifiers = ["AppleWatch", "Contact", "SubmitError"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Apple Watch Button
        self.AppleWatch.layer.cornerRadius = self.AppleWatch.frame.height/5
        self.AppleWatch.backgroundColor = .darkGray
        self.AppleWatch.setTitleColor(.white, for: .normal)
        
        // Contact Button
        self.Contact.layer.cornerRadius = self.Contact.frame.height/5
        self.Contact.backgroundColor = .darkGray
        self.Contact.setTitleColor(.white, for: .normal)
        
        // Report Error
        self.ReportError.layer.cornerRadius = self.Contact.frame.height/5
        self.ReportError.backgroundColor = .darkGray
        self.ReportError.setTitleColor(.white, for: .normal)
        
        // Dark Mode
        self.DarkBackView.layer.cornerRadius = self.DarkBackView.frame.height/5
        
        // Funtctions To Throw
        DoDarkThings()
        requestRating()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        DoDarkThings()
    }
    
    func DoDarkThings() {
        let bool = UserDefaults.standard.bool(forKey: "DARK")
        if bool == true {
            self.switcheroo.isOn = true
            view.backgroundColor = .black
            navigationController?.navigationBar.backgroundColor = .black
            navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
            UITabBar.appearance().barTintColor = .black
        } else {
            self.switcheroo.isOn = false
            view.backgroundColor = .white
            navigationController?.navigationBar.backgroundColor = UIColor(red: 248/255, green: 247/255, blue: 248/255, alpha: 1)
            navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.black]
            UITabBar.appearance().barTintColor = UIColor(red: 248/255, green: 247/255, blue: 248/255, alpha: 1)
        }
    }
    
    func requestRating()
    {
        SKStoreReviewController.requestReview()
    }

    @IBAction func logOut(_ sender: Any)
    {
        UserDefaults.standard.removeObject(forKey: "emailUser")
        UserDefaults.standard.removeObject(forKey: "emailUserSU")
        let hello = UserDefaults.standard.object(forKey: "emailUser") as? String
        print("sdl;fkjasd;flkj")
        print("sdl;fkjasd;flkj")
        performSegue(withIdentifier: "logOut", sender: self)
    }
    
    @IBAction func DarkModeSwitch(_ sender: UISwitch) {
        if (sender.isOn == true) {
            // Do Dark Things
            print("Dark")
            UserDefaults.standard.set(true, forKey: "DARK")
            view.backgroundColor = .black
            self.switcheroo.isOn = true
            view.backgroundColor = .black
            navigationController?.navigationBar.backgroundColor = .black
            navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
            UITabBar.appearance().barTintColor = .black
            
        } else{
            print("Light")
            UserDefaults.standard.set(false, forKey: "DARK")
            view.backgroundColor = .white
            self.switcheroo.isOn = false
            view.backgroundColor = .white
            navigationController?.navigationBar.backgroundColor = UIColor(red: 248/255, green: 247/255, blue: 248/255, alpha: 1)
            UITabBar.appearance().barTintColor = UIColor(red: 248/255, green: 247/255, blue: 248/255, alpha: 1)
        }
    }
    
}
