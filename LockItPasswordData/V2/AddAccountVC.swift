//
//  AddAccountVC.swift
//  LockItPasswordData
//
//  Created by JJ Zapata on 12/12/19.
//  Copyright © 2019 JJ Zapata. All rights reserved.
//

import UIKit
import Firebase

class AddAccountVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet var imageView : UIImageView!
    @IBOutlet var ACName: UITextField!
    @IBOutlet var Username: UITextField!
    @IBOutlet var Password: UITextField!
    
    var imagePicker : UIImagePickerController!
    var takenImage : UIImage!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        self.takenImage = image
        self.imageView.image = image
        self.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func tapped(_ sender: UIButton) {
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = true
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func Add() {
        guard let email = UserDefaults.standard.string(forKey: "PASSWORD") else { return }
        let postRef = Database.database().reference().child(email).child("posts").childByAutoId()
        let postObject = [
            "acname" : ACName.text,
            "username" : Username.text,
            "password" : Password.text
        ] as [String : Any]
        postRef.setValue(postObject, withCompletionBlock: { error, ref in
            if error == nil {
                self.dismiss(animated: true, completion: nil)
            } else {
                
            }
        })
    }
    
}
