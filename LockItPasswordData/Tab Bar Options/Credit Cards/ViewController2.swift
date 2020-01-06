//
//  ViewController2.swift
//  LockItPasswordData
//
//  Created by JJ Zapata on 4/28/19.
//  Copyright © 2019 JJ Zapata. All rights reserved.
//

import UIKit
import FirebaseDatabase

class ViewController2: UIViewController {
    
    // Text Fields
    @IBOutlet var fullNum: UITextField!
    @IBOutlet var CVC: UITextField!

    // Buttons
    @IBOutlet var submitBtn: UIButton!
    
    // Labels
    @IBOutlet var swipeToContinue: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Submit Button
        self.submitBtn.layer.cornerRadius = self.submitBtn.frame.height/3

        // Do any additional setup after loading the view.
    }
    
    // Submit Button Pressed
    @IBAction func submitBtnPressed(_ sender: Any)
    {
        self.fullNum.text = ""
        self.CVC.text = ""
        self.swipeToContinue.isHidden = false
        UserDefaults.standard.set(fullNum.text!, forKey: "FullCreditCardNumber")
        UserDefaults.standard.set(CVC.text!, forKey: "CVCNumber")
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
