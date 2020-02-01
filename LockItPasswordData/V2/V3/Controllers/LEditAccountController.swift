//
//  LEditAccountController.swift
//  LockItPasswordData
//
//  Created by JJ Zapata on 1/30/20.
//  Copyright © 2020 JJ Zapata. All rights reserved.
//

import UIKit

class LEditAccountController: UIViewController, UITextFieldDelegate {
    
     let imageView : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Instagram")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 15
        imageView.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let accountUsernameTF : UITextField = {
        let username = UITextField()
        username.backgroundColor = .systemBackground
        username.placeholder = "Username"
        username.textColor = UIColor.label
        username.translatesAutoresizingMaskIntoConstraints = false
        username.font = UIFont.systemFont(ofSize: 16)
        return username
    }()
    
    let accountPasswordTF : UITextField = {
        let password = UITextField()
        password.backgroundColor = .systemBackground
        password.placeholder = "Password"
        password.textColor = UIColor.label
        password.translatesAutoresizingMaskIntoConstraints = false
        password.font = UIFont.systemFont(ofSize: 16)
        return password
    }()
    
    let updateBtn : UIButton = {
        let button = UIButton()
        button.setTitleColor(.systemBackground, for: .normal)
        button.setTitle("Update", for: .normal)
        button.backgroundColor = .systemYellow
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = button.frame.height / 2
        button.addTarget(self, action: #selector(addTapped), for: .touchUpInside)
        return button
    }()
    
    let usernamePlaceholder : UILabel = {
        let label = UILabel()
        label.text = "Username"
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .label
        return label
    }()
    
    let paswordPlaceholder : UILabel = {
        let label = UILabel()
        label.text = "Password"
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let username : UILabel = {
        let label = UILabel()
        label.textColor = .systemGray
        label.text = "Jorge"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let password : UILabel = {
        let label = UILabel()
        label.textColor = .systemGray
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Zapata"
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        let items = ["Retrieve", "Update"]
        let customSC = UISegmentedControl(items: items)
        customSC.selectedSegmentIndex = 0
        let frame = UIScreen.main.bounds
        customSC.frame = CGRect(x: (frame.width / 2 - 100), y: 150, width: 200, height: 35)
        customSC.layer.cornerRadius = 5.0  // Don't let background bleed
        customSC.backgroundColor = .systemBackground
        customSC.tintColor = .darkGray
        customSC.addTarget(self, action: #selector(changeColor(sender:)), for: .valueChanged)
        self.view.addSubview(customSC)
        self.view.addSubview(imageView)
        self.imageView.topAnchor.constraint(equalTo: customSC.bottomAnchor, constant: 35).isActive = true
        self.imageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        self.imageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        self.imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        self.view.addSubview(accountUsernameTF)
        self.accountUsernameTF.alpha = 0
        self.accountUsernameTF.delegate = self
        self.accountUsernameTF.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 35).isActive = true
        self.accountUsernameTF.widthAnchor.constraint(equalToConstant: 200).isActive = true
        self.accountUsernameTF.heightAnchor.constraint(equalToConstant: 45).isActive = true
        self.accountUsernameTF.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        self.view.addSubview(accountPasswordTF)
        self.accountPasswordTF.alpha = 0
        self.accountPasswordTF.delegate = self
        self.accountPasswordTF.topAnchor.constraint(equalTo: accountUsernameTF.bottomAnchor, constant: 5).isActive = true
        self.accountPasswordTF.widthAnchor.constraint(equalToConstant: 200).isActive = true
        self.accountPasswordTF.heightAnchor.constraint(equalToConstant: 45).isActive = true
        self.accountPasswordTF.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        self.view.addSubview(updateBtn)
        self.updateBtn.topAnchor.constraint(equalTo: accountPasswordTF.bottomAnchor, constant: 35).isActive = true
        self.updateBtn.widthAnchor.constraint(equalToConstant: 150).isActive = true
        self.updateBtn.heightAnchor.constraint(equalToConstant: 40).isActive = true
        self.updateBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        self.updateBtn.layer.cornerRadius = self.updateBtn.frame.height / 2
        self.updateBtn.alpha = 0
        self.view.addSubview(usernamePlaceholder)
        self.usernamePlaceholder.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 35).isActive = true
        self.usernamePlaceholder.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50).isActive = true
        self.usernamePlaceholder.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 50).isActive = true
        self.usernamePlaceholder.heightAnchor.constraint(equalToConstant: 40).isActive = true
        self.view.addSubview(username)
        self.username.topAnchor.constraint(equalTo: usernamePlaceholder.bottomAnchor, constant: -10).isActive = true
        self.username.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50).isActive = true
        self.username.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 50).isActive = true
        self.username.heightAnchor.constraint(equalToConstant: 40).isActive = true
        self.view.addSubview(paswordPlaceholder)
        self.paswordPlaceholder.topAnchor.constraint(equalTo: username.bottomAnchor, constant: 35).isActive = true
        self.paswordPlaceholder.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50).isActive = true
        self.paswordPlaceholder.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 50).isActive = true
        self.paswordPlaceholder.heightAnchor.constraint(equalToConstant: 40).isActive = true
        self.view.addSubview(password)
        self.password.topAnchor.constraint(equalTo: paswordPlaceholder.bottomAnchor, constant: -10).isActive = true
        self.password.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50).isActive = true
        self.password.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 50).isActive = true
        self.password.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    @objc func changeColor(sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 1:
            print("Update")
            UIView.animate(withDuration: 0.25) {
                // DISSAPEAR
                self.usernamePlaceholder.alpha = 0
                self.username.alpha = 0
                self.paswordPlaceholder.alpha = 0
                self.password.alpha = 0
            }
            UIView.animate(withDuration: 0.25, delay: 0.25, options: .curveEaseInOut, animations: {
                // APPEAR
                self.accountUsernameTF.alpha = 1
                self.accountPasswordTF.alpha = 1
                self.updateBtn.alpha = 1
            }, completion: nil)
        case 0:
            print("Retrieve")
            UIView.animate(withDuration: 0.25) {
                // DISSAPEAR
                self.accountUsernameTF.alpha = 0
                self.accountPasswordTF.alpha = 0
                self.updateBtn.alpha = 0
            }
            UIView.animate(withDuration: 0.25, delay: 0.25, options: .curveEaseInOut, animations: {
                // APPEAR
                self.usernamePlaceholder.alpha = 1
                self.username.alpha = 1
                self.paswordPlaceholder.alpha = 1
                self.password.alpha = 1
            }, completion: nil)
        default:
            print("Other")
        }
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
    
    @objc func addTapped() {
        print("UPDATE")
        let alert = UIAlertController(title: "Success", message: "Your Account Has Been Updated", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: { (action) in
            self.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
