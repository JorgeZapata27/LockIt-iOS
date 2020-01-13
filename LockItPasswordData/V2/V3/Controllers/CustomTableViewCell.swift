//
//  CustomTableViewCell.swift
//  LockItPasswordData
//
//  Created by JJ Zapata on 1/13/20.
//  Copyright © 2020 JJ Zapata. All rights reserved.
//

import UIKit

class CustomTableViewCell : UITableViewCell {

  lazy var backView : UIView = {
    let view = UIView(frame: CGRect(x: 10, y: 6, width: self.frame.width - 20, height: 110))
    view.backgroundColor = UIColor.systemGray2
    return view
  }()

  lazy var iconImageView : UIImageView = {
    let iv = UIImageView(frame: CGRect(x: 16, y: 16, width: 86, height: 86))
    iv.contentMode = .scaleAspectFit
    return iv
  }()

  lazy var nameLabel : UILabel = {
    let label = UILabel(frame: CGRect(x: 116, y: 8, width: backView.frame.width - 86, height: 30))
    label.textAlignment = .left
    label.font = UIFont.boldSystemFont(ofSize: 18)
    return label
  }()

  override func awakeFromNib() {
    super.awakeFromNib()
    // Init
  }

  override func layoutSubviews() {
    contentView.backgroundColor = .clear
    backgroundColor = .clear
    backView.layer.cornerRadius = 5
    backView.clipsToBounds = true
  }

  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    addSubview(backView)
    // Configure the view for it's collected state.
  }

}
