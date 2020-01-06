//
//  SportsTableView.swift
//  LockItPasswordData
//
//  Created by JJ Zapata on 4/27/19.
//  Copyright © 2019 JJ Zapata. All rights reserved.
//

import UIKit

class SportsTableView: UITableViewCell {
    
    @IBOutlet var myLabel: UILabel!
    @IBOutlet var myImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.myImage.layer.cornerRadius = self.myImage.frame.height/5
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
