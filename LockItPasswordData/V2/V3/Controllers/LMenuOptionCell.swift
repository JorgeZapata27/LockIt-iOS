import UIKit

class LMenuOptionCell : UITableViewCell {

  // MARK: - Properties

  let iconImageView : UIImageView = {
    let iv = UIImageView()
    iv.contentMode = .scaleAspectFit
    iv.clipsToBounds = true
    return iv
  }()

  let descriptionLabel : UILabel = {
    let label = UILabel()
    label.textColor = .white
    label.font = UIFont.systemFont(ofSize: 16)
    label.text = "Sample Text"
    return label
  }()

  // MARK: - Init

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)

    backgroundColor = .darkGray
    selectionStyle = .none

    addSubview(iconImageView)
    iconImageView.translatesAutoresizingMaskIntoConstraints = false
    iconImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    iconImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 12).isActive = true
    iconImageView.heightAnchor.constraint(equalToConstant: 30).isActive = true
    iconImageView.widthAnchor.constraint(equalToConstant: 24).isActive = true

    addSubview(descriptionLabel)
    descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
    descriptionLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    iconImageView.leftAnchor.constraint(equalTo: iconImageView.rightAnchor, constant: 12).isActive = true
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented. ")
  }

  // MARK: - Handlers

}
