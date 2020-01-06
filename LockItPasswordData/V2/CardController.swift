//
//  CardController.swift
//  LockItPasswordData
//
//  Created by JJ Zapata on 10/11/19.
//  Copyright © 2019 JJ Zapata. All rights reserved.
//

import UIKit
import FirebaseDatabase

class CardController: UIViewController {
    
    @IBOutlet var CardView : UIView!
    @IBOutlet var BankNameLabel : UILabel!
    @IBOutlet var DigitsLabel : UILabel!
    @IBOutlet var NameOnCardLabel : UILabel!
    @IBOutlet var ExpiryDateLabel : UILabel!
    
    // Vairbales
    private var datePicker: UIDatePicker?
    var databaseRefer : DatabaseReference!
    var databaseHandle : DatabaseHandle!
    var PINNUM = ""
    var CVVNUM = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Firebase Init ( Read )
        databaseRefer = Database.database().reference()
        
        // Functions To Call
        SetupCardView()
        DatePicker()
        StartUp()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        StartUp()
        DoDarkThings()
    }
    
    func DoDarkThings() {
        let bool = UserDefaults.standard.bool(forKey: "DARK")
        if bool == true {
            view.backgroundColor = .black
        } else {
            view.backgroundColor = .white
        }
    }
    
    func StartUp() {
        
        guard let email = UserDefaults.standard.string(forKey: "PASSWORD") else {
            return
        }
        
        databaseHandle = databaseRefer.child(email).child("Credit Card Numbers").child("Bank Name").observe(.childAdded, with: { (data) in
            let name : String = (data.value as? String)!
            self.BankNameLabel.text = name
            debugPrint(name)
        })
        
        databaseHandle = databaseRefer.child(email).child("Credit Card Numbers").child("Name On Card").observe(.childAdded, with: { (data) in
            let name : String = (data.value as? String)!
            self.NameOnCardLabel.text = name
            debugPrint(name)
        })
        
        databaseHandle = databaseRefer.child(email).child("Credit Card Numbers").child("Card Number").observe(.childAdded, with: { (data) in
            let name : String = (data.value as? String)!
            self.DigitsLabel.text = name
            debugPrint(name)
        })
        
        databaseHandle = databaseRefer.child(email).child("Credit Card Numbers").child("ExpiryDate").observe(.childAdded, with: { (data) in
            let name : String = (data.value as? String)!
            self.ExpiryDateLabel.text = name
            debugPrint(name)
        })
    }
    
    @IBAction func ShowDetails(_ sender: Any) {
        
        guard let email = UserDefaults.standard.string(forKey: "PASSWORD") else {
            return
        }
        
        databaseHandle = databaseRefer.child(email).child("Credit Card Numbers").child("PINCode").observe(.childAdded, with: { (data) in
            let name : String = (data.value as? String)!
            self.PINNUM = name
            debugPrint(name)
        })
        
        databaseHandle = databaseRefer.child(email).child("Credit Card Numbers").child("CVV").observe(.childAdded, with: { (data) in
            let name : String = (data.value as? String)!
            self.CVVNUM = name
            debugPrint(name)
        })
        
        let PIN = "PIN : \(self.PINNUM)"
        let CVV = "CVV : \(self.CVVNUM)"
        let Message = "\(CVV), \(PIN)"
        let alert = UIAlertController(title: "Details", message: Message, preferredStyle: .alert)
        let okay = UIAlertAction(title: "Okay", style: .default, handler: nil)
        alert.addAction(okay)
        present(alert, animated: true, completion: nil)
    }
    
    func DatePicker() {
        // Date Picker
        datePicker = UIDatePicker()
        datePicker?.datePickerMode = .date
        datePicker?.addTarget(self, action: #selector(CreditCards.dateChanged(datePicker:)), for: .valueChanged)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(CreditCards.viewTapped(gestureRecognizer:)))
        view.addGestureRecognizer(tapGesture)
    }
    
    // Tap Gesture
    @objc func viewTapped(gestureRecognizer: UITapGestureRecognizer)
    {
        view.endEditing(true)
    }
    
    func SetupCardView() {
        CardView.layer.cornerRadius = 25
        CardView.backgroundColor = .clear
    }
    
    // Date Changed Function
    @objc func dateChanged(datePicker: UIDatePicker)
    {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyyy"
        print(formatter.string(from: datePicker.date))
    }
    
    @IBAction func IWannaEdit(_ sender: Any) {
        let alertController = UIAlertController(title: "Update Your Information", message: "", preferredStyle: .alert)
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let ok = UIAlertAction(title: "Save", style: .default) { (action: UIAlertAction) -> Void in
            print("OK")
            let BankName = alertController.textFields?[0]
            print(BankName!.text!)
            let NameOnCard = alertController.textFields?[1]
            print(NameOnCard!.text!)
            let EnterDigits = alertController.textFields?[2]
            print(EnterDigits!.text!)
            let ExpryDate = alertController.textFields?[3]
            print(ExpryDate!.text!)
            let PINCode = alertController.textFields?[4]
            print(PINCode!.text!)
            let CVV = alertController.textFields?[5]
            print(CVV!.text!)
            
            guard let email = UserDefaults.standard.string(forKey: "PASSWORD") else {
                return
            }
            
            let formatter = DateFormatter()
            formatter.dateFormat = "MM/yyyy"
            
            self.databaseRefer.child(email).child("Credit Card Numbers").child("Bank Name").childByAutoId().setValue(BankName!.text!)
            self.databaseRefer.child(email).child("Credit Card Numbers").child("Name On Card").childByAutoId().setValue(NameOnCard!.text!)
            self.databaseRefer.child(email).child("Credit Card Numbers").child("Card Number").childByAutoId().setValue(EnterDigits!.text!)
            self.databaseRefer.child(email).child("Credit Card Numbers").child("ExpiryDate").childByAutoId().setValue(String(formatter.string(from: self.datePicker!.date)))
            self.databaseRefer.child(email).child("Credit Card Numbers").child("PINCode").childByAutoId().setValue(PINCode!.text!)
            self.databaseRefer.child(email).child("Credit Card Numbers").child("CVV").childByAutoId().setValue(CVV!.text!)
        }
        
        alertController.addTextField { (textField : UITextField) in
            textField.placeholder = "Bank Name"
        }
        alertController.addTextField { (textField : UITextField) in
            textField.placeholder = "Name On Card"
        }
        alertController.addTextField { (textField : UITextField) in
            textField.placeholder = "Enter Digits"
            textField.keyboardType = .decimalPad
        }
        alertController.addTextField { (textField : UITextField) in
            textField.placeholder = "Expiration Date"
            textField.inputView = self.datePicker
            let formatter = DateFormatter()
            formatter.dateFormat = "MM/yyyy"
            textField.text = ""
        }
        alertController.addTextField { (textField : UITextField) in
            textField.placeholder = "PIN Code"
        }
        alertController.addTextField { (textField : UITextField) in
            textField.placeholder = "CVV"
        }
        alertController.addAction(cancel)
        alertController.addAction(ok)
        self.present(alertController, animated: true, completion: nil)
    }

}
