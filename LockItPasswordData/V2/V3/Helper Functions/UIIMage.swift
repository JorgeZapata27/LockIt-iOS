//
//  UIIMage.swift
//  LockItPasswordData
//
//  Created by JJ Zapata on 1/30/20.
//  Copyright © 2020 JJ Zapata. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    
    func loadImageUsingCacheWithUrlString(urlString: String) {
        let url = URL(string: urlString)
                    URLSession.shared.dataTask(with: url!) { (data, response, error) in
                        if error != nil {
                            print(error)
                            return
                        }
                        DispatchQueue.main.async {
                            self.image = UIImage(data: data!)
                        }
                    }.resume()
        
    }
    
}
