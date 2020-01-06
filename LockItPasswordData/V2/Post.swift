//
//  Post.swift
//  LockItPasswordData
//
//  Created by JJ Zapata on 12/12/19.
//  Copyright © 2019 JJ Zapata. All rights reserved.
//

import Foundation
import Firebase
import FirebaseStorage

class Post {
    var acnme : String!
    var acuser : String!
    var acpass : String!
    var imageDownloadURL : String?
    
    private var image : UIImage!
    
    init(image : UIImage, acname : String, acuser : String, acpass : String) {
        self.image = image
        self.acnme = acname
        self.acuser = acuser
        self.acpass = acpass
    }
}
