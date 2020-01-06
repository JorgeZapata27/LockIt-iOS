//
//  SignUp.swift
//  LOCKIT
//
//  Created by JJ Zapata on 4/20/19.
//  Copyright © 2019 JJ Zapata. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

class SignUp: UIViewController, UITextFieldDelegate {
    
    // TextFields
    @IBOutlet var NameTF: UITextField!
    @IBOutlet var EmailTF: UITextField!
    @IBOutlet var PasswordTF: UITextField!
    
    // Buttons
    @IBOutlet var SignUpBtn: UIButton!
    
    // DarkView
    @IBOutlet var darkView: UIVisualEffectView!
    
    // Loading Anims
    @IBOutlet var loadingAnim: UIActivityIndicatorView!
    
    // Variables
    var ref: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Firebase Configuration
        ref = Database.database().reference()
        
        // Name Text Field
        self.NameTF.delegate = self
        self.NameTF.tintColor = .white
        self.NameTF.borderStyle = .none
        let manImg = UIImage(named: "man")
        addLeftImageTo(txtField: NameTF, andImage: manImg!)
        self.NameTF.backgroundColor = .clear
        let bottomLayerName = CALayer()
        let llengthName = self.NameTF.frame.width
        bottomLayerName.frame = CGRect(x: 0, y: 45, width: llengthName, height: 0.6)
        bottomLayerName.backgroundColor = UIColor.white.cgColor
        NameTF.layer.addSublayer(bottomLayerName)
        
        // Email Text Field
        self.EmailTF.delegate = self
        self.EmailTF.tintColor = .white
        self.EmailTF.borderStyle = .none
        let emailImage = UIImage(named: "mail")
        addLeftImageTo(txtField: EmailTF, andImage: emailImage!)
        self.EmailTF.backgroundColor = .clear
        let bottomLayerEmail = CALayer()
        let llengthEmail = self.EmailTF.frame.width
        bottomLayerEmail.frame = CGRect(x: 0, y: 45, width: llengthEmail, height: 0.6)
        bottomLayerEmail.backgroundColor = UIColor.white.cgColor
        EmailTF.layer.addSublayer(bottomLayerEmail)
        
        // Password Text Field
        self.PasswordTF.delegate = self
        self.PasswordTF.tintColor = .white
        self.PasswordTF.borderStyle = .none
        let passwordImage = UIImage(named: "password")
        addLeftImageTo(txtField: PasswordTF, andImage: passwordImage!)
        self.PasswordTF.backgroundColor = .clear
        let bottomLayerPassword = CALayer()
        let lllength = self.PasswordTF.frame.width
        bottomLayerPassword.frame = CGRect(x: 0, y: 45, width: lllength, height: 0.6)
        bottomLayerPassword.backgroundColor = UIColor.white.cgColor
        PasswordTF.layer.addSublayer(bottomLayerPassword)
        
        // Sign Up Button
        self.SignUpBtn.layer.cornerRadius = self.SignUpBtn.frame.height/5
        
        // Loader
        self.loadingAnim.isHidden = true
        self.loadingAnim.startAnimating()
        
        // Do any additional setup after loading the view.
    }
    
    // Textfield Photos
    func addLeftImageTo(txtField: UITextField, andImage img: UIImage)
    {
        let leftImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: img.size.width/2, height: img.size.height/2))
        leftImageView.image = img
        txtField.leftView = leftImageView
        txtField.leftViewMode = .always
    }
    
    // Hides keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        self.view.endEditing(true)
    }
    
    // Return key
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        textField.resignFirstResponder()
        return (true)
    }
    
    // Sign Up Button Pressed
    @IBAction func SignUpBtnPressed(_ sender: Any)
    {
        if EmailTF.text! != ""
        {
            Auth.auth().createUser(withEmail: self.EmailTF.text!, password: self.PasswordTF.text!) { (user, error) in
                if user != nil
                {
                    self.darkView.isHidden = false
                    self.loadingAnim.isHidden = false
                    UserDefaults.standard.removeObject(forKey: "EMAIL")
                    UserDefaults.standard.set(self.EmailTF.text!, forKey: "EMAIL")
                    UserDefaults.standard.removeObject(forKey: "PASSWORD")
                    UserDefaults.standard.set(self.PasswordTF.text!, forKey: "PASSWORD")
                    print("User Has Signed Up!")
                    self.performSegue(withIdentifier: "itsago", sender: self)
                }
                else
                {
                    print("error")
                    let alert = UIAlertController(title: "Account Cannot Be Made", message: "There Was An Error While Processing Your Request.", preferredStyle: .alert)
                    let option1 = UIAlertAction(title: "Sign In", style: .default, handler: self.sub)
                    let cancel = UIAlertAction(title: "Try Again", style: .cancel, handler: nil)
                    alert.addAction(option1)
                    alert.addAction(cancel)
                    self.present(alert, animated: true, completion: nil)
                }
            }
        }
        
    }
    
    func sub(alert: UIAlertAction!)
    {
        performSegue(withIdentifier: "SignIn", sender: self)
    }
    
}
