//
//  AppDelegate.swift
//  LOCKIT
//
//  Created by JJ Zapata on 4/20/19.
//  Copyright © 2019 JJ Zapata. All rights reserved.
//

import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        FirebaseApp.configure()
        
        
        let userID = Auth.auth().currentUser!.uid
        Database.database().reference().child("Users").child(userID).child("name").observe(.childAdded, with: { (data) in
            let name : String = (data.value as! String)
            debugPrint(name)
            print("dsafjsdlfkj")
        })
        
        window = UIWindow()
        window?.makeKeyAndVisible()
        let navController = UINavigationController(rootViewController: LLoginController())
        window?.rootViewController = navController

        
        return true
    }



}

