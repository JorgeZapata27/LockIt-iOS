//
//  ads.swift
//  LockItPasswordData
//
//  Created by JJ Zapata on 6/3/19.
//  Copyright © 2019 JJ Zapata. All rights reserved.
//

import UIKit
import GoogleMobileAds

class advertisement: UIViewController {
    
    @IBOutlet var bannerView: GADBannerView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        bannerView.adUnitID = "ca-app-pub-3940256099942544/2934735716"
        bannerView.rootViewController = self
        bannerView.load(GADRequest())

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
