//
//  AWController.swift
//  LockItPasswordData
//
//  Created by JJ Zapata on 11/12/19.
//  Copyright © 2019 JJ Zapata. All rights reserved.
//

import UIKit

class AWController: UIViewController {
    
    @IBOutlet var textThing: UILabel!

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
            textThing.textColor = .white
        } else {
            view.backgroundColor = .white
            textThing.textColor = .black
        }
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
