//
//  LSignUpController.swift
//  LockItPasswordData
//
//  Created by JJ Zapata on 12/18/19.
//  Copyright © 2019 JJ Zapata. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import SVProgressHUD
import FirebaseStorage
import AuthenticationServices

class LSignUpController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate {

    // MARK: - Variables

    var imagePicker : UIImagePickerController!
    var image : UIImage? = nil

    // MARK: - Properties

    let logoImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.image = UIImage(named: "jorge.png")
        iv.layer.cornerRadius = 5
        iv.layer.masksToBounds = true
        return iv
    }()
    
    let button: UIButton = {
        let btn = UIButton()
        btn.setTitle("Add Image", for: .normal)
        btn.setTitleColor(UIColor.systemYellow, for: .normal)
        btn.addTarget(self, action: #selector(openImagePicker), for: .touchUpInside)
        return btn
    }()

    lazy var emailContainerView : UIView = {
        let view = UIView()
        return view.textContainerViewE(view: view, emailTextField)
    }()

    lazy var usernameContainerView : UIView = {
        let view = UIView()
        return view.textContainerViewU(view: view, usernameTextField)
    }()

    lazy var passwordContainerView : UIView = {
        let view = UIView()
        return view.textContainerViewP(view: view, passwordTextField)
    }()

    lazy var emailTextField : UITextField = {
        let tf = UITextField()
        tf.tintColor = UIColor.secondarySystemBackground
        tf.textContentType = .emailAddress
        return tf.textField(withPlaceolder: "Email", isSecureTextEntry: false)
    }()

    lazy var usernameTextField: UITextField = {
        let tf = UITextField()
        tf.tintColor = UIColor.secondarySystemBackground
        tf.textContentType = .username
        return tf.textField(withPlaceolder: "Username", isSecureTextEntry: false)
    }()

    lazy var passwordTextField: UITextField = {
        let tf = UITextField()
        tf.tintColor = UIColor.secondarySystemBackground
        tf.textContentType = .password
        return tf.textField(withPlaceolder: "Password", isSecureTextEntry: true)
    }()


    let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("SIGN UP", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.setTitleColor(UIColor.secondarySystemBackground, for: .normal)
        button.backgroundColor = UIColor.darkGray
        button.addTarget(self, action: #selector(handleSignUp), for: .touchUpInside)
        button.layer.cornerRadius = 5
        return button
    }()

    let dontHaveAccountButton: UIButton = {
        let button = UIButton(type: .system)
        let attributedTitle = NSMutableAttributedString(string: "Already have an account?  ", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        attributedTitle.append(NSAttributedString(string: "Sign In", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor.lightGray]))
        button.setAttributedTitle(attributedTitle, for: .normal)
        button.addTarget(self, action: #selector(handleShowLogin), for: .touchUpInside)
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
    
    let googleLoginButton: UIButton = {
        let button = UIButton(type: .system)
        button.layer.cornerRadius = 5
        button.setTitle("Sign In with Google", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.backgroundColor = .googleRed()
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(handleGoogleSignIn), for: .touchUpInside)
        return button
    }()
    
    @objc func handleGoogleSignIn() {
        
    }

    // MARK: - Init

    override func viewDidLoad() {
        super.viewDidLoad()

        // Functions To Throw
        darknlight()
        configureViewComponents()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        darknlight()
    }
    
        func darknlight() {
            if self.traitCollection.userInterfaceStyle == .dark {
                // Image Button
                button.setTitleColor(.white, for: .normal)
                
                // Email Text Field
                emailTextField.tintColor = .white
                emailTextField.textColor = .white
                emailTextField.attributedPlaceholder = NSAttributedString(string: "Email", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor.white])
                
                // Name Text Field
                usernameTextField.tintColor = .white
                usernameTextField.textColor = .white
                usernameTextField.attributedPlaceholder = NSAttributedString(string: "Name", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor.white])
                
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
                // Image Button
                button.setTitleColor(.black, for: .normal)
                
                // Email Text Field
                emailTextField.tintColor = .black
                emailTextField.textColor = .black
                emailTextField.attributedPlaceholder = NSAttributedString(string: "Email", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor.black])
                
                // Name Text Field
                usernameTextField.tintColor = .black
                usernameTextField.textColor = .black
                usernameTextField.attributedPlaceholder = NSAttributedString(string: "Name", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor.black])
                
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

    @objc func handleSignUp() {
        SVProgressHUD.show(withStatus: "Working...")
        guard let email = emailTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        guard let username = usernameTextField.text else { return }
        guard let image = logoImageView.image else { return }
        guard let imageData = logoImageView.image?.jpegData(compressionQuality: 0.75) else { return }

        if email == "" || password == "" || username == "" {
          let alertController = UIAlertController(title: "Error Creating Account", message: "Your Request Was Denied Because One Of Your Text Fields Was Left Clear", preferredStyle: .alert)
          let okay = UIAlertAction(title: "Okay", style: .default, handler: nil)
          alertController.addAction(okay)
          self.present(alertController, animated: true, completion: nil)
        } else {
          Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
            if error == nil && user != nil {
                print("lksadjfdalskjfals;dfjkas;ldfjkalsdkj")
                var dict : Dictionary<String, Any> = [
                    "uid" : Auth.auth().currentUser?.uid,
                    "email" : Auth.auth().currentUser?.email,
                    "profileImageURL" : "",
                    "name" : self.usernameTextField.text!,
                    "Country" : "Unknown",
                    "phoneNumber" : "Unknown"
                ]
                let storageRef = Storage.storage().reference(forURL: "gs://fir-demo-2c741.appspot.com")
                let storageProfileRef = storageRef.child("Profile").child(Auth.auth().currentUser!.uid)
                let metadata = StorageMetadata()
                metadata.contentType = "image/jpg"
                storageProfileRef.putData(imageData, metadata: metadata) { (storageMetadata, errir) in
                    if error != nil {
                        print(error?.localizedDescription)
                        return
                    }
                    storageProfileRef.downloadURL { (url, error) in
                        if let metaImageURL = url?.absoluteString {
                            print(metaImageURL)
                            dict["profileImageURL"] = metaImageURL

                            Database.database().reference().child("Users").child((user?.user.uid)!).updateChildValues(dict) { (error, ref) in
                                if error == nil {
                                    print("Done. ")
                                    UserDefaults.standard.set(true, forKey: "BoolForUserDefaults")
                                    SVProgressHUD.dismiss()
                                    self.navigationController?.pushViewController(LHomeController(), animated: true)
                                }
                            }
                        }
                    }
                }
            }
          }
        }
    }
    
    @objc func openImagePicker() {
        self.present(imagePicker, animated: true, completion: nil)
    }

    @objc func handleShowLogin() {
        present(LLoginController(), animated: true, completion: nil)
    }
        
            @objc func appletouch() {
                let request = ASAuthorizationAppleIDProvider().createRequest()
                request.requestedScopes = [.fullName, .email]
                let controller = ASAuthorizationController(authorizationRequests: [request])
    //            controller.delegate = self
    //            controller.presentationContextProvider = self
                controller.performRequests()
            }

    // MARK: - API

    func createUser(withEmail email: String, password: String, username: String) {
        print("SIGNED UP")
//        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
//
//            if let error = error {
//                print("Failed to sign user up with error: ", error.localizedDescription)
//                return
//            }
//
//            guard let uid = result?.user.uid else { return }
//
//            let values = ["email": email, "username": username]
//
//            Database.database().reference().child("users").child(uid).updateChildValues(values, withCompletionBlock: { (error, ref) in
//                if let error = error {
//                    print("Failed to update database values with error: ", error.localizedDescription)
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
//            })
//
//        }

    }

    // MARK: - Helper Functions

    func configureViewComponents() {
        view.backgroundColor = UIColor.systemBackground
        navigationController?.navigationBar.isHidden = true

        imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = true
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self

        view.addSubview(logoImageView)
        logoImageView.anchor(top: view.topAnchor, left: nil, bottom: nil, right: nil, paddingTop: 60, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 150, height: 150)
        logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.addSubview(button)
        button.anchor(top: logoImageView.bottomAnchor, left: nil, bottom: nil, right: nil, paddingTop: 5, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 150, height: 50)
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

        view.addSubview(emailContainerView)
        emailContainerView.anchor(top: button.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 20, paddingLeft: 32, paddingBottom: 0, paddingRight: 32, width: 0, height: 50)

        view.addSubview(usernameContainerView)
        usernameContainerView.anchor(top: emailContainerView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 16, paddingLeft: 32, paddingBottom: 0, paddingRight: 32, width: 0, height: 50)

        view.addSubview(passwordContainerView)
        passwordContainerView.anchor(top: usernameContainerView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 16, paddingLeft: 32, paddingBottom: 0, paddingRight: 32, width: 0, height: 50)

        view.addSubview(loginButton)
        loginButton.anchor(top: passwordContainerView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 24, paddingLeft: 32, paddingBottom: 0, paddingRight: 32, width: 0, height: 50)

        view.addSubview(dontHaveAccountButton)
        dontHaveAccountButton.anchor(top: nil, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 32, paddingBottom: 12, paddingRight: 32, width: 0, height: 50)
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
      picker.dismiss(animated: true, completion: nil)
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info : [UIImagePickerController.InfoKey : Any]) {
      if let editedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
        self.image = editedImage
        self.logoImageView.image = editedImage
      } else if let originalImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
        self.image = originalImage
        self.logoImageView.image = originalImage
      }
      dismiss(animated: true, completion: nil)
    }
    
    func uploadProfileImage(_ image : UIImage, completion: @escaping ((_ url : URL?) -> ())) {
      guard let uid = Auth.auth().currentUser?.uid else { return }
      let storageRef = Storage.storage().reference().child("\(uid)")
      guard let imageData = image.jpegData(compressionQuality: 0.75) else { return }
      let metaData = StorageMetadata()
      metaData.contentType = "img/jpg"
      storageRef.putData(imageData, metadata: metaData) { metaData, error in
        if error == nil, metaData != nil {
          // Success
          print("good")
        } else {
          // Fail
          print("bad")
          //completion(nil)
        }
      }
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
    
    func LoadingTheInformationLoader() {
        SVProgressHUD.show(withStatus: "Working...")
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            SVProgressHUD.dismiss()
        }
    }
}
