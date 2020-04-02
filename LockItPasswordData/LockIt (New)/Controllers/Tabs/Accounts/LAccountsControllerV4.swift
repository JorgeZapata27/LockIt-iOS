//
//  LAccountsControllerV4.swift
//  LockItPasswordData
//
//  Created by JJ Zapata on 3/28/20.
//  Copyright © 2020 JJ Zapata. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import SVProgressHUD
import FirebaseStorage
import FirebaseDatabase

struct InfoV4 {
  var image : String?
  var title : String?
}

class LAccountsControllerV4: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let refreshControl = UIRefreshControl()
    var posts = [AccountStructure]()
    var bannerView : GADBannerView!

    @IBOutlet var tableView : UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        posts.removeAll()
        FirebaseRetrieve()

        // Do any additional setup after loading the view.
    }
    
    func FirebaseRetrieve() {
        SVProgressHUD.show(withStatus: "Working...")
        InternetSetup()
    }
    
    func InternetSetup() {
        if CheckInternet.Connection() {
            posts.removeAll()
            tableView.reloadData()
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
                SVProgressHUD.dismiss()
            }
        } else {
            let alert = UIAlertController(title: "No Connection", message: "Please Be Connected To Internet To Access Your LockIt Accounts", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "V4AccountCell", for: indexPath) as! LAccountControllerCellV4
        if posts.count != 0 {
            let accounts = posts[indexPath.row]
            cell.accountImage!.loadImageUsingCacheWithUrlString(accounts.imageURL!)
            cell.accountName!.text! = accounts.Name!
            cell.accountUsername!.text! = accounts.Username!
        } else {
            self.tableView.isHidden = true
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 112
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    var selected = 0
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selected = indexPath.row
        self.performSegue(withIdentifier: "ToAccountInfo", sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ToAccountInfo" {
            let secondController = segue.destination as! LAccountControllerV4
            secondController.usernameInfo = self.posts[selected].Username!
            secondController.imageUrl = self.posts[selected].imageURL!
            secondController.postId = self.posts[selected].postId!
            secondController.passwordInfo = self.posts[selected].Password!
        }
    }

}
