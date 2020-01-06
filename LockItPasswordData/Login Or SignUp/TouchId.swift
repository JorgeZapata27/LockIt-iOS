//
//  TouchId.swift
//  LockItPasswordData
//
//  Created by JJ Zapata on 5/28/19.
//  Copyright © 2019 JJ Zapata. All rights reserved.
//

import UIKit
import LocalAuthentication

class TouchId: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // Once View Appears
    override func viewDidAppear(_ animated: Bool)
    {
        startUp()
    }
    
    // Touch Id Function
    func startUp()
    {
        let context: LAContext = LAContext()
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil)
        {
            context.evaluatePolicy(LAPolicy.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Please Enter Your Touch Id To Continue With 'LockIt'") { (wasSuccessful, error) in
                if wasSuccessful
                {
                    print("SUCESS")
                    self.transferform()
                }
                else
                {
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
    
    @objc func exidt(alert: UIAlertAction!)
    {
        performSegue(withIdentifier: "EXITED", sender: self)
    }
    
    @objc func tryAgain(alert: UIAlertAction!)
    {
        startUp()
    }
    
    func transferform() {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc: UIViewController = sb.instantiateViewController(withIdentifier: "Loader") as! NewESTSTRT
        UIApplication.shared.keyWindow?.rootViewController = vc
    }
    
}

