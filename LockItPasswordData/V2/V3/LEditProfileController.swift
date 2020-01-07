//
//  EditProfileController.swift
//  LockItPasswordData
//
//  Created by JJ Zapata on 1/6/20.
//  Copyright © 2020 JJ Zapata. All rights reserved.
//

import UIKit

class LEditProfileController : UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    // MARK: - Variables
    var imagePicker : UIImagePickerController!

    // MARK: - Properties
    let profileImageView : UIImageView = {
        let piv = UIImageView()
        piv.image = UIImage(named: "jorge")
        piv.contentMode = .scaleAspectFit
        return piv
    }()

    let changePhotoButton : UIButton = {
        let btn = UIButton()
        btn.setTitle("Change Image", for: .normal   )
        btn.setTitleColor(.systemGray2, for: .normal)
        btn.addTarget(self, action: #selector(changeImage), for: .touchUpInside)
        return btn
    }()

    // MARK: - Init
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewComponents()
    }
    
    func constraint() {
        view.addSubview(profileImageView)
        profileImageView.anchor(top: view.topAnchor, left: nil, bottom: nil, right: nil, paddingTop: 100, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 150, height: 150)
        profileImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }

    // MARK: - Helper Functions
    func configureViewComponents() {
        view.backgroundColor = UIColor.systemBackground
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationItem.title = "Edit Profile"
        navigationController?.navigationBar.prefersLargeTitles = true

        // Image Picker
        imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = true
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        
        // Photo
        profileImageView.layer.cornerRadius = profileImageView.frame.height / 2
        
        constraint()
    }

    // MARK: - Selectors
    
    @objc func changeImage() {
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
