//
//  Travel.swift
//  LockItPasswordData
//
//  Created by JJ Zapata on 4/27/19.
//  Copyright © 2019 JJ Zapata. All rights reserved.
//

import UIKit
import FirebaseDatabase

class Travel: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // Buttons
    @IBOutlet var TBuyBtn: UIButton!
    
    // Labels
    @IBOutlet var TLabel: UILabel!
    
    // Images
    @IBOutlet var TIcon: UIImageView!
    
    // Variables
    let links = ["Uber", "United", "Lyft", "Expedia", "Waze", "Booking.com", "Duolingo", "TripAdvisor", "Airbnb", "tripIt", "GasBuddy"]
    let travelo = ["Uber", "United", "Lyft", "Expedia", "Waze", "Booking.com", "Duolingo", "TripAdvisor", "Airbnb", "tripIt", "GasBuddy"]
    var array = [String]()
    
    // Firebase Init
    var databaseRefer : DatabaseReference!
    var databaseHandle : DatabaseHandle!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Firebase Init ( Read )
        databaseRefer = Database.database().reference()
        
        // Icon Properties
        self.TIcon.layer.cornerRadius = self.TIcon.frame.height/3
        self.TIcon.clipsToBounds = true
        self.TIcon.layer.maskedCorners = [.layerMinXMinYCorner]
        
        // Button Properties
        self.TBuyBtn.layer.cornerRadius = self.TBuyBtn.frame.height/3
        self.TBuyBtn.clipsToBounds = true
        self.TBuyBtn.layer.maskedCorners = [.layerMaxXMinYCorner]

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "travel", for: indexPath) as! TravelTableView
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
                self.array.append("Uber")
                UserDefaults.standard.set(self.array, forKey: "addedAccounts")
                self.databaseRefer.child(email).child("AddedAccounts").childByAutoId().setValue("Uber")
            case 1:
                self.array.append("United")
                UserDefaults.standard.set(self.array, forKey: "addedAccounts")
                self.databaseRefer.child(email).child("AddedAccounts").childByAutoId().setValue("United")
            case 2:
                self.array.append("Lyft")
                UserDefaults.standard.set(self.array, forKey: "addedAccounts")
                self.databaseRefer.child(email).child("AddedAccounts").childByAutoId().setValue("Lyft")
            case 3:
                self.array.append("Expedia")
                UserDefaults.standard.set(self.array, forKey: "addedAccounts")
                self.databaseRefer.child(email).child("AddedAccounts").childByAutoId().setValue("Expedia")
            case 4:
                self.array.append("Waze")
                UserDefaults.standard.set(self.array, forKey: "addedAccounts")
                self.databaseRefer.child(email).child("AddedAccounts").childByAutoId().setValue("Waze")
            case 5:
                self.array.append("Booking.com")
                UserDefaults.standard.set(self.array, forKey: "addedAccounts")
                self.databaseRefer.child(email).child("AddedAccounts").childByAutoId().setValue("Bookingcom")
            case 6:
                self.array.append("Duolingo")
                UserDefaults.standard.set(self.array, forKey: "addedAccounts")
                self.databaseRefer.child(email).child("AddedAccounts").childByAutoId().setValue("Duolingo")
            case 7:
                self.array.append("TripAdvisor")
                UserDefaults.standard.set(self.array, forKey: "addedAccounts")
                self.databaseRefer.child(email).child("AddedAccounts").childByAutoId().setValue("TripAdviser")
            case 8:
                self.array.append("Airbnb")
                UserDefaults.standard.set(self.array, forKey: "addedAccounts")
                self.databaseRefer.child(email).child("AddedAccounts").childByAutoId().setValue("Airbnb")
            case 9:
                self.array.append("tripIt")
                UserDefaults.standard.set(self.array, forKey: "addedAccounts")
                self.databaseRefer.child(email).child("AddedAccounts").childByAutoId().setValue("tripIt")
            case 10:
                self.array.append("GasBuddy")
                UserDefaults.standard.set(self.array, forKey: "addedAccounts")
                self.databaseRefer.child(email).child("AddedAccounts").childByAutoId().setValue("GasBuddy")
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
