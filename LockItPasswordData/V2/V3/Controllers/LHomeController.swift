import UIKit
import Firebase
import FirebaseAuth
import SVProgressHUD
import FirebaseStorage
import FirebaseDatabase

struct Info {
  var image : String?
  var title : String?
}

class LHomeController : UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let refreshControl = UIRefreshControl()
    var delegate : LHomeControllerDelegate?
    var posts = [AccountStructure]()

      let tableView : UITableView = {
        let tv = UITableView()
        tv.backgroundColor = .systemBackground
        tv.separatorStyle = .singleLine
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
      }()

      var bandCellID : String = "BandCellID"
    
    var names = ["Instagram", "Snapchat", "Facebook", "WhatsApp"]

      // MARK: - Init

      override func viewDidLoad() {
        super.viewDidLoad()
        FirebaseRetrieve()
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
    
    func FirebaseRetrieve() {
        LoadingTheInformationLoader()
        posts.removeAll()
        let uid = Auth.auth().currentUser?.uid
        Database.database().reference().child("Users").child(uid!).child("My_Accounts").observe(.childAdded) { (snapshot) in
            if let value = snapshot.value as? [String : Any] {
                let user = AccountStructure()
                user.imageURL = value["account-ImageUrl"] as? String ?? "Not Found"
                user.Name = value["account-Name"] as? String ?? "Not Found"
                user.Username = value["account-Username"] as? String ?? "Not Found"
                user.Password = value["account-Password"] as? String ?? "Not Found"
                user.postId = value["postID"] as? String ?? "Not Found"
                print(user.imageURL!)
                print(user.Name!)
                print(user.Password!)
                self.posts.append(user)
                self.tableView.reloadData()
            }
        }
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
      }
    
    @objc func refreshControlSwipeUp() {
        FirebaseRetrieve()
        self.refreshControl.endRefreshing()
    }

      func configureNavigationBar() {
        self.tableView.addSubview(refreshControl)
        self.refreshControl.addTarget(self, action: #selector(refreshControlSwipeUp), for: .valueChanged)
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
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.backgroundColor = .systemBackground
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
          tableView.register(LHomeControllerCell.self, forCellReuseIdentifier: bandCellID)
        }

        func tableView(_ tableview: UITableView, numberOfRowsInSection section: Int) -> Int {
            return posts.count
        }

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: bandCellID, for: indexPath) as! LHomeControllerCell
            var users = posts[indexPath.row]
            cell.imageViewImage.loadImageUsingCacheWithUrlString(urlString: users.imageURL!)
            cell.imageViewImage.contentMode = .scaleAspectFill
            cell.nameLabel.text = users.Name!
            return cell
        }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = LEditAccountController() as! LEditAccountController
        controller.username.text = posts[indexPath.row].Username!
        controller.password.text = posts[indexPath.row].Password!
        controller.imageView.loadImageUsingCacheWithUrlString(urlString: posts[indexPath.row].imageURL!)
        controller.postId = posts[indexPath.row].postId!
        self.navigationController?.pushViewController(controller, animated: true)
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
    
    func LoadingTheInformationLoader() {
        SVProgressHUD.show(withStatus: "Working...")
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            SVProgressHUD.dismiss()
        }
    }

}
