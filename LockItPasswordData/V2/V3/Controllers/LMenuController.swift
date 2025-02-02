import UIKit

private let reuseIdentifier = "MenuOptionCell"

class LMenuController : UIViewController {

  // MARK: - Properties

  var tableView : UITableView!
  var delegate : LHomeControllerDelegate?

  // MARK: - Init

  override func viewDidLoad() {
    super.viewDidLoad()

    // Functions To Throw
    configureTableView()

  }

  // MARK: - Handlers

  func configureTableView() {
    tableView = UITableView()
    tableView.delegate = self
    tableView.dataSource = self
    tableView.register(LMenuOptionCell.self, forCellReuseIdentifier: reuseIdentifier)
    tableView.backgroundColor = .darkGray
    tableView.separatorStyle = .none
    tableView.rowHeight = 80
    view.addSubview(tableView)
    tableView.translatesAutoresizingMaskIntoConstraints = false
    tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
    tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
  }

}

extension LMenuController : UITableViewDataSource, UITableViewDelegate {

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 4
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! LMenuOptionCell
    let menuOption = MenuOption(rawValue: indexPath.row)
    cell.descriptionLabel.text = menuOption?.description
    cell.iconImageView.image = menuOption?.image
    return cell
  }

  func tableView(_ tabeView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let menuOption = MenuOption(rawValue: indexPath.row)
    delegate?.handleMenuToggle(forMenuOption: menuOption)
  }

}
