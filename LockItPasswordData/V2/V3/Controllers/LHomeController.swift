import UIKit

class LHomeController : UIViewController {

  // MARK: - Properties

  var tableView = UITableView()
  var delegate : LHomeControllerDelegate?

  // MARK: - Init

  override func viewDidLoad() {
    super.viewDidLoad()
    configureNavigationBar()
    view.backgroundColor = .systemBackground
    
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
    navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "SettingsIcon"), style: .plain, target: self, action: #selector(handleSettings))
    navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(add))
    navigationItem.leftBarButtonItem?.tintColor = UIColor.systemYellow
    navigationItem.rightBarButtonItem?.tintColor = UIColor.systemYellow
    navigationController?.navigationBar.isHidden = false
    navigationItem.hidesBackButton = true
  }
    
    @objc func add() {
        print("Add")
    }

}
