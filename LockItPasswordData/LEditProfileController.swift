class LEditProfile : UIViewController : UIViewController {

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
        btn.setTitle("Change Image")
        btn.setTitleColor(.systemGray2, for: .normal)
        btn.addTarget(self, action: #selector(changeImage), completion: nil)
        return btn
    }()

    let backgroundView : UIView = {
      let view = UIView()
      view.backgroundColor = UIColor.secondarySystemBackground
      return view
      // Look For Backougrnd View (Secondary Color).
    }

    let emailPlaceholder : UILabel = {
      let label = UILabel()
      label.backgroundColor = .clear
      label.text = "Email address"
      label.textColor = UIColor.secondarySystemBackground
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
      label.textColor = UIColor.secondarySystemBackground
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
      label.textColor = UIColor.secondarySystemBackground
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
        profileImageView.anchor(top: view.topAnchor, left: nil, bottom: nil, right: nil, paddingTop: 60, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 100, height: 100).isActive = true
        profileImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

        view.addSubview(changePhotoButton)
        changePhotoButton.anchor(top: profileImageView.bottomAnchor, left: nil, bottom: nil, right: nil, paddingTop: 60, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 150, height: 150).isActive = true
        changePhotoButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

        view.addSubview(emailPlaceholder)
        emailPlaceholder.anchor(top: changePhotoButton.bottomAnchor, left: nil, bottom: nil, right: nil, paddingTop: 100, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: view.frame.width, height: 90).isActive = true
        emailPlaceholder.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

        view.addSubview(emailLabel)
        emailLabel.anchor(top: emailPlaceholder.bottomAnchor, left: nil, bottom: nil, right: nil, paddingTop: 10, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: view.frame.width, height: 110).isActive = true
        emailLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

        view.addSubview(dividerView1)
        dividerView1.anchor(top: emailLabel.bottomAnchor, left: nil, bottom: nil, right: view.rightAnchor, paddingTop: 10, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: ((view.frame.width) - 30), height: 2).isActive = true

        view.addSubview(phonePlaceholder)
        phonePlaceholder.anchor(top: dividerView1.bottomAnchor, left: nil, bottom: nil, right: nil, paddingTop: 20, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: view.frame.width, height: 90).isActive = true
        phonePlaceholder.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

        view.addSubview(phoneLabel)
        phoneLabel.anchor(top: phonePlaceholder.bottomAnchor, left: nil, bottom: nil, right: nil, paddingTop: 10, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: view.frame.width, height: 110).isActive = true
        phoneLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

        view.addSubview(dividerView2)
        dividerView2.anchor(top: phoneLabel.bottomAnchor, left: nil, bottom: nil, right: view.rightAnchor, paddingTop: 10, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: ((view.frame.width) - 30), height: 2).isActive = true

        view.addSubview(countryPlaceholder)
        countryPlaceholder.anchor(top: dividerView2.bottomAnchor, left: nil, bottom: nil, right: nil, paddingTop: 20, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: view.frame.width, height: 90).isActive = true
        countryPlaceholder.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

        view.addSubview(countryLabel)
        countryLabel.anchor(top: countryPlaceholder.bottomAnchor, left: nil, bottom: nil, right: nil, paddingTop: 10, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: view.frame.width, height: 110).isActive = true
        countryLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

        view.addSubview(dividerView3)
        dividerView3.anchor(top: countryLabel.bottomAnchor, left: nil, bottom: nil, right: view.rightAnchor, paddingTop: 10, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: ((view.frame.width) - 30), height: 2).isActive = true

        view.addSubview(backgroundView)
        backgroundView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: emailPlaceholder.topAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 20, paddingRight: 0, width: view.frame.width, height: nil).isActive = true
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
