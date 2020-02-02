//
//  LHomeControllerCell.swift
//  LockItPasswordData
//
//  Created by JJ Zapata on 2/2/20.
//  Copyright © 2020 JJ Zapata. All rights reserved.
//

import Foundation
import UIKit

class LHomeControllerCell : UITableViewCell {

  var safeArea : UILayoutGuide!
  let imageViewImage = UIImageView()
  let nameLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  func setupView() {
    safeArea = layoutMarginsGuide
    setupImageView()
    setupNameLabel()
  }

  func setupImageView() {
    addSubview(imageViewImage)
    imageViewImage.translatesAutoresizingMaskIntoConstraints = false
    imageViewImage.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor).isActive = true
    imageViewImage.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    imageViewImage.widthAnchor.constraint(equalToConstant: 40).isActive = true
    imageViewImage.heightAnchor.constraint(equalToConstant: 40).isActive = true
    imageViewImage.contentMode = .scaleAspectFill
    imageViewImage.layer.cornerRadius = 9
    imageViewImage.layer.masksToBounds = true
  }

  func setupNameLabel() {
    addSubview(nameLabel)
    nameLabel.translatesAutoresizingMaskIntoConstraints = false
    nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
    nameLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
    nameLabel.leadingAnchor.constraint(equalTo: imageViewImage.trailingAnchor, constant: 5).isActive = true
    nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
  }

}
