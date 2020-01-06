//
//  Sports.swift
//  LockItPasswordData
//
//  Created by JJ Zapata on 4/27/19.
//  Copyright © 2019 JJ Zapata. All rights reserved.
//

import UIKit
import FirebaseDatabase

class Sports: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // Buttons
    @IBOutlet var SBuyBtn: UIButton!
    
    // Labels
    @IBOutlet var SLabel: UILabel!
    
    // Images
    @IBOutlet var SIcon: UIImageView!
    
    var array = [String]()
    
    // Variables
    let links = ["ESPN", "theScore", "Bleacher Report", "NBC Sports", "NFL", "NHL", "Yahoo Sports", "FOX Sports GO", "CBS Sports", "MLB", "GameChanger", "GroupMe"]
    let sports = ["ESPN", "theScore", "Bleacher Report", "NBC Sports", "NFL", "NHL", "Yahoo Sports", "FOX Sports GO", "CBS Sports", "MLB", "GameChanger", "GroupMe"]
    
    // Firebase Init
    var databaseRefer : DatabaseReference!
    var databaseHandle : DatabaseHandle!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Firebase Init ( Read )
        databaseRefer = Database.database().reference()
        
        // Icon Properties
        self.SIcon.layer.cornerRadius = self.SIcon.frame.height/3
        self.SIcon.clipsToBounds = true
        self.SIcon.layer.maskedCorners = [.layerMinXMinYCorner]
        
        // Button Properties
        self.SBuyBtn.layer.cornerRadius = self.SBuyBtn.frame.height/3
        self.SBuyBtn.clipsToBounds = true
        self.SBuyBtn.layer.maskedCorners = [.layerMaxXMinYCorner]

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "sports", for: indexPath) as! SportsTableView
        cell.myLabel.text = sports[indexPath.row]
        cell.myImage.image = UIImage(named: links[indexPath.row] + ".png")
        return (cell)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return (sports.count)
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
                self.array.append("ESPN")
                UserDefaults.standard.set(self.array, forKey: "addedAccounts")
                self.databaseRefer.child(email).child("AddedAccounts").childByAutoId().setValue("ESPN")
            case 1:
                self.array.append("theScore")
                UserDefaults.standard.set(self.array, forKey: "addedAccounts")
                self.databaseRefer.child(email).child("AddedAccounts").childByAutoId().setValue("theScore")
            case 2:
                self.array.append("Bleacher Report")
                UserDefaults.standard.set(self.array, forKey: "addedAccounts")
                self.databaseRefer.child(email).child("AddedAccounts").childByAutoId().setValue("Bleacher Report")
            case 3:
                self.array.append("NBC Sports")
                UserDefaults.standard.set(self.array, forKey: "addedAccounts")
                self.databaseRefer.child(email).child("AddedAccounts").childByAutoId().setValue("NBC Sports")
            case 4:
                self.array.append("NFL")
                UserDefaults.standard.set(self.array, forKey: "addedAccounts")
                self.databaseRefer.child(email).child("AddedAccounts").childByAutoId().setValue("NFL")
            case 5:
                self.array.append("NHL")
                UserDefaults.standard.set(self.array, forKey: "addedAccounts")
                self.databaseRefer.child(email).child("AddedAccounts").childByAutoId().setValue("NHL")
            case 6:
                self.array.append("Yahoo Sports")
                UserDefaults.standard.set(self.array, forKey: "addedAccounts")
                self.databaseRefer.child(email).child("AddedAccounts").childByAutoId().setValue("Yahoo Sports")
            case 7:
                self.array.append("FOX Sports GO")
                UserDefaults.standard.set(self.array, forKey: "addedAccounts")
                self.databaseRefer.child(email).child("AddedAccounts").childByAutoId().setValue("FOX Sports GO")
            case 8:
                self.array.append("CBS Sports")
                UserDefaults.standard.set(self.array, forKey: "addedAccounts")
                self.databaseRefer.child(email).child("AddedAccounts").childByAutoId().setValue("CBS Sports")
            case 9:
                self.array.append("MLB")
                UserDefaults.standard.set(self.array, forKey: "addedAccounts")
                self.databaseRefer.child(email).child("AddedAccounts").childByAutoId().setValue("MLB")
            case 10:
                self.array.append("GameChanger")
                UserDefaults.standard.set(self.array, forKey: "addedAccounts")
                self.databaseRefer.child(email).child("AddedAccounts").childByAutoId().setValue("GameChanger")
            case 11:
                self.array.append("GroupMe")
                UserDefaults.standard.set(self.array, forKey: "addedAccounts")
                self.databaseRefer.child(email).child("AddedAccounts").childByAutoId().setValue("GroupMe")
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
    
    func createAlert(title: String, message: String)
    {
        let alert = UIAlertController(title: "We Have Successfully Added \(title) To Your Added Accounts!", message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Okay!", style: .default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
        }))
        
        self.present(alert, animated: true, completion: nil)
    }

}
