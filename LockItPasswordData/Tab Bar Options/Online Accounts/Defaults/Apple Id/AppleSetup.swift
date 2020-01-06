//
//  AppleSetup.swift
//  LockItPasswordData
//
//  Created by JJ Zapata on 5/1/19.
//  Copyright © 2019 JJ Zapata. All rights reserved.
//

import UIKit
import TextFieldEffects

class AppleSetup: UIViewController {
    
    // Text Fields
    @IBOutlet var usernameTF: AkiraTextField!
    @IBOutlet var passwordTF: AkiraTextField!
    
    // Buttons
    @IBOutlet var update: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Submit Button
        self.update.layer.cornerRadius = self.update.frame.height/4

        // Do any additional setup after loading the view.
    }
    
    // Update Pressed
    @IBAction func updatePressed(_ sender: Any)
    {
        self.usernameTF.text = ""
        self.passwordTF.text = ""
        UserDefaults.standard.set(usernameTF.text, forKey: "UsermnameApple")
        UserDefaults.standard.set(passwordTF.text, forKey: "PasswordApple")
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

}
