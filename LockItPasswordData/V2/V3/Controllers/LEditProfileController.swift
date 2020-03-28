//
//  EditProfileController.swift
//  LockItPasswordData
//
//  Created by JJ Zapata on 1/6/20.
//  Copyright © 2020 JJ Zapata. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase
import FirebaseStorage

class LEditProfile : UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    // MARK: - Variables

    var imagePicker : UIImagePickerController!

    // MARK: - Properties

    let profileImageView : UIImageView = {
        let piv = UIImageView()
        piv.image = UIImage(named: "jorge")
        piv.contentMode = .scaleAspectFill
        piv.layer.cornerRadius = piv.frame.height / 2
        piv.layer.masksToBounds = true
        return piv
    }()

    let changePhotoButton : UIButton = {
        let btn = UIButton()
        btn.setTitle("Change Image", for: .normal)
        btn.setTitleColor(.systemGray2, for: .normal)
        btn.addTarget(self, action: #selector(changeImage), for: .touchUpInside)
        return btn
    }()

    let backgroundView : UIView = {
      let view = UIView()
      view.backgroundColor = UIColor.yellow
      return view
    }()

    let emailPlaceholder : UILabel = {
      let label = UILabel()
      label.backgroundColor = .clear
      label.text = "Email address"
      label.textColor = UIColor.gray
      return label
    }()

    let emailLabel : UILabel = {
      let label = UILabel()
      label.text = "Unknown"
      label.textColor = UIColor.label
      return label
    }()
    
    let emailButton : UIButton = {
        let btn = UIButton()
        btn.setTitle("Change", for: .normal)
        btn.setTitleColor(UIColor.systemYellow, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        btn.contentHorizontalAlignment = .right
        btn.addTarget(self, action: #selector(changeEmail), for: .touchUpInside)
        return btn
    }()

    let dividerView1 : UIView = {
      let view = UIView()
      view.backgroundColor = .secondarySystemBackground
      return view
    }()

    let phonePlaceholder : UILabel = {
      let label = UILabel()
      label.backgroundColor = .clear
      label.text = "Phone Number"
      label.textColor = UIColor.gray
      return label
    }()

    let phoneLabel : UILabel = {
      let label = UILabel()
      label.text = "Unknown"
      label.textColor = UIColor.label
      return label
    }()
    
    let phoneButton : UIButton = {
        let btn = UIButton()
        btn.setTitle("Change", for: .normal)
        btn.setTitleColor(UIColor.systemYellow, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        btn.contentHorizontalAlignment = .right
        btn.addTarget(self, action: #selector(changeNumber), for: .touchUpInside)
        return btn
    }()
    

    let dividerView2 : UIView = {
      let view = UIView()
      view.backgroundColor = .secondarySystemBackground
      return view
    }()

    let countryPlaceholder : UILabel = {
      let label = UILabel()
      label.backgroundColor = .clear
      label.text = "Country"
      label.textColor = UIColor.gray
      return label
    }()

    let countryLabel : UILabel = {
      let label = UILabel()
      label.text = "Unknown"
      label.textColor = UIColor.label
      return label
    }()
    
    let countryButton : UIButton = {
        let btn = UIButton()
        btn.setTitle("Change", for: .normal)
        btn.setTitleColor(UIColor.systemYellow, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        btn.contentHorizontalAlignment = .right
        btn.addTarget(self, action: #selector(changeCountry), for: .touchUpInside)
        return btn
    }()

    let dividerView3 : UIView = {
      let view = UIView()
      view.backgroundColor = .secondarySystemBackground
      return view
    }()

    // MARK: - Init

    override func viewDidLoad() {
        super.viewDidLoad()

        // Functions To Throw
        configureViewComponents()
        constraintsForView()
        Firebase()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        configureViewComponents()
        Firebase()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        configureViewComponents()
        Firebase()
    }

    // MARK: - Helper Functions

    func configureViewComponents() {
        profileImageView.layer.cornerRadius = 50
        profileImageView.layer.masksToBounds = true
        view.backgroundColor = UIColor.systemBackground
        navigationController?.navigationBar.prefersLargeTitles = false

        // Image Picker
        imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = true
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
    }

    func constraintsForView() {
        view.addSubview(profileImageView)
        profileImageView.anchor(top: view.topAnchor, left: nil, bottom: nil, right: nil, paddingTop: 70, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 100, height: 100)
        profileImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

        view.addSubview(changePhotoButton)
        changePhotoButton.anchor(top: profileImageView.bottomAnchor, left: nil, bottom: nil, right: nil, paddingTop: 10, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 150, height: 30)
        changePhotoButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

        view.addSubview(emailPlaceholder)
        emailPlaceholder.anchor(top: changePhotoButton.bottomAnchor, left: view.leftAnchor, bottom: nil, right: nil, paddingTop: 60, paddingLeft: 30, paddingBottom: 0, paddingRight: 0, width: view.frame.width, height: 25)

        view.addSubview(emailLabel)
        emailLabel.anchor(top: emailPlaceholder.bottomAnchor, left: view.leftAnchor, bottom: nil, right: nil, paddingTop: 10, paddingLeft: 30, paddingBottom: 0, paddingRight: 0, width: view.frame.width, height: 25)
        
        view.addSubview(emailButton)
        emailButton.anchor(top: emailPlaceholder.topAnchor, left: view.leftAnchor, bottom: emailLabel.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 15, paddingBottom: 0, paddingRight: 15, width: 0, height: 0)

        view.addSubview(dividerView1)
        dividerView1.anchor(top: emailLabel.bottomAnchor, left: nil, bottom: nil, right: view.rightAnchor, paddingTop: 10, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: ((view.frame.width) - 10), height: 2)

        view.addSubview(phonePlaceholder)
        phonePlaceholder.anchor(top: dividerView1.bottomAnchor, left: view.leftAnchor, bottom: nil, right: nil, paddingTop: 20, paddingLeft: 30, paddingBottom: 0, paddingRight: 0, width: view.frame.width, height: 25)

        view.addSubview(phoneLabel)
        phoneLabel.anchor(top: phonePlaceholder.bottomAnchor, left: view.leftAnchor, bottom: nil, right: nil, paddingTop: 10, paddingLeft: 30, paddingBottom: 0, paddingRight: 0, width: view.frame.width, height: 25)
        
        view.addSubview(phoneButton)
        phoneButton.anchor(top: dividerView1.bottomAnchor, left: view.leftAnchor, bottom: phoneLabel.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 15, paddingBottom: 0, paddingRight: 15, width: 0, height: 0)

        view.addSubview(dividerView2)
        dividerView2.anchor(top: phoneLabel.bottomAnchor, left: nil, bottom: nil, right: view.rightAnchor, paddingTop: 10, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: ((view.frame.width) - 10), height: 2)

        view.addSubview(countryPlaceholder)
        countryPlaceholder.anchor(top: dividerView2.bottomAnchor, left: view.leftAnchor, bottom: nil, right: nil, paddingTop: 20, paddingLeft: 30, paddingBottom: 0, paddingRight: 0, width: view.frame.width, height: 25)

        view.addSubview(countryLabel)
        countryLabel.anchor(top: countryPlaceholder.bottomAnchor, left: view.leftAnchor, bottom: nil, right: nil, paddingTop: 10, paddingLeft: 30, paddingBottom: 0, paddingRight: 0, width: view.frame.width, height: 25)
        
        view.addSubview(countryButton)
        countryButton.anchor(top: dividerView2.bottomAnchor, left: view.leftAnchor, bottom: countryLabel.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 15, paddingBottom: 0, paddingRight: 15, width: 0, height: 0)

        view.addSubview(dividerView3)
        dividerView3.anchor(top: countryLabel.bottomAnchor, left: nil, bottom: nil, right: view.rightAnchor, paddingTop: 10, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: ((view.frame.width) - 10), height: 2)
    }

    // MARK: - Selectors

    @objc func changeImage() {
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    @objc func changeEmail() {
        print("Changed Email")
        self.navigationController?.pushViewController(LChangeEmailControllerrrr(), animated: true)
    }
    
    @objc func changeNumber() {
        self.navigationController?.pushViewController(LChangePhoneNumberController(), animated: true)
    }
    
    @objc func changeCountry() {
        self.navigationController?.pushViewController(LChangeCountryController(), animated: true)
    }
    
    // MARK: - Delegates

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info : [UIImagePickerController.InfoKey : Any]) {
        if let editedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            self.profileImageView.image = editedImage
        } else if let originalImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            self.profileImageView.image = originalImage
        }
        guard let imageData = profileImageView.image?.jpegData(compressionQuality: 0.75) else { return }
        let storageRef = Storage.storage().reference(forURL: "gs://fir-demo-2c741.appspot.com")
        let storageProfileRef = storageRef.child("Profile").child(Auth.auth().currentUser!.uid)
        let metadata = StorageMetadata()
        let uid = Auth.auth().currentUser!.uid
        metadata.contentType = "image/jpg"
        storageProfileRef.putData(imageData, metadata: metadata) { (storageMetadata, error) in
            if error != nil {
                print(error?.localizedDescription)
                return
            }
            storageProfileRef.downloadURL { (url, error) in
                if let metaImageURL = url?.absoluteString {
                    print(metaImageURL)
                    Database.database().reference().child("Users").child(uid).child("profileImageURL").setValue(metaImageURL)
                    self.dismiss(animated: true, completion: nil)
                }
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
    
    func Firebase() {
        let uid = Auth.auth().currentUser!.uid
        Database.database().reference().child("Users").child(uid).child("profileImageURL").observe(.value, with: { (data) in
            let name : String = (data.value as? String)!
            self.profileImageView.loadImageUsingCacheWithUrlString(name)
            debugPrint(name)
        })
        Database.database().reference().child("Users").child(uid).child("email").observe(.value, with: { (data) in
            let name : String = (data.value as? String)!
            self.emailLabel.text = name
            debugPrint(name)
        })
        Database.database().reference().child("Users").child(uid).child("Country").observe(.value, with: { (data) in
            let name : String = (data.value as? String)!
            self.countryLabel.text = name
            debugPrint(name)
        })
        Database.database().reference().child("Users").child(uid).child("phoneNumber").observe(.value, with: { (data) in
            let name : String = (data.value as? String)!
            self.phoneLabel.text = name
            debugPrint(name)
        })
    }

}
