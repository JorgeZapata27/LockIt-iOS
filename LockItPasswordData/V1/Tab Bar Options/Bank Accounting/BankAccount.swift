//
//  BankAccount.swift
//  LockItPasswordData
//
//  Created by JJ Zapata on 5/21/19.
//  Copyright © 2019 JJ Zapata. All rights reserved.
//

import UIKit
import FirebaseDatabase

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
    
    // Firebase Init
    var databaseRefer : DatabaseReference!
    var databaseHandle : DatabaseHandle!
    
    // Variables
    private var datePicker: UIPickerView?
    var data = ["Checking", "Savings", "Line Of Credit", "ATM", "Money Market", "Other"]
    var picker = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Firebase Init ( Read )
        databaseRefer = Database.database().reference()
        
        // Adding View
        self.addBankView.layer.cornerRadius = self.addBankView.frame.height/24
        self.addBankView.layer.cornerRadius = self.addBankView.frame.height/24
        
        // TextFields
        type.inputView = picker
        
        // Picker View
        picker.delegate = self
        picker.dataSource = self
        
        // Views
        self.normalView.layer.cornerRadius = self.normalView.frame.height/24
        self.normalView.layer.cornerRadius = self.normalView.frame.height/24
        
        // Do any additional setup after loading the view.
    }
    
    // Once View Appears
    override func viewDidAppear(_ animated: Bool)
    {
        guard let email = UserDefaults.standard.string(forKey: "PASSWORD") else {
            return
        }
        
        databaseHandle = databaseRefer.child(email).child("Bank Account Information").child("Bank Name").observe(.childAdded, with: { (data) in
            let name : String = (data.value as? String)!
            self.bankNameLbl.text = name
            debugPrint(name)
        })
        
        databaseHandle = databaseRefer.child(email).child("Bank Account Information").child("Account Number").observe(.childAdded, with: { (data) in
            let name : String = (data.value as? String)!
            self.accountNumberLbl.text = name
            debugPrint(name)
        })
        
        databaseHandle = databaseRefer.child(email).child("Bank Account Information").child("Customer Id").observe(.childAdded, with: { (data) in
            let name : String = (data.value as? String)!
            self.customerIdLbl.text = name
            debugPrint(name)
        })
        
        databaseHandle = databaseRefer.child(email).child("Bank Account Information").child("Login Password").observe(.childAdded, with: { (data) in
            let name : String = (data.value as? String)!
            self.loginPasswordLbl.text = name
            debugPrint(name)
        })
        
        databaseHandle = databaseRefer.child(email).child("Bank Account Information").child("Transaction Password").observe(.childAdded, with: { (data) in
            let name : String = (data.value as? String)!
            self.transactionPasswordLbl.text = name
            debugPrint(name)
        })
        
        databaseHandle = databaseRefer.child(email).child("Bank Account Information").child("Type").observe(.childAdded, with: { (data) in
            let name : String = (data.value as? String)!
            self.ifscCodeLbl.text = name
            debugPrint(name)
        })
        
        databaseHandle = databaseRefer.child(email).child("Bank Account Information").child("Swift Code").observe(.childAdded, with: { (data) in
            let name : String = (data.value as? String)!
            self.swiftCodeLbl.text = name
            debugPrint(name)
        })
        
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
        
        guard let email = UserDefaults.standard.string(forKey: "PASSWORD") else {
            return
        }
        
        bankNameLbl.text = bankName.text
        accountNumberLbl.text = accountNumber.text
        customerIdLbl.text = customerId.text
        loginPasswordLbl.text = loginPassword.text
        transactionPasswordLbl.text = transactionPassword.text
        ifscCodeLbl.text = type.text
        swiftCodeLbl.text = swiftCode.text
        
        self.databaseRefer.child(email).child("Bank Account Information").child("Bank Name").childByAutoId().setValue(bankNameLbl.text)
        self.databaseRefer.child(email).child("Bank Account Information").child("Account Number").childByAutoId().setValue(accountNumberLbl.text)
        self.databaseRefer.child(email).child("Bank Account Information").child("Customer Id").childByAutoId().setValue(customerIdLbl.text)
        self.databaseRefer.child(email).child("Bank Account Information").child("Login Password").childByAutoId().setValue(loginPasswordLbl.text)
        self.databaseRefer.child(email).child("Bank Account Information").child("Transaction Password").childByAutoId().setValue(transactionPasswordLbl.text)
        self.databaseRefer.child(email).child("Bank Account Information").child("Type").childByAutoId().setValue(ifscCodeLbl.text)
        self.databaseRefer.child(email).child("Bank Account Information").child("Swift Code").childByAutoId().setValue(swiftCodeLbl.text)
        
        animateOutIR()
        
    }
    
    @IBAction func enterNewView(_ sender: Any)
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
