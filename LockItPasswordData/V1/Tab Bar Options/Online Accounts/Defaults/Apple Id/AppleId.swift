//
//  AppleId.swift
//  LockItPasswordData
//
//  Created by JJ Zapata on 5/1/19.
//  Copyright © 2019 JJ Zapata. All rights reserved.
//

import UIKit

class AppleId: UIViewController, UITextFieldDelegate {
    
    // Views
    @IBOutlet var setupView: UIView!
    @IBOutlet var checkView: UIView!
    
    // Segmented Controls
    @IBOutlet var segmentedControl: UISegmentedControl!
    
    // Text Fields
    @IBOutlet var usernameTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
    
    // Buttons
    @IBOutlet var submitBtn: UIButton!
    
    // Labels
    @IBOutlet var usernameLbl: UILabel!
    @IBOutlet var passwordLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Username Text Field
        self.usernameTF.delegate = self
        self.usernameTF.tintColor = .black
        
        // Password Text Field
        self.passwordTF.delegate = self
        self.passwordTF.tintColor = .black
        
        // Submit Button
        self.submitBtn.layer.cornerRadius = self.submitBtn.frame.height/3
        
        // Do any additional setup after loading the view.
    }
    
    // Segemtned Controller Clicked
    @IBAction func segmentedControlAction(_ sender: UISegmentedControl)
    {
        switch sender.selectedSegmentIndex {
        case 0:
            self.setupView.isHidden = false
            self.checkView.isHidden = true
        case 1:
            self.setupView.isHidden = true
            self.checkView.isHidden = false
        default:
            print("Extra")
        }
    }
    
    // Submit Button Is Pressed
    @IBAction func submitBtnPressed(_ sender: Any)
    {
        let appleUsername = usernameTF.text!
        let applePassword = passwordTF.text!
        usernameLbl.text = appleUsername
        passwordLbl.text = applePassword
        UserDefaults.standard.set(appleUsername, forKey: "appleUsername")
        UserDefaults.standard.set(applePassword, forKey: "applePassword")
        self.usernameTF.text! = ""
        self.passwordTF.text! = ""
        passwordTF.resignFirstResponder()
    }
    
    // Hides keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    // Return key
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return (true)
    }
    
    // Once View Appears
    override func viewDidAppear(_ animated: Bool)
    {
        let appleUser = UserDefaults.standard.object(forKey: "appleUsername")
        usernameLbl.text = appleUser as? String
        let applePass = UserDefaults.standard.object(forKey: "applePassword")
        passwordLbl.text = applePass as? String
    }
    
}
