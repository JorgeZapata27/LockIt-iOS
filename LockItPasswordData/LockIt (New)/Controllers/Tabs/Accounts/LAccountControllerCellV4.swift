//
//  LAccountControllerCellV4.swift
//  LockItPasswordData
//
//  Created by JJ Zapata on 3/28/20.
//  Copyright © 2020 JJ Zapata. All rights reserved.
//

import UIKit

class LAccountControllerCellV4: UITableViewCell {
    
    @IBOutlet var accountImage : UIImageView!
    @IBOutlet var accountName : UILabel!
    @IBOutlet var accountUsername : UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
