//
//  File.swift
//  LockItPasswordData
//
//  Created by JJ Zapata on 7/16/19.
//  Copyright © 2019 JJ Zapata. All rights reserved.
//

import UIKit

extension UIAlertController {
    
    func addImage(image: UIImage)
    {
        let maxSize = CGSize(width: 245, height: 300)
        let imgSize = image.size
        
        var ratio : CGFloat!
        if (imgSize.width > imgSize.height)
        {
            ratio = maxSize.width / imgSize.width
        }
        else
        {
            ratio = maxSize.height / imgSize.height
        }
        
        let scaledSize = CGSize(width: imgSize.width * ratio, height: imgSize.height * ratio)
        
        let resignedImage = image.imageWithSize(scaledSize)
        
        
        let imgAction = UIAlertAction(title: "", style: .default, handler: nil)
        imgAction.isEnabled = false
        imgAction.setValue(image, forKey: "image")
        self.addAction(imgAction)
    }
    
}
