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
        askPlease()
        configureNavigationBar()
        view.backgroundColor = .systemBackground
        configureUI()
      }

        override func viewDidAppear(_ animated: Bool) {
            askPlease()
            configureNavigationBar()
            configureUI()
        }

        override func viewWillAppear(_ animated: Bool) {
            askPlease()
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
            cell.pictureImageView.layer.cornerRadius = 10
            cell.pictureImageView.contentMode = .scaleAspectFill
            cell.pictureImageView.layer.masksToBounds = true
            cell.backgroundColor = .systemBackground
            cell.titleLabel.text = bandsArray[indexPath.item].title
            return cell
        }

        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 60
        }
        
        func askPlease() {
            
            if traitCollection.userInterfaceStyle == .dark {
                print("Dark mode")
            } else {
                print("Light mode")
                let Dark = UserDefaults.standard.bool(forKey: "DarkMode")
                if Dark == true {
                    print("No Action")
                } else {
                    print("Should Change")
                    let alert = UIAlertController(title: "Dark Mode Reccomended", message: "Light Mode Works, But We Reccomend Using Dark Mode To Experience LockIt Fully!", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Stay", style: .default) { (action) in
                        UserDefaults.standard.set(true, forKey: "DarkMode")
                    })
                    alert.addAction(UIAlertAction(title: "Change", style: .default) { (action) in
                        UserDefaults.standard.set(true, forKey: "DarkMode")
                        if let url = URL(string: "https://support.apple.com/en-us/HT210332") {
                            UIApplication.shared.open(url)
                        }
                    })
                    self.present(alert, animated: true, completion: nil)
                }
            }
        }

}
