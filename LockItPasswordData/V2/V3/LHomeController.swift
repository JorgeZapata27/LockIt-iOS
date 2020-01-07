import UIKit

class LHomeController : UIViewController {

  // MARK: - Properties

  var tableView = UITableView()
  var delegate : LHomeControllerDelegate?

  // MARK: - Init

  override func viewDidLoad() {
    super.viewDidLoad()
    configureNavigationBar()
    view.backgroundColor = .red
    
  }
    
    override func viewDidAppear(_ animated: Bool) {
        configureNavigationBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        configureNavigationBar()
    }

  // MARK: - Handlers

  @objc func handleSettings() {
    print("Toggle Menu")
//    self.delegate?.handleMenuToggle(forMenuOption: nil)
    self.navigationController?.pushViewController(LSettingsController(), animated: true)
  }

  @objc func handleAddTapped() {
    print("Toggle Custom Add. ")
    // Perform Segue
  }

  func configureNavigationBar() {
    navigationController?.navigationBar.barTintColor = .systemBackground
    navigationItem.title = "Accounts"
    navigationController?.navigationBar.prefersLargeTitles = true
    navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "online"), style: .plain, target: self, action: #selector(handleSettings))
    navigationController?.navigationBar.isHidden = false
    
  }

}
