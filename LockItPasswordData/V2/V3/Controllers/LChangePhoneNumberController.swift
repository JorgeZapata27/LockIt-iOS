//
//  LChangePhoneNumberController.swift
//  LockItPasswordData
//
//  Created by JJ Zapata on 1/12/20.
//  Copyright © 2020 JJ Zapata. All rights reserved.
//

import UIKit

class LChangePhoneNumberController : UIViewController, UITextFieldDelegate {

  let accountNameTF : UITextField = {
    let tf = UITextField()
    tf.placeholder = "Phone Number"
    tf.text = "+49 (171) 496 - 4250"
    tf.textColor = .label
    tf.backgroundColor = .systemBackground
    tf.keyboardType = .decimalPad
    tf.tintColor = .yellow
    tf.clearButtonMode = UITextField.ViewMode.always
    tf.translatesAutoresizingMaskIntoConstraints = false
    return tf
  }()

  let loginButton: UIButton = {
      let button = UIButton(type: .system)
      button.setTitle("Change", for: .normal)
      button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
      button.addTarget(self, action: #selector(change), for: .touchUpInside)
      button.tintColor = .systemYellow
      button.setTitleColor(.systemYellow, for: .normal)
      button.layer.cornerRadius = 5
      return button
  }()

  override func viewDidLoad() {
    super.viewDidLoad()
    
    accountNameTF.delegate = self

    // Functions To Throw
    confugreUI()

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
          //
          self.navigationController?.popViewController(animated: true)
      }
  }

  
}
