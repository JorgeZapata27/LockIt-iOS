//
//  DataModal.swift
//  LockItPasswordData
//
//  Created by JJ Zapata on 6/1/19.
//  Copyright © 2019 JJ Zapata. All rights reserved.
//

import Foundation

class DataModal {
    var headerName: String?
    var subType = [String]()
    var isExpandable: Bool = false
    
    init(headerName: String, subType: [String], isExpandable: Bool) {
        self.headerName = headerName
        self.subType = subType
        self.isExpandable = isExpandable
    }
}
