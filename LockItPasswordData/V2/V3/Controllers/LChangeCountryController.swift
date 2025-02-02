//
//  LChangeCountryController.swift
//  LockItPasswordData
//
//  Created by JJ Zapata on 1/12/20.
//  Copyright © 2020 JJ Zapata. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase
import FirebaseAnalytics

class LChangeCountryController : UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
      
  var LpickerView = UIPickerView()
  var countries: [String] = []

  let accountNameTF : UITextField = {
    let tf = UITextField()
    tf.textColor = .label
    tf.backgroundColor = .systemBackground
    tf.tintColor = .yellow
    tf.clearButtonMode = UITextField.ViewMode.always
    tf.translatesAutoresizingMaskIntoConstraints = false
    return tf
  }()

  let loginButton: UIButton = {
      let button = UIButton(type: .system)
      button.setTitle("Change", for: .normal)
      button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
      button.tintColor = .systemYellow
      button.setTitleColor(.systemYellow, for: .normal)
      button.addTarget(self, action: #selector(change), for: .touchUpInside)
      button.layer.cornerRadius = 5
      return button
  }()

  override func viewDidLoad() {
    super.viewDidLoad()
    
    for code in NSLocale.isoCountryCodes  {
        let id = NSLocale.localeIdentifier(fromComponents: [NSLocale.Key.countryCode.rawValue: code])
        let name = NSLocale(localeIdentifier: "en_UK").displayName(forKey: NSLocale.Key.identifier, value: id) ?? "Country not found for code: \(code)"
        countries.append(name)
    }
    print(countries)
    
    accountNameTF.inputView = LpickerView
    LpickerView.delegate = self
    LpickerView.dataSource = self
    
    Firebase()

    // Functions To Throw
    confugreUI()

  }

  func confugreUI() {
    view.backgroundColor = UIColor.systemBackground

    view.addSubview(accountNameTF)
    accountNameTF.topAnchor.constraint(equalTo: view.topAnchor, constant: 200).isActive = true
    accountNameTF.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
    accountNameTF.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 30).isActive = true
    accountNameTF.heightAnchor.constraint(equalToConstant: 63).isActive = true

    view.addSubview(loginButton)
    loginButton.anchor(top: accountNameTF.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 10, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 120, height: 30)
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
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return countries.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return countries[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        accountNameTF.text = countries[row]
    }
    
    @objc func change() {
        if accountNameTF.text != "" {
            let uid = Auth.auth().currentUser!.uid
            Database.database().reference().child("Users").child(uid).child("Country").setValue(accountNameTF.text!)
            let alertController = UIAlertController(title: "Success", message: "", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Okay", style: .cancel, handler: { (alert) in
                self.navigationController?.popViewController(animated: true)
            }))
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
    func Firebase() {
        let uid = Auth.auth().currentUser!.uid
        print(uid)
        Database.database().reference().child("Users").child(uid).child("Country").observe(.value, with: { (data) in
            let name : String = (data.value as? String)!
            self.accountNameTF.text = name
            debugPrint(name)
        })
    }

  
}
