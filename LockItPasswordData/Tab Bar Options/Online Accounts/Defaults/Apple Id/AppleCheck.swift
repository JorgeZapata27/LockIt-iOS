//
//  AppleCheck.swift
//  LockItPasswordData
//
//  Created by JJ Zapata on 5/1/19.
//  Copyright © 2019 JJ Zapata. All rights reserved.
//

import UIKit

class AppleCheck: UIViewController {

    @IBOutlet var d: UILabel!
    @IBOutlet var eee: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // UserDefaults Variables
        UserDefaults.standard.set("usernameTF.text", forKey: "hi")

        // Do any additional setup after loading the view.
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
    
    // Opens View
    override func viewWillAppear(_ animated: Bool)
    {
        if let x = UserDefaults.standard.object(forKey: "UsermnameApple") as? String
        {
            d.text = x
        }
        if let r = UserDefaults.standard.object(forKey: "PasswordApple") as? String
        {
            eee.text = r
        }
        
    }

}
