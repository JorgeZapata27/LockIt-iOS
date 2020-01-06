//
//  Contact.swift
//  LOCKIT
//
//  Created by JJ Zapata on 4/23/19.
//  Copyright © 2019 JJ Zapata. All rights reserved.
//

import UIKit
import WebKit

class Contact: UIViewController {
    
    @IBOutlet var mWebkit: WKWebView!
    let urlMy = URL(string: "https://docs.google.com/forms/d/e/1FAIpQLSeP3Nk32pgpDQOjT28bvWa1U6qTQlliMzM5thpCF1iN7Ly4aQ/viewform?usp=sf_link")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let request = URLRequest(url: urlMy!)
        mWebkit.load(request)

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
