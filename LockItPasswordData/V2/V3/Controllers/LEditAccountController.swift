//
//  LEditAccountController.swift
//  LockItPasswordData
//
//  Created by JJ Zapata on 1/30/20.
//  Copyright © 2020 JJ Zapata. All rights reserved.
//

import UIKit

class LEditAccountController: UIViewController {
    
    let segmentedControl : UISegmentedControl = {
        let sc = UISegmentedControl()
        return sc
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.backgroundColor = .darkGray
        
        view.backgroundColor = .systemBackground

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
