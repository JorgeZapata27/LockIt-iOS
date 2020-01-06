//
//  Added.swift
//  LockItPasswordData
//
//  Created by JJ Zapata on 5/28/19.
//  Copyright © 2019 JJ Zapata. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class Added: UIViewController {
    
    var array = UserDefaults.standard.object(forKey: "SavedIntArray") as? String
    
    @IBOutlet var tblView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
