//
//  BankAccount.swift
//  LockItPasswordData
//
//  Created by JJ Zapata on 5/20/19.
//  Copyright © 2019 JJ Zapata. All rights reserved.
//

import UIKit

class BankAccount: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    // Views
    @IBOutlet var addBankView: UIView!
    @IBOutlet var normalView: UIView!
    
    // Labels
    @IBOutlet var bankNameLbl: UILabel!
    @IBOutlet var accountNumberLbl: UILabel!
    @IBOutlet var customerIdLbl: UILabel!
    @IBOutlet var loginPasswordLbl: UILabel!
    @IBOutlet var transactionPasswordLbl: UILabel!
    @IBOutlet var ifscCodeLbl: UILabel!
    @IBOutlet var swiftCodeLbl: UILabel!
    
    // Text Fields
    @IBOutlet var bankName: UITextField!
    @IBOutlet var accountNumber: UITextField!
    @IBOutlet var customerId: UITextField!
    @IBOutlet var loginPassword: UITextField!
    @IBOutlet var transactionPassword: UITextField!
    @IBOutlet var type: UITextField!
    @IBOutlet var swiftCode: UITextField!
    
    // Variables
    private var datePicker: UIPickerView?
    var data = ["Checking", "Savings", "Line Of Credit", "ATM", "Money Market", "Other"]
    var picker = UIPickerView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Adding View
        self.addBankView.layer.cornerRadius = self.addBankView.frame.height/24
        self.addBankView.layer.cornerRadius = self.addBankView.frame.height/24
        
        // TextFields
        type.inputView = picker
        
        // Picker View
        picker.delegate = self
        picker.dataSource = self
        
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
    
    // Added Pressed
    @IBAction func addedPressed(_ sender: Any)
    {
        animateInIR()
    }
    
    // Exitted
    @IBAction func exit(_ sender: Any)
    {
        animateOutIR()
    }
    
    func animateInIR()
    {
        self.view.addSubview(self.addBankView)
        self.addBankView.center = self.view.center
        
        self.addBankView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
        self.addBankView.alpha = 0
        
        UIView.animate(withDuration: 0.4) {
            self.addBankView.alpha = 1
            self.addBankView.transform = CGAffineTransform.identity
        }
    }
    
    func animateOutIR()
    {
        UIView.animate(withDuration: 0.3)
        {
            self.addBankView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
            self.addBankView.alpha = 0
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int
    {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        return data.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        type.text = data[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        return data[row]
    }

}
