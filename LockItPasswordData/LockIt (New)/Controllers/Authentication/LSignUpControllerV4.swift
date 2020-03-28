//
//  LSignUpController.swift
//  LockItPasswordData
//
//  Created by JJ Zapata on 3/28/20.
//  Copyright © 2020 JJ Zapata. All rights reserved.
//

import UIKit
import Firebase
import Foundation
import FirebaseCore
import FirebaseAuth
import SVProgressHUD
import FirebaseStorage
import FirebaseDatabase
import AuthenticationServices

class LSignUpControllerV4: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate {
    
    @IBOutlet var nameTF : UITextField!
    @IBOutlet var emailTF : UITextField!
    @IBOutlet var passwordTF : UITextField!
    @IBOutlet var profileImageView : UIImageView!

    var imagePicker : UIImagePickerController!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameTF.delegate = self
        emailTF.delegate = self
        passwordTF.delegate = self

        imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = true
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self

        // Do any additional setup after loading the view.
    }
    
    @IBAction func signUpPressed(_ sender: UIButton) {
        SVProgressHUD.show(withStatus: "Working...")
        guard let email = self.emailTF.text else { return }
        guard let password = self.passwordTF.text else { return }
        guard let username = self.nameTF.text else { return }
        guard let imageData = profileImageView.image?.jpegData(compressionQuality: 0.75) else { return }

        if email == "" || password == "" || username == "" {
          let alertController = UIAlertController(title: "Error Creating Account", message: "Your Request Was Denied Because One Of Your Text Fields Was Left Clear", preferredStyle: .alert)
          let okay = UIAlertAction(title: "Okay", style: .default, handler: nil)
          alertController.addAction(okay)
          self.present(alertController, animated: true, completion: nil)
        } else {
          Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
            if error == nil && user != nil {
                var dict : Dictionary<String, Any> = [
                    "uid" : String(Auth.auth().currentUser!.uid),
                    "email" : String(Auth.auth().currentUser!.email!),
                    "profileImageURL" : "",
                    "name" : username,
                    "Country" : "Unknown",
                    "phoneNumber" : "Unknown"
                ]
                let storageRef = Storage.storage().reference(forURL: "gs://fir-demo-2c741.appspot.com")
                let storageProfileRef = storageRef.child("Profile").child(Auth.auth().currentUser!.uid)
                let metadata = StorageMetadata()
                metadata.contentType = "image/jpg"
                storageProfileRef.putData(imageData, metadata: metadata) { (storageMetadata, errir) in
                    if error != nil {
                        print(error!.localizedDescription)
                        return
                    }
                    storageProfileRef.downloadURL { (url, error) in
                        if let metaImageURL = url?.absoluteString {
                            print(metaImageURL)
                            dict["profileImageURL"] = metaImageURL

                            Database.database().reference().child("Users").child((user?.user.uid)!).updateChildValues(dict) { (error, ref) in
                                if error == nil {
                                    SVProgressHUD.dismiss()
                                    let sb = UIStoryboard(name: "NewMain", bundle: nil)
                                    let vc: UIViewController = sb.instantiateViewController(withIdentifier: "LMainTabbarV4") as! LMainTabBarControllerV4
                                    UIApplication.shared.keyWindow?.rootViewController = vc
                                }
                            }
                        }
                    }
                }
            } else {
                let errorDesc = error?.localizedDescription
                let alertController = UIAlertController(title: "Error Creating Account", message: errorDesc, preferredStyle: .alert)
                let okay = UIAlertAction(title: "Okay", style: .default, handler: nil)
                alertController.addAction(okay)
                self.present(alertController, animated: true, completion: nil)
            }
          }
        }
    }
    
    @IBAction func addPhoto(_ sender: UIButton) {
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info : [UIImagePickerController.InfoKey : Any]) {
      if let editedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
        self.profileImageView.image = editedImage
      } else if let originalImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
        self.profileImageView.image = originalImage
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

        // Hides keyboard
        override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            self.view.endEditing(true)
        }

        // Return key
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            textField.resignFirstResponder()
            return (true)
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
