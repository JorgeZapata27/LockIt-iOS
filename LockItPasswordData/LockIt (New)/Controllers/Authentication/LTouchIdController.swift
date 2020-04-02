//
//  LTouchIdController.swift
//  LockItPasswordData
//
//  Created by JJ Zapata on 4/2/20.
//  Copyright © 2020 JJ Zapata. All rights reserved.
//

import UIKit
import LocalAuthentication

class LTouchIdController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // Once View Appears
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        startUp()
    }
    
    // Touch Id Function
    func startUp() {
        let context: LAContext = LAContext()
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil) {
            context.evaluatePolicy(LAPolicy.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Please Enter Your Touch Id To Continue With 'LockIt'") { (wasSuccessful, error) in
                if wasSuccessful {
                    print("SUCESS")
                    self.transferform()
                } else {
                    print("ERROR")
                    let alert = UIAlertController(title: "Touch Id / Face Id Does Not Match" , message: "Would You Like To Try Again Or Exit The App?", preferredStyle: .alert)
                    let exit = UIAlertAction(title: "Exit", style: .cancel, handler: self.exidt)
                    let tryAgain = UIAlertAction(title: "Try Again", style: .default, handler: self.tryAgain)
                    alert.addAction(exit)
                    alert.addAction(tryAgain)
                    self.present(alert, animated: true, completion: nil)
                }
            }
        }
    }
    
    @objc func exidt(alert: UIAlertAction!) {
        performSegue(withIdentifier: "EXITED", sender: self)
    }
    
    @objc func tryAgain(alert: UIAlertAction!) {
        self.startUp()
    }
    
    func transferform() {
        DispatchQueue.main.async {
            let sb = UIStoryboard(name: "NewMain", bundle: nil)
            let vc: UIViewController = sb.instantiateViewController(withIdentifier: "LMainTabbarV4") as! LMainTabBarControllerV4
            UIApplication.shared.keyWindow?.rootViewController = vc
        }
    }

}
