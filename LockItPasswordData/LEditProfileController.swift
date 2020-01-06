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
    }

    // MARK: - Init

    override func viewDidLoad() {
        super.viewDidLoad()

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
