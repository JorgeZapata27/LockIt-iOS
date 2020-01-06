//
//  ContactsController.swift
//  LockItPasswordData
//
//  Created by JJ Zapata on 11/12/19.
//  Copyright © 2019 JJ Zapata. All rights reserved.
//

import UIKit

class ContactsController: UIViewController {
    
    @IBOutlet var TitleHead: UILabel!
    @IBOutlet var CEO: UILabel!
    @IBOutlet var Email: UILabel!
    @IBOutlet var PN: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DoDarkThings()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        DoDarkThings()
    }
    
    func DoDarkThings() {
        let bool = UserDefaults.standard.bool(forKey: "DARK")
        if bool == true {
            view.backgroundColor = .black
            TitleHead.textColor = .white
        } else {
            view.backgroundColor = .white
            TitleHead.textColor = .black
            CEO.textColor = .black
            Email.textColor = .black
            PN.textColor = .black
        }
    }
}
