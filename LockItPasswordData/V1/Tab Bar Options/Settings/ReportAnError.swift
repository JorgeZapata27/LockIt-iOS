//
//  ReportAnError.swift
//  LockItPasswordData
//
//  Created by JJ Zapata on 4/24/19.
//  Copyright © 2019 JJ Zapata. All rights reserved.
//

import UIKit
import FirebaseDatabase

class ReportAnError: UIViewController, UITextFieldDelegate {
    
    // IBOutlets
    @IBOutlet var NameTF: UITextField!
    @IBOutlet var ErrorView: UITextField!
    @IBOutlet var SubmitBtn: UIButton!
    @IBOutlet var TextHead: UILabel!
    
    // Variables
    var ref: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DoDarkThings()
        
        // Firebase Stuff
        ref = Database.database().reference()
        
        
        // Submit Button
        self.SubmitBtn.backgroundColor = .darkGray
        self.SubmitBtn.layer.cornerRadius = self.SubmitBtn.frame.height/5

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        DoDarkThings()
    }
    
    func DoDarkThings() {
        let bool = UserDefaults.standard.bool(forKey: "DARK")
        if bool == true {
            view.backgroundColor = .black
            TextHead.textColor = .white
            self.NameTF.delegate = self
            self.NameTF.tintColor = .white
            self.NameTF.borderStyle = .none
            self.NameTF.attributedPlaceholder = NSAttributedString(string: "  Name", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
            let nameIMG = UIImage(named: "man")
            addLeftImageTo(txtField: NameTF, andImage: nameIMG!)
            self.NameTF.backgroundColor = .clear
            let bottomLayerEmail = CALayer()
            let llength = self.NameTF.frame.width
            bottomLayerEmail.frame = CGRect(x: 0, y: 29, width: llength, height: 0.6)
            bottomLayerEmail.backgroundColor = UIColor.white.cgColor
            NameTF.layer.addSublayer(bottomLayerEmail)
            self.ErrorView.delegate = self
            self.ErrorView.tintColor = .white
            self.ErrorView.borderStyle = .none
            self.ErrorView.backgroundColor = .clear
            self.ErrorView.attributedPlaceholder = NSAttributedString(string: "  Explain Your Error", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
            let bottomLayerError = CALayer()
            let length = self.ErrorView.frame.width
            bottomLayerError.frame = CGRect(x: 0, y: 29, width: length, height: 0.6)
            bottomLayerError.backgroundColor = UIColor.white.cgColor
            ErrorView.layer.addSublayer(bottomLayerError)
        } else {
            view.backgroundColor = .white
            TextHead.textColor = .black
            self.NameTF.delegate = self
            self.NameTF.tintColor = .black
            self.NameTF.borderStyle = .none
            self.NameTF.attributedPlaceholder = NSAttributedString(string: "  Name", attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
            let nameIMG = UIImage(named: "black")
            addLeftImageTo(txtField: NameTF, andImage: nameIMG!)
            self.NameTF.backgroundColor = .clear
            let bottomLayerEmail = CALayer()
            let llength = self.NameTF.frame.width
            bottomLayerEmail.frame = CGRect(x: 0, y: 29, width: llength, height: 0.6)
            bottomLayerEmail.backgroundColor = UIColor.black.cgColor
            NameTF.layer.addSublayer(bottomLayerEmail)
            self.ErrorView.delegate = self
            self.ErrorView.tintColor = .black
            self.ErrorView.borderStyle = .none
            self.ErrorView.backgroundColor = .clear
            self.ErrorView.attributedPlaceholder = NSAttributedString(string: "  Explain Your Error", attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
            let bottomLayerError = CALayer()
            let length = self.ErrorView.frame.width
            bottomLayerError.frame = CGRect(x: 0, y: 29, width: length, height: 0.6)
            bottomLayerError.backgroundColor = UIColor.black.cgColor
            ErrorView.layer.addSublayer(bottomLayerError)
        }
        
        NotificationCenter.default.addObserver(self, selector: #selector(willResignActive), name: UIApplication.willResignActiveNotification, object: nil)
    }
    
    @objc func willResignActive(_ notification: Notification) {
        print("sdalfkjasd;lfjk")
    }


    // Adds Image To Left OF Text Field
    func addLeftImageTo(txtField: UITextField, andImage img: UIImage)
    {
        let leftImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: img.size.width/2, height: img.size.height/2))
        leftImageView.image = img
        txtField.leftView = leftImageView
        txtField.leftViewMode = .always
    }
    
    // Submit Button Is Pressed
    @IBAction func submitBtnPressed(_ sender: Any)
    {
        let name = self.NameTF.text!
        let problem = self.ErrorView.text!
        let errorMessage = "\(name) - \(problem)"
        ref?.child("Error Responses").child("V2").childByAutoId().setValue(errorMessage)
        self.ErrorView.text = ""
        self.NameTF.text = ""
        let alert = UIAlertController(title: "Success", message: "Your Error Report Has Sent.", preferredStyle: .alert)
        let okay = UIAlertAction(title: "Okay", style: .default, handler: nil)
        alert.addAction(okay)
        self.present(alert, animated: true, completion: nil)
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
