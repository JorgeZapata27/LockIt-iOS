//
//  AppDelegate.swift
//  LOCKIT
//
//  Created by JJ Zapata on 4/20/19.
//  Copyright © 2019 JJ Zapata. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import SystemConfiguration
import GoogleMobileAds
import GoogleSignIn

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    private let reachability = SCNetworkReachabilityCreateWithName(nil, "www.raywenderlich.com")

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        
        GADMobileAds.sharedInstance().start(completionHandler: nil)
        GIDSignIn.sharedInstance().clientID = FirebaseApp.app()?.options.clientID

        FirebaseApp.configure()
        
//        window = UIWindow()
//        window?.makeKeyAndVisible()

        return true
    }
    
    
}

