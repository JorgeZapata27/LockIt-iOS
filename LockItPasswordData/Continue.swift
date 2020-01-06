//
//  Welcome.swift
//  LockItPasswordData
//
//  Created by JJ Zapata on 6/2/19.
//  Copyright © 2019 JJ Zapata. All rights reserved.
//

import UIKit

class Continue: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func continueE(_ sender: Any)
    {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let mainVC = storyboard.instantiateViewController(withIdentifier: "LoginController") as! Nav
        self.present(mainVC, animated: true, completion: nil)
    }

}
