//
//  LChangeEmailController.swift
//  LockItPasswordData
//
//  Created by JJ Zapata on 1/11/20.
//  Copyright © 2020 JJ Zapata. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

class LChangeEmailControllerrrr : UIViewController {

  let accountNameTF : UITextField = {
    let tf = UITextField()
    tf.placeholder = "Email"
    tf.textColor = .label
    tf.backgroundColor = .systemBackground
    tf.tintColor = .yellow
    tf.clearButtonMode = UITextField.ViewMode.always
    tf.keyboardType = .emailAddress
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

    // Functions To Throw
    confugreUI()
    
    Firebase()

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
  
  @objc func change() {
      if accountNameTF.text != "" {
          let uid = Auth.auth().currentUser!.uid
          Database.database().reference().child("Users").child(uid).child("email").setValue(accountNameTF.text!)
          let currentUser = Auth.auth().currentUser

            currentUser?.updateEmail(to: accountNameTF.text!) { error in
                if let error = error {
                    print(error)
                    let alertController = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
                    alertController.addAction(UIAlertAction(title: "Okay", style: .cancel, handler: { (alert) in
                        self.navigationController?.popViewController(animated: true)
                    }))
                    self.present(alertController, animated: true, completion: nil)
                } else {
                    let alertController = UIAlertController(title: "Success", message: "", preferredStyle: .alert)
                    alertController.addAction(UIAlertAction(title: "Okay", style: .cancel, handler: { (alert) in
                        self.navigationController?.popViewController(animated: true)
                    }))
                    self.present(alertController, animated: true, completion: nil)
                }
            }
      }
  }
  
  func Firebase() {
      let uid = Auth.auth().currentUser!.uid
      Database.database().reference().child("Users").child(uid).child("email").observe(.value, with: { (data) in
          let name : String = (data.value as? String)!
          self.accountNameTF.text = name
          debugPrint(name)
      })
  }

  
}
