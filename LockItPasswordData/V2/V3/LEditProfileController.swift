//
//  EditProfileController.swift
//  LockItPasswordData
//
//  Created by JJ Zapata on 1/6/20.
//  Copyright © 2020 JJ Zapata. All rights reserved.
//

import UIKit

class LEditProfile : UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    // MARK: - Variables

    var imagePicker : UIImagePickerController!

    // MARK: - Properties

    let profileImageView : UIImageView = {
        let piv = UIImageView()
        piv.image = UIImage(named: "jorge")
        piv.contentMode = .scaleAspectFit
        piv.layer.cornerRadius = piv.frame.height / 2
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
      label.text = "jorgejaden@gmail.com"
      label.textColor = UIColor.label
      return label
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
      label.text = "1714964250"
      label.textColor = UIColor.label
      return label
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
      label.text = "Germany"
      label.textColor = UIColor.label
      return label
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

    }

    // MARK: - Helper Functions

    func configureViewComponents() {
        view.backgroundColor = UIColor.systemBackground
        navigationController?.navigationBar.isHidden = false

        // Image Picker
        imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = true
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
    }

    func constraintsForView() {
        
        view.addSubview(profileImageView)
        profileImageView.anchor(top: view.topAnchor, left: nil, bottom: nil, right: nil, paddingTop: 60, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 100, height: 100)
        profileImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

        view.addSubview(changePhotoButton)
        changePhotoButton.anchor(top: profileImageView.bottomAnchor, left: nil, bottom: nil, right: nil, paddingTop: 10, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 150, height: 30)
        changePhotoButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

        view.addSubview(emailPlaceholder)
        emailPlaceholder.anchor(top: changePhotoButton.bottomAnchor, left: view.leftAnchor, bottom: nil, right: nil, paddingTop: 60, paddingLeft: 30, paddingBottom: 0, paddingRight: 0, width: view.frame.width, height: 25)

        view.addSubview(emailLabel)
        emailLabel.anchor(top: emailPlaceholder.bottomAnchor, left: view.leftAnchor, bottom: nil, right: nil, paddingTop: 10, paddingLeft: 30, paddingBottom: 0, paddingRight: 0, width: view.frame.width, height: 25)

        view.addSubview(dividerView1)
        dividerView1.anchor(top: emailLabel.bottomAnchor, left: nil, bottom: nil, right: view.rightAnchor, paddingTop: 10, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: ((view.frame.width) - 10), height: 2)

        view.addSubview(phonePlaceholder)
        phonePlaceholder.anchor(top: dividerView1.bottomAnchor, left: view.leftAnchor, bottom: nil, right: nil, paddingTop: 20, paddingLeft: 30, paddingBottom: 0, paddingRight: 0, width: view.frame.width, height: 25)

        view.addSubview(phoneLabel)
        phoneLabel.anchor(top: phonePlaceholder.bottomAnchor, left: view.leftAnchor, bottom: nil, right: nil, paddingTop: 10, paddingLeft: 30, paddingBottom: 0, paddingRight: 0, width: view.frame.width, height: 25)

        view.addSubview(dividerView2)
        dividerView2.anchor(top: phoneLabel.bottomAnchor, left: nil, bottom: nil, right: view.rightAnchor, paddingTop: 10, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: ((view.frame.width) - 10), height: 2)

        view.addSubview(countryPlaceholder)
        countryPlaceholder.anchor(top: dividerView2.bottomAnchor, left: view.leftAnchor, bottom: nil, right: nil, paddingTop: 20, paddingLeft: 30, paddingBottom: 0, paddingRight: 0, width: view.frame.width, height: 25)

        view.addSubview(countryLabel)
        countryLabel.anchor(top: countryPlaceholder.bottomAnchor, left: view.leftAnchor, bottom: nil, right: nil, paddingTop: 10, paddingLeft: 30, paddingBottom: 0, paddingRight: 0, width: view.frame.width, height: 25)

        view.addSubview(dividerView3)
        dividerView3.anchor(top: countryLabel.bottomAnchor, left: nil, bottom: nil, right: view.rightAnchor, paddingTop: 10, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: ((view.frame.width) - 10), height: 2)
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
