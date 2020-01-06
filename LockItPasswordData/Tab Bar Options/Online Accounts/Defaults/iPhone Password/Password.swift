//
//  Password.swift
//  LockItPasswordData
//
//  Created by JJ Zapata on 5/1/19.
//  Copyright © 2019 JJ Zapata. All rights reserved.
//

import UIKit
import FirebaseDatabase

class Password: UIViewController, UITextFieldDelegate {
    
    // Labels
    @IBOutlet var label: UILabel!

    // Buttons
    @IBOutlet var button: UIButton!
    
    // Text Fields
    @IBOutlet var textField: UITextField!
    
    // Firebase Init
    var databaseRefer : DatabaseReference!
    var databaseHandle : DatabaseHandle!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Firebase Init ( Read )
        databaseRefer = Database.database().reference()
        
        // Textfield
        textField.delegate = self
        
        // Submit Button
        button.layer.cornerRadius = self.button.frame.height/3
        
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
    
    // Update Button Pressed
    @IBAction func updateButtonPressed(_ sender: Any)
    {
        guard let email = UserDefaults.standard.string(forKey: "PASSWORD") else {
            return
        }
        let iphonePassword = textField.text!
        label.text = iphonePassword
        databaseRefer.child(email).child("Defaults").child("iPhone Password").childByAutoId().setValue(iphonePassword)
        textField.resignFirstResponder()
    }
    
    // Once View Appears
    override func viewDidAppear(_ animated: Bool)
    {
        guard let email = UserDefaults.standard.string(forKey: "PASSWORD") else {
            return
        }
        databaseHandle = databaseRefer.child(email).child("Defaults").child("iPhone Password").observe(.childAdded, with: { (data) in
            let name : String = (data.value as? String)!
            self.label.text = name
            debugPrint(name)
        })
    }
    
}
