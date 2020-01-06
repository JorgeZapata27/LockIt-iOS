//
//  LoginController.swift
//  LockItPasswordData
//
//  Created by JJ Zapata on 12/18/19.
//  Copyright © 2019 JJ Zapata. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import AuthenticationServices

class LLoginController : UIViewController, UITextFieldDelegate {

        // MARK: - Properties

        let logoImageView: UIImageView = {
            let iv = UIImageView()
            iv.contentMode = .scaleAspectFit
            iv.clipsToBounds = true
            iv.image = UIImage(named: "LockItLogoClear")
            return iv
        }()
        
        lazy var emailContainerView: UIView = {
            let view = UIView()
            return view.textContainerViewE(view: view, emailTextField)
        }()

        lazy var passwordContainerView: UIView = {
            let view = UIView()
            return view.textContainerViewP(view: view, passwordTextField)
        }()

        lazy var emailTextField: UITextField = {
            let tf = UITextField()
            tf.placeholder = "Email"
            tf.isSecureTextEntry = false
            return tf
        }()

        lazy var passwordTextField: UITextField = {
            let tf = UITextField()
            tf.placeholder = "Password"
            tf.isSecureTextEntry = true
            return tf
        }()

        let loginButton: UIButton = {
            let button = UIButton(type: .system)
            button.setTitle("LOG IN", for: .normal)
            button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
            button.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
            button.layer.cornerRadius = 5
            return button
        }()

        let dontHaveAccountButton: UIButton = {
            let button = UIButton(type: .system)
            button.addTarget(self, action: #selector(handleShowSignUp), for: .touchUpInside)
            return button
        }()
    
        lazy var dividerView: UIView = {
            let dividerView = UIView()
            
            let label = UILabel()
            label.text = "OR"
            label.textColor = UIColor(white: 1, alpha: 0.88)
            label.font = UIFont.systemFont(ofSize: 14)
            dividerView.addSubview(label)
            label.translatesAutoresizingMaskIntoConstraints = false
            label.centerYAnchor.constraint(equalTo: dividerView.centerYAnchor).isActive = true
            label.centerXAnchor.constraint(equalTo: dividerView.centerXAnchor).isActive = true
            
            let separator1 = UIView()
            separator1.backgroundColor = UIColor(white: 1, alpha: 0.88)
            dividerView.addSubview(separator1)
            separator1.anchor(top: nil, left: dividerView.leftAnchor, bottom: nil, right: label.leftAnchor, paddingTop: 0, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 1.0)
            separator1.centerYAnchor.constraint(equalTo: dividerView.centerYAnchor).isActive = true
            
            let separator2 = UIView()
            separator2.backgroundColor = UIColor(white: 1, alpha: 0.88)
            dividerView.addSubview(separator2)
            separator2.anchor(top: nil, left: label.rightAnchor, bottom: nil, right: dividerView.rightAnchor, paddingTop: 0, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 1.0)
            separator2.centerYAnchor.constraint(equalTo: dividerView.centerYAnchor).isActive = true
            
            return dividerView
        }()
        
        let appleLoginButton: ASAuthorizationAppleIDButton = {
            let button = ASAuthorizationAppleIDButton()
            button.addTarget(self, action: #selector(appletouch), for: .touchUpInside)
            return button
        }()
    
    let advance : UIButton = {
        let btn = UIButton()
        btn.setTitle("Advance", for: .normal)
        btn.addTarget(self, action: #selector(advance111), for: .touchUpInside)
        return btn
    }()

        // MARK: - Init

        override func viewDidLoad() {
            super.viewDidLoad()

            // Functions To Throw
            darknlight()
            configureViewComponents()

        }

        override func viewDidAppear(_ animated: Bool) {
          super.viewDidAppear(animated)
          if let user = Auth.auth().currentUser {
            print("User Auth Auto Success")
            guard let navController = UIApplication.shared.keyWindow?.rootViewController as? UINavigationController else { return }
            guard let controller = navController.viewControllers[0] as? LHomeController else { return }
            controller.configureNavigationBar()
            self.present(LHomeController(), animated: true, completion: nil)
          }
            
          darknlight()
            
        }
    
        func darknlight() {
            if self.traitCollection.userInterfaceStyle == .dark {
                // Email Text Field
                emailTextField.tintColor = .white
                emailTextField.textColor = .white
                emailTextField.attributedPlaceholder = NSAttributedString(string: "Email", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor.white])
                
                // Password Text Field
                passwordTextField.tintColor = .white
                passwordTextField.textColor = .white
                passwordTextField.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor.white])
                
                // Login Button
                loginButton.setTitleColor(UIColor.secondarySystemBackground, for: .normal)
                loginButton.backgroundColor = UIColor.darkGray
                
                // Don't Have An Account Button
                let attributedTitle = NSMutableAttributedString(string: "Don't have an account?  ", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor.lightGray])
                attributedTitle.append(NSAttributedString(string: "Sign Up", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor.lightGray]))
                dontHaveAccountButton.setAttributedTitle(attributedTitle, for: .normal)
            } else {
                
                // Email Text Field
                emailTextField.tintColor = .black
                emailTextField.textColor = .black
                emailTextField.attributedPlaceholder = NSAttributedString(string: "Email", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor.black])
                
                // Password Text Field
                passwordTextField.tintColor = .black
                passwordTextField.textColor = .black
                passwordTextField.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor.black])
                
                // Login Button
                loginButton.setTitleColor(UIColor.darkGray, for: .normal)
                loginButton.backgroundColor = UIColor.secondarySystemBackground
                
                // Don't Have An Account Button
                let attributedTitle = NSMutableAttributedString(string: "Don't have an account?  ", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor.darkGray])
                attributedTitle.append(NSAttributedString(string: "Sign Up", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor.darkGray]))
                dontHaveAccountButton.setAttributedTitle(attributedTitle, for: .normal)
            }
        }

        // MARK: - Selectors

        @objc func handleLogin() {
            guard let email = emailTextField.text else { return }
            guard let password = passwordTextField.text else { return }
            if email == "" || password == "" {
              let alertController = UIAlertController(title: "Error Signing In Account", message: "Your Request Was Denied Because One Of Your Text Fields Was Left Clear", preferredStyle: .alert)
              let okay = UIAlertAction(title: "Okay", style: .default, handler: nil)
              alertController.addAction(okay)
              self.present(alertController, animated: true, completion: nil)
            } else {
              Auth.auth().signIn(withEmail: email, password: password) { user, error in
                if error == nil && user != nil {
                  print("Sign In Complete")
//                  guard let navController = UIApplication.shared.keyWindow?.rootViewController as? UINavigationController else { return }
//                  guard let controller = navController.viewControllers[0] as? LHomeController else { return }
//                  controller.configureNavigationBar()
//                  self.navigationController?.pushViewController(controller, animated: true)
//                    self.present(LHomeController(), animated: true, completion: nil)
                    self.navigationController?.pushViewController(LHomeController(), animated: true)
                } else {
                  let alertController = UIAlertController(title: "Error Signing In Account", message: "Your Request Was Denied. \(error!.localizedDescription)", preferredStyle: .alert)
                  let okay = UIAlertAction(title: "Okay", style: .default, handler: nil)
                  alertController.addAction(okay)
                  self.present(alertController, animated: true, completion: nil)
                }
              }
            }
        }

        @objc func handleShowSignUp() {
            navigationController?.pushViewController(LSignUpController(), animated: true)
            print("Sign Up")
        }
    
        @objc func appletouch() {
            let request = ASAuthorizationAppleIDProvider().createRequest()
            request.requestedScopes = [.fullName, .email]
            let controller = ASAuthorizationController(authorizationRequests: [request])
//            controller.delegate = self
//            controller.presentationContextProvider = self
            controller.performRequests()
        }
    
    @objc func advance111() {
        navigationController?.pushViewController(LSettingsController(), animated: true)
    }

        // MARK: - API

        func logUserIn(withEmail email: String, password: String) {
            print("Login Pressed")
            print("This Is From Previous. Don't Use This. ")
//            Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
//
//                if let error = error {
//                    print("Failed to sign user in with error: ", error.localizedDescription)
//                    return
//                }
//
//                guard let navController = UIApplication.shared.keyWindow?.rootViewController as? UINavigationController else { return }
//                guard let controller = navController.viewControllers[0] as? HomeController else { return }
//                controller.configureViewComponents()
//
//                // forgot to add this in video
//                controller.loadUserData()
//
//                self.dismiss(animated: true, completion: nil)
//            }
        }

        // MARK: - Helper Functions

        func configureViewComponents() {
            view.backgroundColor = UIColor.systemBackground
            navigationController?.navigationBar.isHidden = true
            emailTextField.delegate = self
            passwordTextField.delegate = self
            
            view.addSubview(advance)
            advance.anchor(top: view.topAnchor, left: nil, bottom: nil, right: nil, paddingTop: 10, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 150, height: 40)
            advance.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

            view.addSubview(logoImageView)
            logoImageView.anchor(top: advance.bottomAnchor, left: nil, bottom: nil, right: nil, paddingTop: 10, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 150, height: 150)
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

            view.addSubview(emailContainerView)
            emailContainerView.anchor(top: logoImageView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 24, paddingLeft: 32, paddingBottom: 0, paddingRight: 32, width: 0, height: 50)

            view.addSubview(passwordContainerView)
            passwordContainerView.anchor(top: emailContainerView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 16, paddingLeft: 32, paddingBottom: 0, paddingRight: 32, width: 0, height: 50)

            view.addSubview(loginButton)
            loginButton.anchor(top: passwordContainerView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 24, paddingLeft: 32, paddingBottom: 0, paddingRight: 32, width: 0, height: 50)

            view.addSubview(dividerView)
            dividerView.anchor(top: loginButton.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 24, paddingLeft: 32, paddingBottom: 0, paddingRight: 32, width: 0, height: 50)
            
            view.addSubview(appleLoginButton)
            appleLoginButton.anchor(top: dividerView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 24, paddingLeft: 32, paddingBottom: 0, paddingRight: 32, width: 0, height: 50)

            view.addSubview(dontHaveAccountButton)
            dontHaveAccountButton.anchor(top: nil, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 32, paddingBottom: 12, paddingRight: 32, width: 0, height: 50)
    }

    // MARK: - Other
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        darknlight()
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
