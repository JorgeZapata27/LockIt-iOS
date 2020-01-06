//
//  Email.swift
//  LockItPasswordData
//
//  Created by JJ Zapata on 5/1/19.
//  Copyright © 2019 JJ Zapata. All rights reserved.
//

import UIKit
import FirebaseDatabase

class Email: UIViewController, UITextFieldDelegate {
    
    // Views
    @IBOutlet var setupView: UIView!
    @IBOutlet var checkView: UIView!
    
    // Segmented Controls
    @IBOutlet var segmentedControl: UISegmentedControl!
    
    // Text Fields
    @IBOutlet var passwordTF: UITextField!
    
    // Buttons
    @IBOutlet var submitBtn: UIButton!
    
    // Labels
    @IBOutlet var usernameLbl: UILabel!
    @IBOutlet var passwordLbl: UILabel!
    
    // Firebase Init
    var databaseRefer : DatabaseReference!
    var databaseHandle : DatabaseHandle!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Firebase Init ( Read )
        databaseRefer = Database.database().reference()
        
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
        guard let email = UserDefaults.standard.string(forKey: "PASSWORD") else {
            return
        }
        
        databaseHandle = databaseRefer.child(email).child("Defaults").child("Email Password").observe(.childAdded, with: { (data) in
            let name : String = (data.value as? String)!
            self.passwordLbl.text = name
            debugPrint(name)
        })
        
        
        let non = UserDefaults.standard.object(forKey: "EMAIL")
        usernameLbl.text = non as? String
        
    }
    
    // Submits Information
    @IBAction func submitBtnPressed(_ sender: Any)
    {
        let input = passwordTF.text
        passwordLbl.text = input
        passwordTF.text = ""
        
        guard let email = UserDefaults.standard.string(forKey: "PASSWORD") else {
            return
        }
        
        self.databaseRefer.child(email).child("Defaults").child("Email Password").childByAutoId().setValue(input)
        passwordTF.resignFirstResponder()
    }
    
}
