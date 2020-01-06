//
//  ViewController1.swift
//  LockItPasswordData
//
//  Created by JJ Zapata on 4/28/19.
//  Copyright © 2019 JJ Zapata. All rights reserved.
//

import UIKit
import FirebaseDatabase

class ViewController1: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    // Picker Views
    @IBOutlet var pickerView: UIPickerView!
    
    // Buttons
    @IBOutlet var SubmitBtn: UIButton!
    
    // Labels
    @IBOutlet var SwipeLbl: UILabel!
    @IBOutlet var Desc: UILabel!
    
    // Variable
    let banks = ["Discover", "American Express", "Capital One", "Wells Fargo", "Chase Bank", "Bank Of America", "Citibank",  ]
    var ref: DatabaseReference!

    // Number of Options
    func numberOfComponents(in pickerView: UIPickerView) -> Int
    {
        return 1
    }
    
    // Title For Each Row
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return banks[row]
    }
    
    // Number Of Rows
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        return banks.count
    }
    
    // Did Select Row At
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        Desc.text = banks[row]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Firebase Configuraition
        ref = Database.database().reference()
        
        // Picker View
        self.pickerView.layer.cornerRadius = self.pickerView.frame.height/5
        
        // Submit Button
        self.SubmitBtn.layer.cornerRadius = self.SubmitBtn.frame.height/5
        self.SubmitBtn.backgroundColor = .lightGray
        
        // Swipe Label
        self.SwipeLbl.isHidden = true
        
        // More Variables

        // Do any additional setup after loading the view.
    }
    
    // Submit Button Pressed
    @IBAction func SubmitBtnPressed(_ sender: Any)
    {
        self.SwipeLbl.isHidden = false
        self.SubmitBtn.isHidden = true
        UserDefaults.standard.set(Desc.text, forKey: "CreditCardType")
        UserDefaults.standard.set("Yes", forKey: "Used")
    }
    
}
