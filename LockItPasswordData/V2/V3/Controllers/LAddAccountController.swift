import UIKit
import Foundation

class LAddAccountController : UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

  let appImageView : UIImageView = {
    let iv = UIImageView()
    iv.image = UIImage(named: "blank-app")
    iv.contentMode = .scaleAspectFit
    iv.translatesAutoresizingMaskIntoConstraints = false
    return iv
  }()

  let changeImageBtn : UIButton = {
    let btn = UIButton()
    btn.setTitle("Change Image", for: .normal)
    btn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
    btn.setTitleColor(UIColor.systemYellow, for: .normal)
    btn.translatesAutoresizingMaskIntoConstraints = false
    btn.addTarget(self, action: #selector(openImagePicker), for: .touchUpInside)
    return btn
  }()

  let textfieldView : UIView = {
    let view = UIView()
    view.backgroundColor = .clear
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()

  let accountNameTF : UITextField = {
    let tf = UITextField()
    tf.placeholder = "Account Name"
    tf.backgroundColor = .systemBackground
    tf.textColor = .systemGray2
    tf.tintColor = .yellow
    tf.translatesAutoresizingMaskIntoConstraints = false
    return tf
  }()

  let accountUsernameTF : UITextField = {
    let tf = UITextField()
    tf.placeholder = "Account Username"
    tf.backgroundColor = .systemBackground
    tf.textColor = .systemGray2
    tf.tintColor = .yellow
    tf.translatesAutoresizingMaskIntoConstraints = false
    return tf
  }()

  let accountPasswordTF : UITextField = {
    let tf = UITextField()
    tf.placeholder = "Account Password"
    tf.backgroundColor = .systemBackground
    tf.textColor = .systemGray2
    tf.tintColor = .yellow
    tf.translatesAutoresizingMaskIntoConstraints = false
    return tf
  }()

  let addButton : UIButton = {
    let btn = UIButton()
    btn.backgroundColor = .systemYellow
    btn.setTitle("Add", for: .normal)
    btn.setTitleColor(.systemBackground, for: .normal)
    btn.translatesAutoresizingMaskIntoConstraints = false
    btn.layer.cornerRadius = btn.frame.height / 2
    return btn
  }()

  override func viewDidLoad() {
    super.viewDidLoad()

    // Functions To Throw
    confugreUI()

  }

  func confugreUI() {
    view.backgroundColor = .systemBackground

    view.addSubview(appImageView)
    appImageView.heightAnchor.constraint(equalToConstant: 90).isActive = true
    appImageView.widthAnchor.constraint(equalToConstant: 120).isActive = true
    appImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    appImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 120).isActive = true

    view.addSubview(changeImageBtn)
    changeImageBtn.widthAnchor.constraint(equalToConstant: 120).isActive = true
    changeImageBtn.heightAnchor.constraint(equalToConstant: 60).isActive = true
    changeImageBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    changeImageBtn.topAnchor.constraint(equalTo: appImageView.bottomAnchor, constant: 10).isActive = true

    view.addSubview(textfieldView)
    textfieldView.widthAnchor.constraint(equalToConstant: 200).isActive = true
    textfieldView.heightAnchor.constraint(equalToConstant: 200).isActive = true
    textfieldView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    textfieldView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

    textfieldView.addSubview(accountNameTF)
    accountNameTF.topAnchor.constraint(equalTo: textfieldView.topAnchor, constant: 0).isActive = true
    accountNameTF.leftAnchor.constraint(equalTo: textfieldView.leftAnchor, constant: 0).isActive = true
    accountNameTF.rightAnchor.constraint(equalTo: textfieldView.rightAnchor, constant: 0).isActive = true
    accountNameTF.heightAnchor.constraint(equalToConstant: 63).isActive = true

    textfieldView.addSubview(accountUsernameTF)
    accountUsernameTF.leftAnchor.constraint(equalTo: textfieldView.leftAnchor, constant: 0).isActive = true
    accountUsernameTF.rightAnchor.constraint(equalTo: textfieldView.rightAnchor, constant: 0).isActive = true
    accountUsernameTF.heightAnchor.constraint(equalToConstant: 63).isActive = true
    accountUsernameTF.centerYAnchor.constraint(equalTo: textfieldView.centerYAnchor).isActive = true
    accountUsernameTF.centerXAnchor.constraint(equalTo: textfieldView.centerXAnchor).isActive = true

    textfieldView.addSubview(accountPasswordTF)
    accountPasswordTF.bottomAnchor.constraint(equalTo: textfieldView.bottomAnchor, constant: 0).isActive = true
    accountPasswordTF.leftAnchor.constraint(equalTo: textfieldView.leftAnchor, constant: 0).isActive = true
    accountPasswordTF.rightAnchor.constraint(equalTo: textfieldView.rightAnchor, constant: 0).isActive = true
    accountPasswordTF.heightAnchor.constraint(equalToConstant: 63).isActive = true

    view.addSubview(addButton)
    addButton.topAnchor.constraint(equalTo: textfieldView.bottomAnchor, constant: 100).isActive = true
    addButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
    addButton.widthAnchor.constraint(equalToConstant: 150).isActive = true
    addButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
  }

  @objc func openImagePicker() {
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
    actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
    self.present(actionSheet, animated: true, completion: nil)
  }

  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    if let image = info[.editedImage] as? UIImage {
      appImageView.image = image
    } else if let image1 = info[.originalImage] as? UIImage {
      appImageView.image = image1
    }
        
    picker.dismiss(animated: true, completion: nil)
  }

  func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
    picker.dismiss(animated: true, completion: nil)
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
