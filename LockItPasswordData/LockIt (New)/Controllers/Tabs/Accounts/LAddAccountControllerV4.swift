//
//  LAddAccountControllerV4.swift
//  LockItPasswordData
//
//  Created by JJ Zapata on 3/29/20.
//  Copyright © 2020 JJ Zapata. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import SVProgressHUD
import FirebaseStorage
import FirebaseDatabase
import Foundation
import GoogleMobileAds

class LAddAccountControllerV4: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate {
    
    @IBOutlet var appIconImageView : UIImageView!
    @IBOutlet var accountNameTF : UITextField!
    @IBOutlet var accountUsernameTF : UITextField!
    @IBOutlet var accountPasswordTF : UITextField!
    
    var imageSelected = false

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.accountNameTF.delegate = self
        self.accountUsernameTF.delegate = self
        self.accountPasswordTF.delegate = self
        
        let vaar = MyVariables.account
        if vaar != "nil" {
            print(MyVariables.account)
        }

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let account = MyVariables.account
        if account != "nil" {
            print(MyVariables.account)
        }
        let date = Date().addingTimeInterval(1.5)
        let timer = Timer(fireAt: date, interval: 0, target: self, selector: #selector(self.runCode), userInfo: nil, repeats: true)
        RunLoop.main.add(timer, forMode: .common)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let account = MyVariables.account
        if account != "nil" {
            print(MyVariables.account)
            appIconImageView.image = UIImage(named: account)
        }
    }
    
    @objc func runCode() {
        let account = MyVariables.account
        if account != "nil" {
            print(MyVariables.account)
            appIconImageView.image = UIImage(named: account)
        }
    }
    
    @IBAction func addButtonPressed(_ sender: UIButton) {
        if self.accountNameTF.text! == "" || self.accountUsernameTF.text! == "" || self.accountPasswordTF.text! == "" {
            let alertController = UIAlertController(title: "Error", message: "One Or More Text Fields Were Left Empty", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Okay", style: .default, handler: { (action) in
                print("Okay")
            }))
            self.present(alertController, animated: true, completion: nil)
        } else {
            if MyVariables.imageFromCustomIcons == true || imageSelected == true {
                SVProgressHUD.show(withStatus: "Working...")
                let uid = Auth.auth().currentUser!.uid
                    let ref = Database.database().reference()
                    let key = ref.child("Posts").childByAutoId().key
                    let data = self.appIconImageView.image!.jpegData(compressionQuality: 0.9)
                    let imageName = NSUUID().uuidString
                    let Storageref = Storage.storage().reference().child("post_images").child("\(imageName).jpg")
                    if let uploadData = data {
                        Storageref.putData(uploadData, metadata: nil) { (metadata, error) in
                            if error != nil{
                                print("Failed to upload image:", error as Any)
                                return
                            }
                            print(Storageref.downloadURL(completion: { (url, err) in
                                if err != nil{
                                    print(err as Any)
                                    return
                                }
                                print("Good")
                                    if let imageUrl = url?.absoluteString {
                                        print(imageUrl)
                                                    let values = [
                                                        "postID" : key!,
                                                        "account-Name" : "\(self.accountNameTF.text!)",
                                                        "account-Username" : "\(self.accountUsernameTF.text!)",
                                                        "account-Password" : "\(self.accountPasswordTF.text!)",
                                                        "account-ImageUrl" : imageUrl] as [String : Any]
                                                    let postFeed = ["\(key!)" : values]
                                                    ref.child("Users").child(uid).child("My_Accounts").updateChildValues(postFeed)
                                        let alertController = UIAlertController(title: "Success", message: "Your Account Was Added", preferredStyle: .alert)
                                        alertController.addAction(UIAlertAction(title: "Okay", style: .default, handler: { (action) in
                                            MyVariables.account = "nil"
                                            print(MyVariables.account)
                                            SVProgressHUD.dismiss()
                                            self.navigationController?.popViewController(animated: true)
                                        }))
                                        self.present(alertController, animated: true, completion: nil)
                                    }
                            }))
                        }
                }
            } else {
                let alertController = UIAlertController(title: "Wait!", message: "You Haven't Selected A Photo For Your Account! Would You Still Like To Advance?", preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "Advance", style: .destructive, handler: { (action) in
                    print("Okay")
                    alertController.dismiss(animated: true, completion: nil)
                    SVProgressHUD.show(withStatus: "Working...")
                    let uid = Auth.auth().currentUser!.uid
                        let ref = Database.database().reference()
                        let storage = Storage.storage().reference()
                        let key = ref.child("Posts").childByAutoId().key
                        let imageRef = storage.child("Posts").child(uid).child("\(key).jpg")
                        let data = self.appIconImageView.image!.jpegData(compressionQuality: 0.9)
                        let userID = Auth.auth().currentUser!.uid
                    Database.database().reference().child("Users").child(userID).child("name").observe(.value, with: { (data) in
                            print(String((data.value as? String)!))
                            let name = "\(String((data.value as? String)!))"
                        })
                        let imageName = NSUUID().uuidString
                        let Storageref = Storage.storage().reference().child("post_images").child("\(imageName).jpg")
                        if let uploadData = data {
                            Storageref.putData(uploadData, metadata: nil) { (metadata, error) in
                                if error != nil{
                                    print("Failed to upload image:", error as Any)
                                    return
                                }
                                print(Storageref.downloadURL(completion: { (url, err) in
                                    if err != nil{
                                        print(err as Any)
                                        return
                                    }
                                    print("Good")
                                        if let imageUrl = url?.absoluteString {
                                            print(imageUrl)
                                                        let values = [
                                                            "postID" : key!,
                                                            "account-Name" : "\(self.accountNameTF.text!)",
                                                            "account-Username" : "\(self.accountUsernameTF.text!)",
                                                            "account-Password" : "\(self.accountPasswordTF.text!)",
                                                            "account-ImageUrl" : imageUrl] as [String : Any]
                                                        let postFeed = ["\(key!)" : values]
                                                        ref.child("Users").child(uid).child("My_Accounts").updateChildValues(postFeed)
                                            let alertController = UIAlertController(title: "Success", message: "Your Account Was Added", preferredStyle: .alert)
                                            alertController.addAction(UIAlertAction(title: "Okay", style: .default, handler: { (action) in
                                                MyVariables.account = "nil"
                                                print(MyVariables.account)
                                                SVProgressHUD.dismiss()
                                                self.navigationController?.popViewController(animated: true)
                                            }))
                                            self.present(alertController, animated: true, completion: nil)
                                        }
                                }))
                            }
                    }
                }))
                alertController.addAction(UIAlertAction(title: "Go Back", style: .default, handler: { (action) in
                    alertController.dismiss(animated: true, completion: nil)
                }))
                self.present(alertController, animated: true, completion: nil)
            }
        }
    }
    
    @IBAction func openImagePicker(_ sender: UIButton) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.allowsEditing = true
        let actionSheet = UIAlertController(title: "Choose Photo Source", message: "Please Choose Your Source", preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "Camera", style: .default, handler: { (action : UIAlertAction) in
          if UIImagePickerController.isSourceTypeAvailable(.camera) {
            imagePickerController.sourceType = .camera
            self.present(imagePickerController, animated: true, completion: nil)
          } else {
            let alert = UIAlertController(title: "Camera Not Detected", message: "Your Device is Being Ran On A Simulator, And Or Does Not Have A Working Camera", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
          }
        }))
        actionSheet.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: { (action : UIAlertAction) in
          imagePickerController.sourceType = .photoLibrary
            self.present(imagePickerController, animated: true, completion: nil)
        }))
        actionSheet.addAction(UIAlertAction(title: "LockIt Icons", style: .default, handler: { (action) in
            print("Hello")
            self.present(LCollectionIcons(), animated: true, completion: nil)
        }))
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(actionSheet, animated: true, completion: nil)
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

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
      if let image = info[.editedImage] as? UIImage {
        appIconImageView.image = image
          self.imageSelected = true
      } else if let image1 = info[.originalImage] as? UIImage {
        appIconImageView.image = image1
          self.imageSelected = true
      }
          
      picker.dismiss(animated: true, completion: nil)
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
      picker.dismiss(animated: true, completion: nil)
      self.imageSelected = false
    }


}
