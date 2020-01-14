import UIKit
import FirebaseAuth

struct Info {
  var image : String?
  var title : String?
}

class LHomeController : UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var delegate : LHomeControllerDelegate?

      let tableView : UITableView = {
        let tv = UITableView()
        tv.backgroundColor = .systemBackground
        tv.separatorStyle = .singleLine
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.allowsSelection = false
        return tv
      }()

      var bandCellID : String = "BandCellID"

      var bandsArray = [Info(image: "Instagram", title: "Instagram"),
                        Info(image: "Snapchat", title: "Snapchat"),
                        Info(image: "Facebook", title: "Facebook"),
                        Info(image: "WhatsApp", title: "WhatsApp")]

      // MARK: - Init

      override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
        view.backgroundColor = .systemBackground
        configureUI()
      }

        override func viewDidAppear(_ animated: Bool) {
            configureNavigationBar()
            configureUI()
        }

        override func viewWillAppear(_ animated: Bool) {
            configureNavigationBar()
            configureUI()
        }

      // MARK: - Handlers

      @objc func handleSettings() {
        print("Toggle Menu")
    //    self.delegate?.handleMenuToggle(forMenuOption: nil)
        self.navigationController?.pushViewController(LSettingsController(), animated: true)
      }

      @objc func handleAddTapped() {
        print("Toggle Custom Add. ")
        self.navigationController?.pushViewController(LAddAccountController(), animated: true)
        // Perform Segue
      }

      func configureNavigationBar() {
        navigationController?.navigationBar.barTintColor = .systemBackground
        navigationItem.title = "Accounts"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "SettingsIcon"), style: .plain, target: self, action: #selector(handleSettings))
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(handleAddTapped))
        navigationItem.leftBarButtonItem?.tintColor = UIColor.systemYellow
        navigationItem.rightBarButtonItem?.tintColor = UIColor.systemYellow
        navigationController?.navigationBar.isHidden = false
        navigationItem.hidesBackButton = true
        navigationController?.navigationBar.tintColor = .systemYellow
      }

        @objc func add() {
            print("Add")
        }

        func configureUI() {
          view.addSubview(tableView)
          tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
          tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
          tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
          tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
          tableView.delegate = self
          tableView.dataSource = self
          tableView.register(BandCell.self, forCellReuseIdentifier: bandCellID)
        }

        func tableView(_ tableview: UITableView, numberOfRowsInSection section: Int) -> Int {
            return bandsArray.count
        }

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: bandCellID, for: indexPath) as! BandCell
            cell.pictureImageView.image = UIImage(named: bandsArray[indexPath.item].image!)
            cell.pictureImageView.layer.cornerRadius = 5
            cell.backgroundColor = .systemBackground
            cell.titleLabel.text = bandsArray[indexPath.item].title
            return cell
        }

        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 60
        }

}
