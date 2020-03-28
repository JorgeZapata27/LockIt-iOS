//
//  LNoConnectionController.swift
//  LockItPasswordData
//
//  Created by JJ Zapata on 3/1/20.
//  Copyright © 2020 JJ Zapata. All rights reserved.
//

import UIKit

class LNoConnectionController: UIViewController {
    
    let image : UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.image = UIImage(named: "LockItLogoClear")
        return iv
    }()
    
    let titleLabel : UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.text = "No Connection"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 30)
        return label
    }()
    
    let descLabel : UILabel = {
        let label = UILabel()
        label.textColor = .systemGray2
        label.text = "Your Connection Is Not Strong Enough For Us To Read Your Data. Please Connect To WiFi, Or Turn On Cellular Data. If You Have Strong Connection, Please Email LockItInformation@gmail.com. We Apolgize For Any Inconviencice."
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.numberOfLines = 5
        label.font = UIFont.boldSystemFont(ofSize: 15)
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.systemBackground
        
        self.view.addSubview(self.image)
        self.image.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        self.image.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -100).isActive = true
        self.image.widthAnchor.constraint(equalToConstant: 200).isActive = true
        self.image.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        self.view.addSubview(self.titleLabel)
        self.titleLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        self.titleLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        self.titleLabel.widthAnchor.constraint(equalToConstant: self.view.frame.width).isActive = true
        self.titleLabel.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        self.view.addSubview(self.descLabel)
        self.descLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        self.descLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 100).isActive = true
        self.descLabel.widthAnchor.constraint(equalToConstant: self.view.frame.width - 20).isActive = true
        self.descLabel.heightAnchor.constraint(equalToConstant: 200).isActive = true

        // Do any additional setup after loading the view.
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
