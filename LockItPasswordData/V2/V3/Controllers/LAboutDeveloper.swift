//
//  LAboutDeveloper.swift
//  LockItPasswordData
//
//  Created by JJ Zapata on 1/16/20.
//  Copyright © 2020 JJ Zapata. All rights reserved.
//

import UIKit

class LAboutDeveloper: UIViewController {

      // MARK: - Properties

      var delegate : LHomeControllerDelegate?

      let logoImageView: UIImageView = {
          let iv = UIImageView()
          iv.contentMode = .scaleAspectFit
          iv.translatesAutoresizingMaskIntoConstraints = false
          iv.image = UIImage(named: "jorgeZapata.png")
          iv.layer.cornerRadius = 5
          return iv
      }()

      let titleLabel : UILabel = {
        let label = UILabel()
        label.text = "About The Developer"
        label.textColor = UIColor.label
        label.font = UIFont.boldSystemFont(ofSize: 25)
        return label
      }()

      let textfieldView : UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
      }()

      let errorTF : UITextField = {
        let tf = UITextField()
        tf.placeholder = "Please submit your error here"
        tf.backgroundColor = .systemBackground
        tf.textColor = .systemGray2
        tf.tintColor = .yellow
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
      }()

      let submitBtn : UIButton = {
        let button = UIButton()
        button.setTitle("Submit", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = UIColor.yellow
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(btnSelected), for: .touchUpInside)
        return button
      }()

      // MARK: - Init

      override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()

        // Initialize Things Here.
      }

      func configureUI() {
        view.backgroundColor = .systemBackground
        navigationController?.navigationItem.title = "Report Error"
        
        view.addSubview(logoImageView)
        logoImageView.anchor(top: view.topAnchor, left: nil, bottom: nil, right: nil, paddingTop: 100, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 100, height: 100)
        logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

        view.addSubview(errorTF)
        errorTF.anchor(top: nil, left: nil, bottom: nil, right: nil, paddingTop: 60, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: view.frame.width - 50, height: 35)
        errorTF.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        errorTF.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true

        view.addSubview(submitBtn)
        submitBtn.anchor(top: errorTF.bottomAnchor, left: nil, bottom: nil, right: nil, paddingTop: 30, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 120, height: 40)
        submitBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
      }

      // MARK: - Selectors

      @objc func btnSelected() {
        errorTF.text = ""
        self.dismiss(animated: true, completion: nil)
        let alertController = UIAlertController(title: "Success", message: "Your message has been sent. Thank you for your feedback!", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
        self.present(alertController, animated: true, completion: nil)
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
