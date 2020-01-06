//
//  TableViewCell.swift
//  LockItPasswordData
//
//  Created by JJ Zapata on 5/28/19.
//  Copyright © 2019 JJ Zapata. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet var accountLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
