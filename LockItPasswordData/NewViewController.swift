//
//  NewESTSTRT.swift
//  Locker
//
//  Created by JJ Zapata on 2/21/19.
//  Copyright © 2019 JJ Zapata. All rights reserved.
//

import UIKit

class NewESTSTRT: UIViewController {
    
    @IBOutlet var imgImage: UIImageView!
    
    
    
    //need to make a varibale for iboutlet, and set that as new 22
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIView.animate(withDuration: 1.9
            , delay: 1, usingSpringWithDamping: 5, initialSpringVelocity: 15, options: .curveEaseInOut, animations: {
                self.imgImage.center.y = 260
        }, completion: nil)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.5) {
            let sb = UIStoryboard(name: "Main", bundle: nil)
            let vc: UIViewController = sb.instantiateViewController(withIdentifier: "TABBAR") as! StartUpController 
            UIApplication.shared.keyWindow?.rootViewController = vc
        }
        // Do any additional setup after loading the view.
    }
    
}
