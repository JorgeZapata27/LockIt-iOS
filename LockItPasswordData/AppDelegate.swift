//
//  AppDelegate.swift
//  LOCKIT
//
//  Created by JJ Zapata on 4/20/19.
//  Copyright © 2019 JJ Zapata. All rights reserved.
//

import UIKit
import Firebase
import GoogleMobileAds
import GoogleSignIn

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        GADMobileAds.sharedInstance().start(completionHandler: nil)
        GIDSignIn.sharedInstance().clientID = FirebaseApp.app()?.options.clientID

        FirebaseApp.configure()
        
        window = UIWindow()
        window?.makeKeyAndVisible()
        
//        if UserDefaults.standard.bool(forKey: "DONEORNOT") != false {
            let navController = UINavigationController(rootViewController: LLoginController())
            window?.rootViewController = navController
//        } else {
//            let layout = UICollectionViewFlowLayout()
//            layout.scrollDirection = .horizontal
//            let swipingController = SwipingController(collectionViewLayout: layout)
//
//            let navController = UINavigationController(rootViewController: swipingController)
//            window?.rootViewController = navController
//        }

        return true
    }

}

