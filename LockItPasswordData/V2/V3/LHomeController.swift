import UIKit

class LHomeController : UIViewController {

  // MARK: - Properties

  var tableView = UITableView()
  var delegate : LHomeControllerDelegate?

  // MARK: - Init

  override func viewDidLoad() {
    super.viewDidLoad()

    view.backgroundColor =  .systemBackground
    configureNavigationBar()
    
  }
    
    override func viewWillAppear(_ animated: Bool) {
        configureNavigationBar()
    }

  // MARK: - Handlers

  @objc func handleMenuToggle() {
    print("Toggle Menu")
    self.delegate?.handleMenuToggle(forMenuOption: nil)
  }

  @objc func handleAddTapped() {
    print("Toggle Custom Add. ")
    // Perform Segue
  }

  func configureNavigationBar() {
    navigationController?.navigationBar.barTintColor = .systemBackground
    navigationItem.title = "Accounts"
    navigationController?.navigationBar.prefersLargeTitles = true
    navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "VISA-TEXT"), style: .plain, target: self, action: #selector(handleMenuToggle))
    navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "VISA-TEXT"), style: .plain, target: self, action: #selector(handleMenuToggle))
  }

}
