//
//  LChangeEmailController.swift
//  LockItPasswordData
//
//  Created by JJ Zapata on 1/11/20.
//  Copyright © 2020 JJ Zapata. All rights reserved.
//

import UIKit

class LChangeEmailControllerrrr : UIViewController {

  let changeTextField : UITextField = {
    let tf = UITextField()
    tf.tintColor = UIColor.systemYellow
    tf.keyboardType = UIKeyboardType.emailAddress
    tf.placeholder = "New Email"
    tf.text = "jorgejaden@gmail.com"
    tf.clearButtonMode = .whileEditing
    return tf
  }()

  let changeButton : UIButton = {
    let btn = UIButton()
    btn.backgroundColor = UIColor.systemYellow
    btn.setTitle("Change", for: .normal)
    btn.setTitleColor(UIColor.systemBackground, for: .normal)
//    btn.addTarget(self, action: #selector(), for: .touchUpInside)
    return btn
  }()

  override func viewDidLoad() {
    super.viewDidLoad()

    // Functions To Throw
    confugreUI()

  }

  func confugreUI() {
    view.backgroundColor = UIColor.green
    
    view.addSubview(changeTextField)
    changeTextField.heightAnchor.constraint(equalToConstant: 45).isActive = true
    changeTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
    changeTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 20).isActive = true
    changeTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    changeTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true

    view.addSubview(changeButton)
    changeButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
    changeButton.topAnchor.constraint(equalTo: changeTextField.bottomAnchor, constant: 20).isActive = true
    changeButton.widthAnchor.constraint(equalToConstant: 90).isActive = true
    changeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
  }
  
}
