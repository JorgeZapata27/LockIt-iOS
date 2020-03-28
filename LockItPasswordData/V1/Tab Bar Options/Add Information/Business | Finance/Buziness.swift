//
//  Buziness.swift
//  LockItPasswordData
//
//  Created by JJ Zapata on 4/28/19.
//  Copyright © 2019 JJ Zapata. All rights reserved.
//

import UIKit
import FirebaseDatabase

class Buziness: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // Buttons
    @IBOutlet var BBuyBtn: UIButton!
    
    // Labels
    @IBOutlet var BLabel: UILabel!
    
    // Images
    @IBOutlet var BIcon: UIImageView!
    
    // Variables
    let links = ["Evernote", "TCF Bank", "Slack", "Linkden", "Dropbox", "Capital One", "Fifth Third Bank", "Chase Bank", "Outlook", "Wells Fargo", "US Bank", "PNC Bank", "BMO Harris Bank"]
    let travelo = ["Evernote", "TCF Bank", "Slack", "Linkden", "Dropbox", "Capital One", "Fifth Third Bank", "Chase Bank", "Outlook", "Wells Fargo", "US Bank", "PNC Bank", "BMO Harris Bank"]
    var array = [String]()
    
    // Firebase Init
    var databaseRefer : DatabaseReference!
    var databaseHandle : DatabaseHandle!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Firebase Init ( Read )
        databaseRefer = Database.database().reference()
        
        // Icon Properties
        self.BIcon.layer.cornerRadius = self.BIcon.frame.height/3
        self.BIcon.clipsToBounds = true
        self.BIcon.layer.maskedCorners = [.layerMinXMinYCorner]
        
        // Button Properties
        self.BBuyBtn.layer.cornerRadius = self.BBuyBtn.frame.height/3
        self.BBuyBtn.clipsToBounds = true
        self.BBuyBtn.layer.maskedCorners = [.layerMaxXMinYCorner]

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "buzz", for: indexPath) as! BuzInessTableView
        cell.myLabel.text = travelo[indexPath.row]
        cell.myImage.image = UIImage(named: links[indexPath.row] + ".png")
        return (cell)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return (travelo.count)
    }
    
    // Swipe Actions
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration?
    {
        let buy = UIContextualAction(style: .normal, title: "Add") { (action, view, nil) in
            let choice = indexPath.row
            self.createAlert(title: "Your Account", message: "")
            guard let email = UserDefaults.standard.string(forKey: "PASSWORD") else {
                return
            }
            switch choice {
            case 0:
                self.array.append("Evernote")
                UserDefaults.standard.set(self.array, forKey: "addedAccounts")
                self.databaseRefer.child(email).child("AddedAccounts").childByAutoId().setValue("Evernote")
            case 1:
                self.array.append("TCF Bank")
                UserDefaults.standard.set(self.array, forKey: "addedAccounts")
                self.databaseRefer.child(email).child("AddedAccounts").childByAutoId().setValue("TFC Bank")
            case 2:
                self.array.append("Slack")
                UserDefaults.standard.set(self.array, forKey: "addedAccounts")
                self.databaseRefer.child(email).child("AddedAccounts").childByAutoId().setValue("Slack")
            case 3:
                self.array.append("Linkden")
                UserDefaults.standard.set(self.array, forKey: "addedAccounts")
                self.databaseRefer.child(email).child("AddedAccounts").childByAutoId().setValue("Linkden")
            case 4:
                self.array.append("Dropbox")
                UserDefaults.standard.set(self.array, forKey: "addedAccounts")
                self.databaseRefer.child(email).child("AddedAccounts").childByAutoId().setValue("Dropbox")
            case 5:
                self.array.append("Captial One")
                UserDefaults.standard.set(self.array, forKey: "addedAccounts")
                self.databaseRefer.child(email).child("AddedAccounts").childByAutoId().setValue("Captial One")
            case 6:
                self.array.append("Fifth Third Bank")
                UserDefaults.standard.set(self.array, forKey: "addedAccounts")
                self.databaseRefer.child(email).child("AddedAccounts").childByAutoId().setValue("Fifth Third Bank")
            case 7:
                self.array.append("Chase Bank")
                UserDefaults.standard.set(self.array, forKey: "addedAccounts")
                self.databaseRefer.child(email).child("AddedAccounts").childByAutoId().setValue("Chase Bank")
            case 8:
                self.array.append("Outlook")
                UserDefaults.standard.set(self.array, forKey: "addedAccounts")
                self.databaseRefer.child(email).child("AddedAccounts").childByAutoId().setValue("Outlook")
            case 9:
                self.array.append("Wells Fargo")
                UserDefaults.standard.set(self.array, forKey: "addedAccounts")
                self.databaseRefer.child(email).child("AddedAccounts").childByAutoId().setValue("Wells Fargo")
            case 10:
                self.array.append("US Bank")
                UserDefaults.standard.set(self.array, forKey: "addedAccounts")
                self.databaseRefer.child(email).child("AddedAccounts").childByAutoId().setValue("US Bank")
            case 11:
                self.array.append("PNC Bank")
                UserDefaults.standard.set(self.array, forKey: "addedAccounts")
                self.databaseRefer.child(email).child("AddedAccounts").childByAutoId().setValue("PNC Bank")
            case 12:
                self.array.append("BMO Harris Bank")
                UserDefaults.standard.set(self.array, forKey: "addedAccounts")
                self.databaseRefer.child(email).child("AddedAccounts").childByAutoId().setValue("BMO Harris Bank")
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
        let alert = UIAlertController(title: "How To Add An Account", message: "To Add An Account, Swipe To The Left And Press Add. Your Account Will Be Added~", preferredStyle: .alert)
        let okay = UIAlertAction(title: "Got It!", style: .cancel, handler: nil)
        
        alert.addAction(okay)
        present(alert, animated: true, completion: nil)
    }

}
