//
//  LoginController.swift
//  LockItPasswordData
//
//  Created by JJ Zapata on 12/20/19.
//  Copyright © 2019 JJ Zapata. All rights reserved.
//

import Foundation
import UIKit
import Firebase

private let reuseIdentifier = "SettingsCell"

class LSettingsController : UIViewController {

      // MARK: - Properties

      var tableView: UITableView!
      var userInfoHeader: UserInfoHeader!

      // MARK: - Init

      override func viewDidLoad() {
          super.viewDidLoad()

          // Functions To Throw
          configureeUI()
        Firebase()
      }
    
    override func viewDidAppear(_ animated: Bool) {
        configureeUI()
        Firebase()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        configureeUI()
        Firebase()
    }
    
    func Firebase() {
        let uid = Auth.auth().currentUser!.uid
        Database.database().reference().child("Users").child(uid).child("profileImageURL").observe(.value, with: { (data) in
            let name : String = (data.value as? String)!
            self.userInfoHeader.profileImageView.loadImageUsingCacheWithUrlString(urlString: name)
        })
        Database.database().reference().child("Users").child(uid).child("email").observe(.value, with: { (data) in
            let name : String = (data.value as? String)!
            self.userInfoHeader.emailLabel.text = name
            debugPrint(name)
        })
        Database.database().reference().child("Users").child(uid).child("name").observe(.value, with: { (data) in
            let name : String = (data.value as? String)!
            self.userInfoHeader.usernameLabel.text = name
            debugPrint(name)
        })
    }

      // MARK: - Helper Functions

      func configureTableView() {
          tableView = UITableView()
          tableView.delegate = self
          tableView.dataSource = self
          tableView.rowHeight = 60
          tableView.register(SettingsCell.self, forCellReuseIdentifier: reuseIdentifier)
          view.addSubview(tableView)
          tableView.frame = view.frame

          let frame = CGRect(x: 0, y: 88, width: view.frame.width, height: 100)
          userInfoHeader = UserInfoHeader(frame: frame)
          tableView.tableHeaderView = userInfoHeader
          tableView.tableFooterView = UIView()
      }

      func configureeUI() {
          configureTableView()
            view.backgroundColor = .systemBackground
            navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.isHidden = false
            navigationItem.title = "Settings"
        navigationController?.navigationBar.tintColor = UIColor.systemYellow
      }
    
    @objc func add() {
        print("dsjf;")
    }

      // MARK: - Handlers

      @objc func handleLogOut() {
        try! Auth.auth().signOut()
        print("Logged Out")
        print("Move To Login/SignUp Scrren")
      }

}

extension LSettingsController: UITableViewDelegate, UITableViewDataSource {

      func numberOfSections(in tableView: UITableView) -> Int {
          return LSettingsSection.allCases.count
      }

      func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let section = LSettingsSection(rawValue: section) else { return 0 }
          switch section {
            case .Social: return LSocialOptions.allCases.count
            case .Communications: return LCommunicationOptions.allCases.count
          }
      }

      func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
          let view = UIView()
          view.backgroundColor = .darkGray
          let title = UILabel()
          title.font = UIFont.boldSystemFont(ofSize: 16)
          title.textColor = .secondarySystemBackground
          title.text = LSettingsSection(rawValue: section)?.description
          view.addSubview(title)
          title.translatesAutoresizingMaskIntoConstraints = false
          title.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
          title.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 12).isActive = true

          return view
      }
 
      func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
          return 40
      }

      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! SettingsCell
          guard let section = LSettingsSection(rawValue: indexPath.section) else { return UITableViewCell() }
          switch section {
            case .Social:
              let social = LSocialOptions(rawValue: indexPath.row)
              cell.sectionType = social
            case .Communications:
              let communications = LCommunicationOptions(rawValue: indexPath.row)
              cell.sectionType = communications
          }
          return cell
      }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let section = LSettingsSection(rawValue: indexPath.section) else { return }
        switch section {
          case .Social:
            print(LSocialOptions(rawValue: indexPath.row)?.description)
            if LSocialOptions(rawValue: indexPath.row)!.rawValue == 0 {
                print("Edit")
                self.navigationController?.pushViewController(LEditProfile(), animated: true)
            } else if LSocialOptions(rawValue: indexPath.row)!.rawValue == 1 {
                print("Logout")
                do {
                    try Auth.auth().signOut()
                    let controller = LLoginController()
                    controller.modalPresentationStyle = .fullScreen
                    present(controller, animated: true, completion: nil)
                } catch let error {
                    print(error)
                }
            }
          case .Communications:
            print(LCommunicationOptions(rawValue: indexPath.row)?.description)
            if LCommunicationOptions(rawValue: indexPath.row)!.rawValue == 0 {
                print("Old Info")
                let alertController = UIAlertController(title: "Unable To Open", message: "Please Contact Us For More Information About What Account Your Are Looking For. We Recommend You Updating Your Information To Our Newer System. Email LockItInformation@gmail.com For More Help", preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                self.present(alertController, animated: true, completion: nil)
            } else if LCommunicationOptions(rawValue: indexPath.row)!.rawValue == 1 {
                print("Report Error")
                self.navigationController?.pushViewController(LReportErrorController(), animated: true)
            } else if LCommunicationOptions(rawValue: indexPath.row)!.rawValue == 2 {
                print("Report Error")
                self.navigationController?.pushViewController(LReportErrorController(), animated: true)
            }
        }
      }
  }
