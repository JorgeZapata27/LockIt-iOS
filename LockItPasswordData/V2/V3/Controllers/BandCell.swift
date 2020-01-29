//
//  BandCell.swift
//  LockItPasswordData
//
//  Created by JJ Zapata on 1/14/20.
//  Copyright © 2020 JJ Zapata. All rights reserved.
//

import Foundation
import UIKit

class BandCell : UITableViewCell {

  let cellView : UIView = {
      let view = UIView()
      view.backgroundColor = .systemBackground
      view.translatesAutoresizingMaskIntoConstraints = false
      return view
  }()

  let pictureImageView : UIImageView = {
      let iv = UIImageView()
      iv.contentMode = .scaleAspectFit
      iv.backgroundColor = .clear
      iv.translatesAutoresizingMaskIntoConstraints = false
      return iv
  }()

  let titleLabel : UILabel = {
    let label = UILabel()
    label.text = "Name"
    label.textColor = .label
    label.backgroundColor = .clear
    label.font = UIFont.boldSystemFont(ofSize: 16)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
      super.init(style: style, reuseIdentifier: reuseIdentifier)
      setup()
  }

  func setup() {
    backgroundColor = .systemBackground

      addSubview(cellView)
      cellView.topAnchor.constraint(equalTo: topAnchor, constant: 4).isActive = true
      cellView.leftAnchor.constraint(equalTo: leftAnchor, constant: 8).isActive = true
      cellView.rightAnchor.constraint(equalTo: rightAnchor, constant: 8).isActive = true
      cellView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 4).isActive = true
      cellView.heightAnchor.constraint(equalToConstant: 40).isActive = true

      cellView.addSubview(pictureImageView)
      pictureImageView.leftAnchor.constraint(equalTo: cellView.leftAnchor, constant: 8).isActive = true
      pictureImageView.widthAnchor.constraint(equalToConstant: 40).isActive = true
      pictureImageView.heightAnchor.constraint(equalToConstant: 40).isActive = true
      pictureImageView.centerYAnchor.constraint(equalTo: cellView.centerYAnchor).isActive = true

      cellView.addSubview(titleLabel)
      titleLabel.leftAnchor.constraint(equalTo: pictureImageView.rightAnchor, constant: 20).isActive = true
      titleLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: 20).isActive = true
      titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
      titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
      titleLabel.centerYAnchor.constraint(equalTo: cellView.centerYAnchor).isActive = true
  }

  required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented.")
  }

}
