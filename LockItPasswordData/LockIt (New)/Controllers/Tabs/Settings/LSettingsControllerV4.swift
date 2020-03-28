//
//  LSettingsControllerV4.swift
//  LockItPasswordData
//
//  Created by JJ Zapata on 3/28/20.
//  Copyright © 2020 JJ Zapata. All rights reserved.
//

import UIKit
import Firebase
import FirebaseCore
import FirebaseAuth
import FirebaseDatabase
import FirebaseStorage

class LSettingsControllerV4: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var profileImageView : UIImageView!
    @IBOutlet var nameLabel : UILabel!
    @IBOutlet var countryLabel : UILabel!
    @IBOutlet var emailLabel : UILabel!
    @IBOutlet var phoneLabel : UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.GetInformationFromFirebase()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func SignOut(_ sender: UIButton) {
        let alert = UIAlertController(title: "Sign Out?", message: "Are You Sure You Want To Sign Out?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "No", style: .destructive, handler: nil))
        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { (action) in
            do {
                try Auth.auth().signOut()
                let sb = UIStoryboard(name: "NewMain", bundle: nil)
                let vc: UIViewController = sb.instantiateViewController(withIdentifier: "StartUpNavController") as! StartUpNavController
                UIApplication.shared.keyWindow?.rootViewController = vc
            } catch let error {
                print(error)
            }
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func OurWebsite(_ sender: UIButton) {
        Database.database().reference().child("Website").observe(.value, with: { (data) in
            let qqqq : String = (data.value as? String)!
            if let url = URL(string: "\(qqqq)") {
                UIApplication.shared.open(url)
            }
        })
    }
    
    func GetInformationFromFirebase() {
        Database.database().reference().child("Users").child(Auth.auth().currentUser!.uid).child("profileImageURL").observe(.value, with: { (data) in
            let name : String = (data.value as? String)!
            self.profileImageView.loadImageUsingCacheWithUrlString(name)
            Database.database().reference().child("Users").child(Auth.auth().currentUser!.uid).child("email").observe(.value, with: { (data) in
                let dddd : String = (data.value as? String)!
                self.emailLabel.text = dddd
                debugPrint(dddd)
                Database.database().reference().child("Users").child(Auth.auth().currentUser!.uid).child("name").observe(.value, with: { (data) in
                    let aaaa : String = (data.value as? String)!
                    self.nameLabel.text = aaaa
                    debugPrint(aaaa)
                    Database.database().reference().child("Users").child(Auth.auth().currentUser!.uid).child("phoneNumber").observe(.value, with: { (data) in
                        let ssss : String = (data.value as? String)!
                        self.phoneLabel.text = ssss
                        debugPrint(ssss)
                        Database.database().reference().child("Users").child(Auth.auth().currentUser!.uid).child("Country").observe(.value, with: { (data) in
                            let qqqq : String = (data.value as? String)!
                            self.countryLabel.text = qqqq
                            debugPrint(qqqq)
                            self.CheckForEmptyInformation()
                        })
                    })
                })
            })
        })
    }
    
    func CheckForEmptyInformation() {
        print(self.countryLabel!.text!)
        print(self.phoneLabel!.text!)
        print("HELLO")
        if self.countryLabel!.text! == "Unknown" && self.phoneLabel!.text! == "Unknown" {
            print("HI")
            let alertController = UIAlertController(title: "Oh No!", message: "We Don't Have All Your Information", preferredStyle: .alert)
            let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            let ok = UIAlertAction(title: "Save", style: .default) { (action: UIAlertAction) -> Void in
                print("OK")
                let phoneNumberInput = alertController.textFields![0].text!
                let country = alertController.textFields![1].text!
                Database.database().reference().child("Users").child(Auth.auth().currentUser!.uid).child("phoneNumber").setValue(phoneNumberInput)
                Database.database().reference().child("Users").child(Auth.auth().currentUser!.uid).child("Country").setValue(country)
                self.GetInformationFromFirebase()
                self.dismiss(animated: true, completion: nil)
            }
            alertController.addTextField { (textField : UITextField) in
                textField.placeholder = "Phone Number"
                textField.delegate = self
            }
            alertController.addTextField { (textField : UITextField) in
                textField.placeholder = "Country"
            }
            alertController.addAction(cancel)
            alertController.addAction(ok)
            self.present(alertController, animated: true, completion: nil)
            
        } else if self.phoneLabel!.text! == "Unknown" {
            let alertController = UIAlertController(title: "Oh No!", message: "We Don't Have All Your Information", preferredStyle: .alert)
            let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            let ok = UIAlertAction(title: "Save", style: .default) { (action: UIAlertAction) -> Void in
                print("OK")
                let phoneNumberInput = alertController.textFields![0].text!
                Database.database().reference().child("Users").child(Auth.auth().currentUser!.uid).child("phoneNumber").setValue(phoneNumberInput)
                self.GetInformationFromFirebase()
                self.dismiss(animated: true, completion: nil)
            }
            alertController.addTextField { (textField : UITextField) in
                textField.placeholder = "Phone Number"
                textField.delegate = self
            }
            alertController.addAction(cancel)
            alertController.addAction(ok)
            self.present(alertController, animated: true, completion: nil)
        } else if self.countryLabel!.text! == "Unknown" {
            let alertController = UIAlertController(title: "Oh No!", message: "We Don't Have All Your Information", preferredStyle: .alert)
            let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            let ok = UIAlertAction(title: "Save", style: .default) { (action: UIAlertAction) -> Void in
                print("OK")
                let phoneNumberInput = alertController.textFields![0].text!
                Database.database().reference().child("Users").child(Auth.auth().currentUser!.uid).child("Country").setValue(phoneNumberInput)
                self.GetInformationFromFirebase()
                self.dismiss(animated: true, completion: nil)
            }
            alertController.addTextField { (textField : UITextField) in
                textField.placeholder = "Country"
            }
            alertController.addAction(cancel)
            alertController.addAction(ok)
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        var fullString = textField.text ?? ""
        fullString.append(string)
        if range.length == 1 {
            textField.text = format(phoneNumber: fullString, shouldRemoveLastDigit: true)
        } else {
            textField.text = format(phoneNumber: fullString)
        }
        return false
    }
    
    func format(phoneNumber: String, shouldRemoveLastDigit: Bool = false) -> String {
        guard !phoneNumber.isEmpty else { return "" }
        guard let regex = try? NSRegularExpression(pattern: "[\\s-\\(\\)]", options: .caseInsensitive) else { return "" }
        let r = NSString(string: phoneNumber).range(of: phoneNumber)
        var number = regex.stringByReplacingMatches(in: phoneNumber, options: .init(rawValue: 0), range: r, withTemplate: "")

        if number.count > 10 {
            let tenthDigitIndex = number.index(number.startIndex, offsetBy: 10)
            number = String(number[number.startIndex..<tenthDigitIndex])
        }

        if shouldRemoveLastDigit {
            let end = number.index(number.startIndex, offsetBy: number.count-1)
            number = String(number[number.startIndex..<end])
        }

        if number.count < 7 {
            let end = number.index(number.startIndex, offsetBy: number.count)
            let range = number.startIndex..<end
            number = number.replacingOccurrences(of: "(\\d{3})(\\d+)", with: "($1) $2", options: .regularExpression, range: range)

        } else {
            let end = number.index(number.startIndex, offsetBy: number.count)
            let range = number.startIndex..<end
            number = number.replacingOccurrences(of: "(\\d{3})(\\d{3})(\\d+)", with: "($1) $2-$3", options: .regularExpression, range: range)
        }

        return number
    }

}
