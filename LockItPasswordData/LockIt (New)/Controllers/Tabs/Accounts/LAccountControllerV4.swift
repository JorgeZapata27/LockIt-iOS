//
//  LAccountControllerV4.swift
//  LockItPasswordData
//
//  Created by JJ Zapata on 4/1/20.
//  Copyright © 2020 JJ Zapata. All rights reserved.
//

import UIKit
import Firebase
import Foundation
import FirebaseAuth
import FirebaseCore
import SVProgressHUD
import FirebaseStorage
import FirebaseDatabase
import FirebaseCoreDiagnostics

class LAccountControllerV4: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var usernameLabel : UILabel!
    @IBOutlet var username : UILabel!
    @IBOutlet var passwordLabel : UILabel!
    @IBOutlet var password : UILabel!
    @IBOutlet var copyUsername : UIButton!
    @IBOutlet var copyPassword : UIButton!
    
    @IBOutlet var usernameTF : UITextField!
    @IBOutlet var passwordTF : UITextField!
    @IBOutlet var addButton : UIButton!
    
    @IBOutlet var segmentedControl : UISegmentedControl!
    @IBOutlet var imageView : UIImageView!
    
    var usernameInfo = ""
    var passwordInfo = ""
    var imageUrl = ""
    var postId = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.GetNavBar()
        
        self.username!.text! = usernameInfo
        self.password!.text! = passwordInfo
        
        self.imageView.loadImageUsingCacheWithUrlString(imageUrl)

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.GetNavBar()
        
        self.username!.text! = usernameInfo
        self.password!.text! = passwordInfo
        
        self.imageView.loadImageUsingCacheWithUrlString(imageUrl)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.GetNavBar()
        
        self.username!.text! = usernameInfo
        self.password!.text! = passwordInfo
        
        self.imageView.loadImageUsingCacheWithUrlString(imageUrl)
    }
    
    func GetNavBar() {
        Database.database().reference().child("Users").child("\(Auth.auth().currentUser!.uid)").child("My_Accounts").child("\(self.postId)").child("account-Name").observe(.value, with: { (data) in
            let qqqq : String = (data.value as? String)!
            self.navigationController?.navigationBar.topItem?.title = "\(qqqq)"
        })
    }
    
    @IBAction func copyUsername(_ semder: UIButton) {
        UIPasteboard.general.string = username!.text!
        let alert = UIAlertController(title: "Copied", message: "Your Username Has Been Copied", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func copyPassword(_ semder: UIButton) {
        UIPasteboard.general.string = password!.text!
        let alert = UIAlertController(title: "Copied", message: "Your Password Has Been Copied", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func segmentedControlPressed(_ sender: UISegmentedControl) {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            UIView.animate(withDuration: 0.5, animations: {
                self.usernameLabel!.alpha = 1
                self.passwordLabel!.alpha = 1
                self.username!.alpha = 1
                self.password!.alpha = 1
                self.copyUsername!.alpha = 1
                self.copyPassword!.alpha = 1
                
                self.usernameTF!.alpha = 0
                self.passwordTF!.alpha = 0
                self.addButton!.alpha = 0
            }, completion: nil)
            break;
        case 1:
            UIView.animate(withDuration: 0.5, animations: {
                self.usernameLabel!.alpha = 0
                self.passwordLabel!.alpha = 0
                self.username!.alpha = 0
                self.password!.alpha = 0
                self.copyUsername!.alpha = 0
                self.copyPassword!.alpha = 0
                
                self.usernameTF!.alpha = 1
                self.passwordTF!.alpha = 1
                self.addButton!.alpha = 1
            }, completion: nil)
            break;
        default:
            print("3")
            break;
        }
    }
    
    @IBAction func updateButtonPressed(_ sender: UIButton) {
        if self.passwordTF.text! != "" && self.usernameTF.text! != "" {
            SVProgressHUD.show(withStatus: "Working")
            Database.database().reference().child("Users").child(Auth.auth().currentUser!.uid).child("My_Accounts").child(postId).child("account-Username").setValue(self.usernameTF.text!)
            Database.database().reference().child("Users").child(Auth.auth().currentUser!.uid).child("My_Accounts").child(postId).child("account-Password").setValue(self.passwordTF.text!)
            self.username.text = self.usernameTF.text!
            self.password.text = self.passwordTF.text!
            SVProgressHUD.dismiss()
            let alert = UIAlertController(title: "Success", message: "Your Account Has Been Updated", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: { (action) in
                self.navigationController?.popViewController(animated: true)
            }))
            self.present(alert, animated: true, completion: nil)
        } else {
            let alert = UIAlertController(title: "Error", message: "One Or More Text Fields Has Been Left Blank", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Okay", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
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

}
