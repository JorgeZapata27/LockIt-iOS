//
//  ViewController.swift
//  LOCKIT
//
//  Created by JJ Zapata on 4/20/19.
//  Copyright © 2019 JJ Zapata. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

class LoginController: UIViewController, UITextFieldDelegate {
    
    //Labels
    @IBOutlet var Header1: UILabel!
    @IBOutlet var Description: UILabel!
    
    // Navigation Items
    @IBOutlet var nav: UINavigationItem!
    
    // TextFields
    @IBOutlet var textField: UITextField!
    @IBOutlet var password: UITextField!
    
    // Buttons
    @IBOutlet var LogInBtn: UIButton!
    @IBOutlet var google: UIButton!
    @IBOutlet var Dismiss2: UIButton!
    @IBOutlet var DismissBtn: UIButton!
    
    // Visual View
    @IBOutlet var visualEffectView: UIVisualEffectView!
    @IBOutlet var Alert: UIView!
    @IBOutlet var OptionDismiss: UIView!
    
    // Loaders
    @IBOutlet var loadingAnim: UIActivityIndicatorView!
    
    // Variables
    var ref: DatabaseReference!
    
    // Variables
    var effect: UIVisualEffect!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Firebase Configuation
        ref = Database.database().reference()
        
        // Navigation Bar
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        
        // Email Text Field
        self.textField.delegate = self
        self.textField.tintColor = .white
        self.textField.borderStyle = .none
        self.textField.attributedPlaceholder = NSAttributedString(string: "  Email", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        let emailImage = UIImage(named: "mail")
        addLeftImageTo(txtField: textField, andImage: emailImage!)
        self.textField.backgroundColor = .clear
        let bottomLayerEmail = CALayer()
        let llength = self.textField.frame.width
        bottomLayerEmail.frame = CGRect(x: 0, y: 45, width: llength, height: 0.6)
        bottomLayerEmail.backgroundColor = UIColor.white.cgColor
        textField.layer.addSublayer(bottomLayerEmail)
        
        // Password Text Field
        self.password.delegate = self
        self.password.tintColor = .white
        self.password.borderStyle = .none
        self.password.attributedPlaceholder = NSAttributedString(string: "  Password", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        let passwordImage = UIImage(named: "password")
        addLeftImageTo(txtField: password, andImage: passwordImage!)
        self.password.backgroundColor = .clear
        let bottomLayerPassword = CALayer()
        let lllength = self.password.frame.width
        bottomLayerPassword.frame = CGRect(x: 0, y: 45, width: lllength, height: 0.6)
        bottomLayerPassword.backgroundColor = UIColor.white.cgColor
        password.layer.addSublayer(bottomLayerPassword)
        
        // Log In Button
        self.LogInBtn.layer.cornerRadius = self.LogInBtn.frame.height/5
        
        // Google Sign In Button
        self.google.layer.cornerRadius = self.google.frame.height/5
        
        // Dismiss Button
        self.DismissBtn.layer.cornerRadius = self.DismissBtn.frame.height/5
        
        // Alert View
        self.Alert.layer.cornerRadius = self.Alert.frame.height/8
        visualEffectView.isHidden = true
        
        // Dismiss2 Button
        self.Dismiss2.layer.cornerRadius = self.Dismiss2.frame.height/5
        
        // Options 2 View
        self.OptionDismiss.layer.cornerRadius = self.OptionDismiss.frame.height/8
        
        // Loading Animater
        self.loadingAnim.startAnimating()
        
        // Function Calling
        check()
        
    }
    
    // Animating In
    func animateInFUNC()
    {
        self.view.addSubview(Alert)
        Alert.center = self.view.center
        
        Alert.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
        Alert.alpha = 0
        
        UIView.animate(withDuration: 0.4) {
            self.visualEffectView.isHidden = false
            self.Alert.alpha = 1
            self.Alert.transform = CGAffineTransform.identity
        }
    }
    
    // Animating Out
    func animateOutFUNC()
    {
        UIView.animate(withDuration: 0.3)
        {
            self.Alert.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
            self.Alert.alpha = 0
            
            self.visualEffectView.isHidden = true
        }
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
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    // Return key
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return (true)
    }

    // Presses Google
    @IBAction func AlertGoogle(_ sender: Any)
    {
        animateInFUNC()
    }
    
    // Exits Google
    @IBAction func ExitGoogleView(_ sender: Any)
    {
        animateOutFUNC()
    }
    
    // Animates Invalid Responses
    func animateInIR()
    {
        self.view.addSubview(self.OptionDismiss)
        self.OptionDismiss.center = self.view.center
        
        self.OptionDismiss.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
        self.OptionDismiss.alpha = 0
            
        self.visualEffectView.isHidden = false
        
        self.Header1.text = "Invalid Response"
        
        self.Description.text = "Invalid Response. You Must Enter An Email And A Passsword. No Text Fields Should Be Blank."
        
        UIView.animate(withDuration: 0.4) {
            self.visualEffectView.isHidden = false
            self.OptionDismiss.alpha = 1
            self.OptionDismiss.transform = CGAffineTransform.identity
        }
    }
    
    // Animates Out
    func animateOutIR()
    {
        UIView.animate(withDuration: 0.3)
        {
            self.OptionDismiss.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
            self.OptionDismiss.alpha = 0
            
            self.visualEffectView.isHidden = true
        }
    }
    
    // Invalid Response
    func invalidResponse()
    {
        animateInIR()
    }
    
    // Dismisses The ALert View
    @IBAction func dismiss2Pressed(_ sender: Any)
    {
        animateOutIR()
    }
    
    // Animates In
    func AnimateInIUOP()
    {
        self.view.addSubview(self.OptionDismiss)
        self.OptionDismiss.center = self.view.center
        
        self.OptionDismiss.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
        self.OptionDismiss.alpha = 0
        
        self.visualEffectView.isHidden = false
        
        self.Header1.text = "Incorrect Input"
        
        self.Description.text = "Incorrect Username Or Password"
        
        UIView.animate(withDuration: 0.4) {
            self.visualEffectView.isHidden = false
            self.OptionDismiss.alpha = 1
            self.OptionDismiss.transform = CGAffineTransform.identity
        }
    }
    
    // Log In Button Pressed
    @IBAction func LOGINBTNPREssed(_ sender: Any)
    {
        if textField.text != ""
        {
            print("Successful")
            Auth.auth().signIn(withEmail: textField.text!, password: password.text!) { (user, error) in
                if user != nil {
                    // View is gone
                    self.visualEffectView.isHidden = false
                    self.loadingAnim.isHidden = false
                    print("Login Successful")
                    let username = self.textField.text
                    UserDefaults.standard.set(username, forKey: "emailUser")
                    UserDefaults.standard.set(username, forKey: "passwUser")
                    UserDefaults.standard.removeObject(forKey: "EMAIL")
                    UserDefaults.standard.set(username, forKey: "EMAIL")
                    UserDefaults.standard.set(self.textField.text!, forKey: "email_")
                    UserDefaults.standard.set("No Input", forKey: "emailPassword")
                    UserDefaults.standard.set(username, forKey: "userName")
                    UserDefaults.standard.set(true, forKey: "SIGNEDIN")
                    UserDefaults.standard.set(self.password.text!, forKey: "PASSWORD")
                    
                    
                    UserDefaults.standard.removeObject(forKey: "EMAIL")
                    UserDefaults.standard.set(self.textField.text!, forKey: "EMAIL")
                    UserDefaults.standard.removeObject(forKey: "PASSWORD")
                    UserDefaults.standard.set(self.password.text!, forKey: "PASSWORD")
                    
                    self.performSegue(withIdentifier: "loggedin", sender: self)
                } else {
                    print("Incorrect")
                    self.AnimateInIUOP()
                }
            }
        }
        else
        {
            animateInIR()
        }
        
    }
    
    // Auto Login Configuration
    func check()
    {
        let username = UserDefaults.standard.object(forKey: "emailUser") as? String
        if username != nil
        {
            performSegue(withIdentifier: "loggedin", sender: self)
        }
        else
        {
            checkUp()
        }
    }
    
    // Auto Login Configuration
    func checkUp()
    {
        let username = UserDefaults.standard.object(forKey: "emailUserSU") as? String
        if username != nil
        {
            performSegue(withIdentifier: "loggedin", sender: self)
        }
        else
        {
            print("Equal To Nill")
        }
    }
    
}
