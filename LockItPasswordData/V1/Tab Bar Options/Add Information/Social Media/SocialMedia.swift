//
//  SocialMedia.swift
//  LockItPasswordData
//
//  Created by JJ Zapata on 4/27/19.
//  Copyright © 2019 JJ Zapata. All rights reserved.
//

import UIKit
import FirebaseDatabase

class SocialMedia: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // Buttons
    @IBOutlet var BuyBtn: UIButton!
    
    // Labels
    @IBOutlet var SMBtn: UILabel!
    
    // Image Views
    @IBOutlet var SMIcon: UIImageView!
    
    // Variables
    let links = ["Instagram", "Snapchat", "VSCO", "Pinterest", "Tiktok", "Twitter", "Facebook", "Google", "Flickr", "iFunny", "Tumblr", "Viber", "Vine", "WhatsApp"]
    let socials = ["Instagram", "Snapchat", "VSCO", "Pinterest", "Tiktok", "Twitter", "Facebook", "Google", "Flickr", "iFunny", "Tumblr", "Viber", "Vine", "WhatsApp" ]
    var array = [String]()
    
    // Firebase Init
    var databaseRefer : DatabaseReference!
    var databaseHandle : DatabaseHandle!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Firebase Init ( Read )
        databaseRefer = Database.database().reference()
        //databaseRefer.child("name").childByAutoId().setValue("Visal")
        //databaseRefer.child("name").childByAutoId().setValue("Hello")
        
        // Firebase Init ( Write )
        /*databaseHandle = databaseRefer.child("name").observe(.childAdded, with: { (data) in
            let name : String = (data.value as? String)!
            debugPrint(name)
        })*/
        
        // Icon Properties
        self.SMIcon.layer.cornerRadius = self.SMIcon.frame.height/3
        self.SMIcon.clipsToBounds = true
        self.SMIcon.layer.maskedCorners = [.layerMinXMinYCorner]
        
        // Button Properties
        self.BuyBtn.layer.cornerRadius = self.BuyBtn.frame.height/3
        self.BuyBtn.clipsToBounds = true
        self.BuyBtn.layer.maskedCorners = [.layerMaxXMinYCorner]

        // Do any additional setup after loading the view.
    }
    
    // Table View Configuration
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SocialMediaOptions
        
        cell.myImage.image = UIImage(named: links[indexPath.row]+".png")
        cell.myLabel.text = socials[indexPath.row]
        return (cell)
    }
    
    // Rows In TableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return (socials.count)
    }
    
    // Swipe Actions
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration?
    {
        let buy = UIContextualAction(style: .normal, title: "Add") { (action, view, nil) in
            let choice = indexPath.row
            guard let email = UserDefaults.standard.string(forKey: "PASSWORD") else {
                return
            }
            switch choice {
            case 0:
                self.array.append("Instagram")
                UserDefaults.standard.set(self.array, forKey: "addedAccounts")
                self.databaseRefer.child(email).child("AddedAccounts").childByAutoId().setValue("Instagram")
                self.createAlert(title: "Instagram", message: "")
            case 1:
                self.array.append("Snapchat")
                UserDefaults.standard.set(self.array, forKey: "addedAccounts")
                self.databaseRefer.child(email).child("AddedAccounts").childByAutoId().setValue("Snapchat")
                self.createAlert(title: "Snapchat", message: "")
            case 2:
                self.array.append("VSCO")
                UserDefaults.standard.set(self.array, forKey: "addedAccounts")
                self.databaseRefer.child(email).child("AddedAccounts").childByAutoId().setValue("VSCO")
                self.createAlert(title: "VSCO", message: "")
            case 3:
                self.array.append("Pinterest")
                UserDefaults.standard.set(self.array, forKey: "addedAccounts")
                self.databaseRefer.child(email).child("AddedAccounts").childByAutoId().setValue("Pinterest")
                self.createAlert(title: "Pinterest", message: "")
            case 4:
                self.array.append("Tiktok")
                UserDefaults.standard.set(self.array, forKey: "addedAccounts")
                self.databaseRefer.child(email).child("AddedAccounts").childByAutoId().setValue("TikTok")
                self.createAlert(title: "Tiktok", message: "")
            case 5:
                self.array.append("Twitter")
                UserDefaults.standard.set(self.array, forKey: "addedAccounts")
                self.databaseRefer.child(email).child("AddedAccounts").childByAutoId().setValue("Twitter")
                self.createAlert(title: "Twitter", message: "")
            case 6:
                self.array.append("Facebook")
                UserDefaults.standard.set(self.array, forKey: "Facebook")
                self.databaseRefer.child(email).child("AddedAccounts").childByAutoId().setValue("Facebook")
                self.createAlert(title: "Facebook", message: "")
            case 7:
                self.array.append("Google")
                UserDefaults.standard.set(self.array, forKey: "addedAccounts")
                self.databaseRefer.child(email).child("AddedAccounts").childByAutoId().setValue("Google")
                self.createAlert(title: "Google", message: "")
            case 8:
                self.array.append("Flickr")
                UserDefaults.standard.set(self.array, forKey: "addedAccounts")
                self.databaseRefer.child(email).child("AddedAccounts").childByAutoId().setValue("Flickr")
                self.createAlert(title: "Flickr", message: "")
            case 9:
                self.array.append("iFunny")
                UserDefaults.standard.set(self.array, forKey: "addedAccounts")
                self.databaseRefer.child(email).child("AddedAccounts").childByAutoId().setValue("iFunny")
                self.createAlert(title: "iFunny", message: "")
            case 10:
                self.array.append("Tumblr")
                UserDefaults.standard.set(self.array, forKey: "addedAccounts")
                self.databaseRefer.child(email).child("AddedAccounts").childByAutoId().setValue("Tumblr")
                self.createAlert(title: "Tumblr", message: "")
            case 11:
                self.array.append("Viber")
                UserDefaults.standard.set(self.array, forKey: "addedAccounts")
                self.databaseRefer.child(email).child("AddedAccounts").childByAutoId().setValue("Viber")
                self.createAlert(title: "Viber", message: "")
            case 12:
                self.array.append("Vine")
                UserDefaults.standard.set(self.array, forKey: "addedAccounts")
                self.databaseRefer.child(email).child("AddedAccounts").childByAutoId().setValue("Vine")
                self.createAlert(title: "Vine", message: "")
            case 13:
                self.array.append("WhatsApp")
                UserDefaults.standard.set(self.array, forKey: "WhatsApp")
                self.databaseRefer.child(email).child("AddedAccounts").childByAutoId().setValue("WhatsApp")
                self.createAlert(title: "WhatsApp", message: "")
            default:
                print("Error")
                print(self.array)
            }
        }
        buy.backgroundColor = .darkGray
        let config = UISwipeActionsConfiguration(actions: [buy])
        config.performsFirstActionWithFullSwipe = true
        
        return config
    }
    
    func swipe()
    {
        let alert = UIAlertController(title: "How To Add An Account", message: "To Add An Account, Swipe To The Left And Press Add. Your Account Will Be Added!", preferredStyle: .alert)
        let okay = UIAlertAction(title: "Got It!", style: .cancel, handler: nil)
        
        alert.addAction(okay)
        present(alert, animated: true, completion: nil)
    }

}
