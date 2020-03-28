//
//  LSignInController.swift
//  LockItPasswordData
//
//  Created by JJ Zapata on 3/28/20.
//  Copyright © 2020 JJ Zapata. All rights reserved.
//

import UIKit
import Firebase
import FirebaseCore
import FirebaseAuth
import SVProgressHUD
import FirebaseDatabase

class LSignInControllerV4: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var emailTF : UITextField!
    @IBOutlet var passwordTF : UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.emailTF.delegate = self
        self.passwordTF.delegate = self

        // Do any additional setup after loading the view.
    }
    
    @IBAction func signInPressed(_ sender: UIButton) {
        SVProgressHUD.show(withStatus: "Loading...")
        Auth.auth().signIn(withEmail: self.emailTF!.text!, password: self.passwordTF!.text!) { (result, error) in
            if result != nil {
                SVProgressHUD.dismiss()
                let sb = UIStoryboard(name: "NewMain", bundle: nil)
                let vc: UIViewController = sb.instantiateViewController(withIdentifier: "LMainTabbarV4") as! LMainTabBarControllerV4
                UIApplication.shared.keyWindow?.rootViewController = vc
                print("All Good. Logging in. ")
            } else {
                SVProgressHUD.dismiss()
                if let myError = error?.localizedDescription {
                    print(myError)
                    let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                } else {
                    print("ERROR")
                }
            }
        }
    }
    
    // Hides keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        self.view.endEditing(true)
    }
    
    // Return key
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        textField.resignFirstResponder()
        return (true)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
