//
//  Extensions.swift
//  LockItPasswordData
//
//  Created by JJ Zapata on 12/18/19.
//  Copyright © 2019 JJ Zapata. All rights reserved.
//

import UIKit

extension UIView {

    func anchor(top: NSLayoutYAxisAnchor?, left: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, right: NSLayoutXAxisAnchor?,  paddingTop: CGFloat, paddingLeft: CGFloat, paddingBottom: CGFloat, paddingRight: CGFloat, width: CGFloat, height: CGFloat) {

        translatesAutoresizingMaskIntoConstraints = false

        if let top = top {
            self.topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }

        if let left = left {
            self.leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
        }

        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom).isActive = true
        }

        if let right = right {
            rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
        }

        if width != 0 {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }

        if height != 0 {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }

    func textContainerViewE(view: UIView, _ textField: UITextField) -> UIView {
        view.backgroundColor = .clear

        let imageView = UIImageView()
        if self.traitCollection.userInterfaceStyle == .dark {
            imageView.image = UIImage(named: "mail")
        } else {
            imageView.image = UIImage(named: "emailImagepng")
        }
        imageView.contentMode = .scaleAspectFit
        imageView.alpha = 0.87
        view.addSubview(imageView)
        imageView.anchor(top: nil, left: view.leftAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width: 24, height: 24)
        imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true

        view.addSubview(textField)
        textField.anchor(top: nil, left: imageView.rightAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 0, paddingLeft: 12, paddingBottom: 0, paddingRight: 8, width: 0, height: 0)
        textField.centerYAnchor.constraint(equalTo: imageView.centerYAnchor).isActive = true

        let separatorView = UIView()
        separatorView.backgroundColor = UIColor(white: 1, alpha: 0.87)
        view.addSubview(separatorView)
        separatorView.anchor(top: nil, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width: 0, height: 0.75)

        return view
    }
    
    func textContainerViewU(view: UIView, _ textField: UITextField) -> UIView {
        view.backgroundColor = .clear

        let imageView = UIImageView()
        if self.traitCollection.userInterfaceStyle == .dark {
            imageView.image = UIImage(named: "man")
        } else {
            imageView.image = UIImage(named: "mann")
        }
        imageView.contentMode = .scaleAspectFit
        imageView.alpha = 0.87
        view.addSubview(imageView)
        imageView.anchor(top: nil, left: view.leftAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width: 24, height: 24)
        imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true

        view.addSubview(textField)
        textField.anchor(top: nil, left: imageView.rightAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 0, paddingLeft: 12, paddingBottom: 0, paddingRight: 8, width: 0, height: 0)
        textField.centerYAnchor.constraint(equalTo: imageView.centerYAnchor).isActive = true

        let separatorView = UIView()
        separatorView.backgroundColor = UIColor(white: 1, alpha: 0.87)
        view.addSubview(separatorView)
        separatorView.anchor(top: nil, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width: 0, height: 0.75)

        return view
    }

    func textContainerViewP(view: UIView, _ textField: UITextField) -> UIView {
        view.backgroundColor = .clear

        let imageView = UIImageView()
        if self.traitCollection.userInterfaceStyle == .dark {
            imageView.image = UIImage(named: "password")
        } else {
            imageView.image = UIImage(named: "passwordd")
        }
        imageView.contentMode = .scaleAspectFit
        imageView.alpha = 0.87
        view.addSubview(imageView)
        imageView.anchor(top: nil, left: view.leftAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width: 24, height: 24)
        imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true

        view.addSubview(textField)
        textField.anchor(top: nil, left: imageView.rightAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 0, paddingLeft: 12, paddingBottom: 0, paddingRight: 8, width: 0, height: 0)
        textField.centerYAnchor.constraint(equalTo: imageView.centerYAnchor).isActive = true

        let separatorView = UIView()
        separatorView.backgroundColor = UIColor(white: 1, alpha: 0.87)
        view.addSubview(separatorView)
        separatorView.anchor(top: nil, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width: 0, height: 0.75)

        return view
    }

    func pin(to superView: UIView) {
      translatesAutoresizingMaskIntoConstraints = false
      topAnchor.constraint(equalTo: superView.topAnchor).isActive = true
      leadingAnchor.constraint(equalTo: superView.leadingAnchor).isActive = true
      trailingAnchor.constraint(equalTo: superView.trailingAnchor).isActive = true
      bottomAnchor.constraint(equalTo: superView.bottomAnchor).isActive = true
    }

}

extension UIColor {
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }

    static func mainBlue() -> UIColor {
        return UIColor.rgb(red: 0, green: 150, blue: 255)
    }

    static func googleRed() -> UIColor {
        return UIColor.rgb(red: 220, green: 78, blue: 65)
    }
}

extension UITextField {
    func textField(withPlaceolder placeholder: String, isSecureTextEntry: Bool) -> UITextField {
        let tf = UITextField()
        tf.borderStyle = .none
        tf.font = UIFont.systemFont(ofSize: 16)
        tf.textColor = .white
        tf.isSecureTextEntry = isSecureTextEntry
        tf.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        return tf
    }
}

protocol LHomeControllerDelegate {
  func handleMenuToggle(forMenuOption menuOption: MenuOption?)
}

let imageCache = NSCache<NSString, AnyObject>()

extension UIImageView {
    
    func loadImageUsingCacheWithUrlString(_ urlString: String) {
        
        self.image = nil
        
        //check cache for image first
        if let cachedImage = imageCache.object(forKey: urlString as NSString) as? UIImage {
            self.image = cachedImage
            return
        }
        
        //otherwise fire off a new download
        let url = URL(string: urlString)
        URLSession.shared.dataTask(with: url!, completionHandler: { (data, response, error) in
            
            //download hit an error so lets return out
            if let error = error {
                print(error)
                return
            }
            
            DispatchQueue.main.async(execute: {
                
                if let downloadedImage = UIImage(data: data!) {
                    imageCache.setObject(downloadedImage, forKey: urlString as NSString)
                    
                    self.image = downloadedImage
                }
            })
            
        }).resume()
    }
}

extension UIViewController {
    
    func createAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Okay", style: .cancel, handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }
    
}
