//
//  LAuthController.swift
//  LockItPasswordData
//
//  Created by JJ Zapata on 3/28/20.
//  Copyright © 2020 JJ Zapata. All rights reserved.
//

import UIKit
import FirebaseAuth
import AuthenticationServices

class LAuthControllerV4: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.AddAppleButton()
        self.LookForAuth()

        // Do any additional setup after loading the view.
    }
    
    func LookForAuth() {
        if let user = Auth.auth().currentUser {
            print(user.uid)
            // Move To Main LMainTabbarV4
            let sb = UIStoryboard(name: "NewMain", bundle: nil)
            let vc: UIViewController = sb.instantiateViewController(withIdentifier: "LMainTabbarV4") as! LMainTabBarControllerV4
            UIApplication.shared.keyWindow?.rootViewController = vc
        }
    }
    
    func AddAppleButton() {
        // Sign In With Apple Here
    }

}
