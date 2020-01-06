//
//  CreditCards.swift
//  LockItPasswordData
//
//  Created by JJ Zapata on 5/7/19.
//  Copyright © 2019 JJ Zapata. All rights reserved.
//

import UIKit
import FirebaseDatabase

class CreditCards: UIViewController {

/*databaseHandle = databaseRefer.child(email).child("Defaults").child("Email Password").observe(.childAdded, with: { (data) in
    let name : String = (data.value as? String)!
    self.passwordLbl.text = name
    debugPrint(name)
})*/
    
    // Views
    @IBOutlet var viewCheckUp: UIView!
    
    // Labels
    @IBOutlet var brandInfo: UILabel!
    @IBOutlet var nameOnCardLbl: UILabel!
    @IBOutlet var cardNumberLbl: UILabel!
    @IBOutlet var expiryDateLbl: UILabel!
    @IBOutlet var PinCodeLbl: UILabel!
    @IBOutlet var cvvNumberLbl: UILabel!
    
    // Firebase Init
    var databaseRefer : DatabaseReference!
    var databaseHandle : DatabaseHandle!
    
    // Image Views
    @IBOutlet var logoImage: UIImageView!
    
    // Views
    @IBOutlet var addCardView: UIView!
    
    // Text Fields
    @IBOutlet var cardBankName: UITextField!
    @IBOutlet var nameOnCard: UITextField!
    @IBOutlet var EnterDigits: UITextField!
    @IBOutlet var expiryDate: UITextField!
    @IBOutlet var pin: UITextField!
    @IBOutlet var cvv: UITextField!
    
    // Buttons
    @IBOutlet var one: UIButton!
    @IBOutlet var two: UIButton!
    @IBOutlet var three: UIButton!
    @IBOutlet var four: UIButton!
    @IBOutlet var five: UIButton!
    
    // Vairbales
    private var datePicker: UIDatePicker?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Firebase Init ( Read )
        databaseRefer = Database.database().reference()
        
        // viewCheckUp
        self.viewCheckUp.layer.cornerRadius = self.viewCheckUp.frame.height/24
        
        // Buttons
        one.layer.cornerRadius = 3
        two.layer.cornerRadius = 3
        three.layer.cornerRadius = 3
        four.layer.cornerRadius = 3
        five.layer.cornerRadius = 3
        
        // Date Picker
        datePicker = UIDatePicker()
        datePicker?.datePickerMode = .date
        datePicker?.addTarget(self, action: #selector(CreditCards.dateChanged(datePicker:)), for: .valueChanged)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(CreditCards.viewTapped(gestureRecognizer:)))
        view.addGestureRecognizer(tapGesture)
        
        // Text Fields
        expiryDate.inputView = datePicker

        // Do any additional setup after loading the view.
    }
    
    // Tap Gesture
    @objc func viewTapped(gestureRecognizer: UITapGestureRecognizer)
    {
        view.endEditing(true)
    }
    
    // Date Changed Function
    @objc func dateChanged(datePicker: UIDatePicker)
    {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyyy"
        expiryDate.text = formatter.string(from: datePicker.date)
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
    
    // Shows Custom Info
    @IBAction func addedPressed(_ sender: Any)
    {
        animateInIR()
    }
    
    // Exits Customs
    @IBAction func exit(_ sender: Any)
    {
        animateOutIR()
    }
    
    // Animates Function
    func animateInIR()
    {
        self.view.addSubview(self.addCardView)
        self.addCardView.center = self.view.center
        
        self.addCardView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
        self.addCardView.alpha = 0
        
        UIView.animate(withDuration: 0.4) {
            self.addCardView.alpha = 1
            self.addCardView.transform = CGAffineTransform.identity
        }
    }
    
    // Aniaates Out Function
    func animateOutIR()
    {
        UIView.animate(withDuration: 0.3)
        {
            self.addCardView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
            self.addCardView.alpha = 0
        }
    }
    
    // Submits Information
    @IBAction func siubmitAction(_ sender: Any)
    {
        brandInfo.text = cardBankName.text
        nameOnCardLbl.text = nameOnCard.text
        cardNumberLbl.text = EnterDigits.text
        expiryDateLbl.text = expiryDate.text
        PinCodeLbl.text = pin.text
        cvvNumberLbl.text = cvv.text
        
        guard let email = UserDefaults.standard.string(forKey: "PASSWORD") else {
            return
        }
        
        self.databaseRefer.child(email).child("Credit Card Numbers").child("Bank Name").childByAutoId().setValue(brandInfo.text)
        self.databaseRefer.child(email).child("Credit Card Numbers").child("Name On Card").childByAutoId().setValue(nameOnCardLbl.text)
        self.databaseRefer.child(email).child("Credit Card Numbers").child("Card Number").childByAutoId().setValue(cardNumberLbl.text)
        self.databaseRefer.child(email).child("Credit Card Numbers").child("ExpiryDate").childByAutoId().setValue(expiryDateLbl.text)
        self.databaseRefer.child(email).child("Credit Card Numbers").child("PINCode").childByAutoId().setValue(PinCodeLbl.text)
        self.databaseRefer.child(email).child("Credit Card Numbers").child("CVV").childByAutoId().setValue(cvvNumberLbl.text)
        
        animateOutIR()
        
    }
    
    @IBAction func visa(_ sender: Any)
    {
        self.one.layer.borderColor = UIColor.green.cgColor
        self.one.layer.borderWidth = 1.5
        self.two.layer.borderColor = UIColor.clear.cgColor
        self.two.layer.borderWidth = 1.5
        self.three.layer.borderColor = UIColor.clear.cgColor
        self.three.layer.borderWidth = 1.5
        self.four.layer.borderColor = UIColor.clear.cgColor
        self.four.layer.borderWidth = 1.5
        self.five.layer.borderColor = UIColor.clear.cgColor
        self.five.layer.borderWidth = 1.5
        UserDefaults.standard.set("visa", forKey: "cardType")
        logoImage.image = #imageLiteral(resourceName: "visa")
    }
    
    @IBAction func maestro(_ sender: Any)
    {
        self.one.layer.borderColor = UIColor.clear.cgColor
        self.one.layer.borderWidth = 1.5
        self.two.layer.borderColor = UIColor.green.cgColor
        self.two.layer.borderWidth = 1.5
        self.three.layer.borderColor = UIColor.clear.cgColor
        self.three.layer.borderWidth = 1.5
        self.four.layer.borderColor = UIColor.clear.cgColor
        self.four.layer.borderWidth = 1.5
        self.five.layer.borderColor = UIColor.clear.cgColor
        self.five.layer.borderWidth = 1.5
        UserDefaults.standard.set("maestro", forKey: "cardType")
        logoImage.image = #imageLiteral(resourceName: "maestro")
    }
    
    @IBAction func discover(_ sender: Any)
    {
        self.one.layer.borderColor = UIColor.clear.cgColor
        self.one.layer.borderWidth = 1.5
        self.two.layer.borderColor = UIColor.clear.cgColor
        self.two.layer.borderWidth = 1.5
        self.three.layer.borderColor = UIColor.green.cgColor
        self.three.layer.borderWidth = 1.5
        self.four.layer.borderColor = UIColor.clear.cgColor
        self.four.layer.borderWidth = 1.5
        self.five.layer.borderColor = UIColor.clear.cgColor
        self.five.layer.borderWidth = 1.5
        UserDefaults.standard.set("discover", forKey: "cardType")
        logoImage.image = #imageLiteral(resourceName: "discover")
    }
    
    @IBAction func masterCard(_ sender: Any)
    {
        self.one.layer.borderColor = UIColor.clear.cgColor
        self.one.layer.borderWidth = 1.5
        self.two.layer.borderColor = UIColor.clear.cgColor
        self.two.layer.borderWidth = 1.5
        self.three.layer.borderColor = UIColor.clear.cgColor
        self.three.layer.borderWidth = 1.5
        self.four.layer.borderColor = UIColor.green.cgColor
        self.four.layer.borderWidth = 1.5
        self.five.layer.borderColor = UIColor.clear.cgColor
        self.five.layer.borderWidth = 1.5
        UserDefaults.standard.set("masterCard", forKey: "cardType")
        logoImage.image = #imageLiteral(resourceName: "mastercaard")
    }
    
    @IBAction func americanWExpress(_ sender: Any)
    {
        self.one.layer.borderColor = UIColor.clear.cgColor
        self.one.layer.borderWidth = 1.5
        self.two.layer.borderColor = UIColor.clear.cgColor
        self.two.layer.borderWidth = 1.5
        self.three.layer.borderColor = UIColor.clear.cgColor
        self.three.layer.borderWidth = 1.5
        self.four.layer.borderColor = UIColor.clear.cgColor
        self.four.layer.borderWidth = 1.5
        self.five.layer.borderColor = UIColor.green.cgColor
        self.five.layer.borderWidth = 1.5
        UserDefaults.standard.set("americanExpress", forKey: "cardType")
        logoImage.image = #imageLiteral(resourceName: "ae-1")
    }
    
    // Once View Appears
    override func viewDidAppear(_ animated: Bool)
    {
        let cardType = UserDefaults.standard.object(forKey: "cardType") as? String
        if cardType == "visa"
        {
            logoImage.image = #imageLiteral(resourceName: "visa")
        }
        if cardType == "maestro"
        {
            logoImage.image = #imageLiteral(resourceName: "maestro")
        }
        if cardType == "discover"
        {
            logoImage.image = #imageLiteral(resourceName: "discover")
        }
        if cardType == "masterCard"
        {
            logoImage.image = #imageLiteral(resourceName: "mastercaard")
        }
        if cardType == "americanExpress"
        {
            logoImage.image = #imageLiteral(resourceName: "ae-1")
        }
        if cardType != "visa" && cardType != "maestro" && cardType != "discover" && cardType != "masterCard" && cardType != "americanExpress"
        {
            print("none")
        }
        
        guard let email = UserDefaults.standard.string(forKey: "PASSWORD") else {
            return
        }
        
        databaseHandle = databaseRefer.child(email).child("Credit Card Numbers").child("Bank Name").observe(.childAdded, with: { (data) in
            let name : String = (data.value as? String)!
            self.nameOnCardLbl.text = name
            debugPrint(name)
        })
        
        databaseHandle = databaseRefer.child(email).child("Credit Card Numbers").child("Name On Card").observe(.childAdded, with: { (data) in
            let name : String = (data.value as? String)!
            self.nameOnCardLbl.text = name
            debugPrint(name)
        })
        
        databaseHandle = databaseRefer.child(email).child("Credit Card Numbers").child("Card Number").observe(.childAdded, with: { (data) in
            let name : String = (data.value as? String)!
            self.cardNumberLbl.text = name
            debugPrint(name)
        })
        
        databaseHandle = databaseRefer.child(email).child("Credit Card Numbers").child("ExpiryDate").observe(.childAdded, with: { (data) in
            let name : String = (data.value as? String)!
            self.expiryDateLbl.text = name
            debugPrint(name)
        })
        
        databaseHandle = databaseRefer.child(email).child("Credit Card Numbers").child("PINCode").observe(.childAdded, with: { (data) in
            let name : String = (data.value as? String)!
            self.PinCodeLbl.text = name
            debugPrint(name)
        })
        
        databaseHandle = databaseRefer.child(email).child("Credit Card Numbers").child("CVV").observe(.childAdded, with: { (data) in
            let name : String = (data.value as? String)!
            self.cvvNumberLbl.text = name
            debugPrint(name)
        })
        
    }
    
}

