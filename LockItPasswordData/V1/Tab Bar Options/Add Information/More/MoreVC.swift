//
//  MoreVC.swift
//  LockItPasswordData
//
//  Created by JJ Zapata on 6/1/19.
//  Copyright © 2019 JJ Zapata. All rights reserved.
//

import UIKit
import FirebaseDatabase

class MoreVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    
    let options = ["Chick-Fil-A", "Credit Karma", "Discord", "Domino’s Pizza", "Door-Dash", "Fitbit", "Groupon", "Houseparty", "Hulu", "LockIt", "McDonalds", "Match", "Microsoft", "Netflix", "Pandora", "PayPal", "PhotoMath", "iHeartRadio", "Reddit", "Redfin", "Remind", "Roku", "Skype", "Southwest", "Spotify", "Starbucks", "Strava", "GoodReads", "Vimeo", "Verizon", "HBO Now", "The Weather Channel", "stackoverflow", "Flipboard", "Ticket Master", "Discovery GO", "Zillow", "Xbox", "Bitmoji", "Trivia Crack", "TurboTax", "Viber", "Twitch", "Tinder", "Yelp", "Luftansa", "Emirates", "Delta", "Spirit", "Powerschool", "Quora"]
    let images = ["Chick-Fil-A", "Credit Karma", "Discord", "Domino’s Pizza", "Door-Dash", "Fitbit", "Groupon", "Houseparty", "Hulu", "LockIt", "McDonalds", "Match", "Microsoft", "Netflix", "Pandora", "PayPal", "PhotoMath", "iHeartRadio", "Reddit", "Redfin", "Remind", "Roku", "Skype", "Southwest", "Spotify", "Starbucks", "Strava", "GoodReads", "Vimeo", "Verizon", "HBO Now", "The Weather Channel", "stackoverflow", "Flipboard", "Ticket Master", "Discovery GO", "Zillow", "Xbox", "Bitmoji", "Trivia Crack", "TurboTax", "Viber", "Twitch", "Tinder", "Yelp", "Luftansa", "Emirates", "Delta", "Spirit", "Powerschool", "Quora"]
    
    var searchingNames = [String()]
    
    var isSearching = false
    
    var canISwipe = false
    
    var array = [String]()
    
    // Firebase Init
    var databaseRefer : DatabaseReference!
    var databaseHandle : DatabaseHandle!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Firebase Init ( Read )
        databaseRefer = Database.database().reference()

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if isSearching
        {
            return searchingNames.count
        }
        else
        {
            return options.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "moreOptions")
        if isSearching
        {
            cell?.textLabel?.text = searchingNames[indexPath.row]
            cell?.textLabel?.textColor = .white
           cell?.imageView?.image = UIImage(named: "dfkjld")
        }
        else
        {
            cell?.textLabel?.text = options[indexPath.row]
            cell?.textLabel?.textColor = .white
           // cell?.imageView?.contentMode = .scaleAspectFit
            //cell?.imageView?.image = UIImage(named: images[indexPath.row])
            cell?.textLabel?.font = UIFont(name: "Helvetica Neue", size: 15)
        }
        
        return cell!
    }
    
    // Hides keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        self.view.endEditing(true)
    }
    
    // Return key
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        textField.resignFirstResponder()
        return (true)
    }
    
    // Swipe Actions
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration?
    {
        canISwipe = true
        let buy = UIContextualAction(style: .normal, title: "Add") { (action, view, nil) in
            let choice = indexPath.row
            self.createAlert(title: "Your Account", message: "")
            guard let email = UserDefaults.standard.string(forKey: "PASSWORD") else {
                return
            }
            switch choice {
            case 0:
                self.array.append("Chick-Fil-A")
                UserDefaults.standard.set(self.array, forKey: "addedAccounts")
                self.databaseRefer.child(email).child("AddedAccounts").childByAutoId().setValue("ChickFilA")
            case 1:
                self.array.append("Credit Karma")
                UserDefaults.standard.set(self.array, forKey: "addedAccounts")
                self.databaseRefer.child(email).child("AddedAccounts").childByAutoId().setValue("Credit Karma")
            case 2:
                self.array.append("Discord")
                UserDefaults.standard.set(self.array, forKey: "addedAccounts")
                self.databaseRefer.child(email).child("AddedAccounts").childByAutoId().setValue("Discord")
            case 3:
                self.array.append("Domino's Pizza")
                UserDefaults.standard.set(self.array, forKey: "addedAccounts")
                self.databaseRefer.child(email).child("AddedAccounts").childByAutoId().setValue("Dominos Pizza")
            case 4:
                self.array.append("Door-Dash")
                UserDefaults.standard.set(self.array, forKey: "addedAccounts")
                self.databaseRefer.child(email).child("AddedAccounts").childByAutoId().setValue("DoorDash")
            case 5:
                self.array.append("Fitbit")
                UserDefaults.standard.set(self.array, forKey: "addedAccounts")
                self.databaseRefer.child(email).child("AddedAccounts").childByAutoId().setValue("Fitbit")
            case 6:
                self.array.append("Groupon")
                UserDefaults.standard.set(self.array, forKey: "addedAccounts")
                self.databaseRefer.child(email).child("AddedAccounts").childByAutoId().setValue("Groupon")
            case 7:
                self.array.append("Houseparty")
                UserDefaults.standard.set(self.array, forKey: "addedAccounts")
                self.databaseRefer.child(email).child("AddedAccounts").childByAutoId().setValue("Houseparty")
            case 8:
                self.array.append("Hulu")
                UserDefaults.standard.set(self.array, forKey: "addedAccounts")
                self.databaseRefer.child(email).child("AddedAccounts").childByAutoId().setValue("Hulu")
            case 9:
                self.array.append("LockIt")
                UserDefaults.standard.set(self.array, forKey: "addedAccounts")
                self.databaseRefer.child(email).child("AddedAccounts").childByAutoId().setValue("LockIt")
            case 10:
                self.array.append("McDonalds")
                UserDefaults.standard.set(self.array, forKey: "addedAccounts")
                self.databaseRefer.child(email).child("AddedAccounts").childByAutoId().setValue("McDonalds")
            case 11:
                self.array.append("Match")
                UserDefaults.standard.set(self.array, forKey: "addedAccounts")
                self.databaseRefer.child(email).child("AddedAccounts").childByAutoId().setValue("Match")
            case 12:
                self.array.append("Microsoft")
                UserDefaults.standard.set(self.array, forKey: "addedAccounts")
                self.databaseRefer.child(email).child("AddedAccounts").childByAutoId().setValue("Microsoft")
            case 13:
                self.array.append("Netflix")
                UserDefaults.standard.set(self.array, forKey: "addedAccounts")
                self.databaseRefer.child(email).child("AddedAccounts").childByAutoId().setValue("Netflix")
            case 14:
                self.array.append("Pandora")
                UserDefaults.standard.set(self.array, forKey: "addedAccounts")
                self.databaseRefer.child(email).child("AddedAccounts").childByAutoId().setValue("Pandora")
            case 15:
                self.array.append("PayPal")
                UserDefaults.standard.set(self.array, forKey: "addedAccounts")
                self.databaseRefer.child(email).child("AddedAccounts").childByAutoId().setValue("PayPal")
            case 16:
                self.array.append("PhotoMath")
                UserDefaults.standard.set(self.array, forKey: "addedAccounts")
                self.databaseRefer.child(email).child("AddedAccounts").childByAutoId().setValue("PhotoMath")
            case 17:
                self.array.append("iHeartRadio")
                UserDefaults.standard.set(self.array, forKey: "addedAccounts")
                self.databaseRefer.child(email).child("AddedAccounts").childByAutoId().setValue("iHeartRadio")
            case 18:
                self.array.append("Reddit")
                UserDefaults.standard.set(self.array, forKey: "addedAccounts")
                self.databaseRefer.child(email).child("AddedAccounts").childByAutoId().setValue("Reddit")
            case 19:
                self.array.append("Redfin")
                UserDefaults.standard.set(self.array, forKey: "addedAccounts")
                self.databaseRefer.child(email).child("AddedAccounts").childByAutoId().setValue("Redfin")
            case 20:
                self.array.append("Remind")
                UserDefaults.standard.set(self.array, forKey: "addedAccounts")
                self.databaseRefer.child(email).child("AddedAccounts").childByAutoId().setValue("Remind")
            case 21:
                self.array.append("Roku")
                UserDefaults.standard.set(self.array, forKey: "addedAccounts")
                self.databaseRefer.child(email).child("AddedAccounts").childByAutoId().setValue("Roku")
            case 22:
                self.array.append("Skype")
                UserDefaults.standard.set(self.array, forKey: "addedAccounts")
                self.databaseRefer.child(email).child("AddedAccounts").childByAutoId().setValue("Skype")
            case 23:
                self.array.append("Southwest")
                UserDefaults.standard.set(self.array, forKey: "addedAccounts")
                self.databaseRefer.child(email).child("AddedAccounts").childByAutoId().setValue("Southwest")
            case 24:
                self.array.append("Spotify")
                UserDefaults.standard.set(self.array, forKey: "addedAccounts")
                self.databaseRefer.child(email).child("AddedAccounts").childByAutoId().setValue("Spotify")
            case 25:
                self.array.append("Starbucks")
                UserDefaults.standard.set(self.array, forKey: "addedAccounts")
                self.databaseRefer.child(email).child("AddedAccounts").childByAutoId().setValue("Starbucks")
            case 26:
                self.array.append("Strava")
                UserDefaults.standard.set(self.array, forKey: "addedAccounts")
                self.databaseRefer.child(email).child("AddedAccounts").childByAutoId().setValue("Strava")
            case 27:
                self.array.append("goodReads")
                UserDefaults.standard.set(self.array, forKey: "addedAccounts")
                self.databaseRefer.child(email).child("AddedAccounts").childByAutoId().setValue("goodReads")
            case 28:
                self.array.append("Vimeo")
                UserDefaults.standard.set(self.array, forKey: "addedAccounts")
                self.databaseRefer.child(email).child("AddedAccounts").childByAutoId().setValue("Vimeo")
            case 29:
                self.array.append("Verizon")
                UserDefaults.standard.set(self.array, forKey: "addedAccounts")
                self.databaseRefer.child(email).child("AddedAccounts").childByAutoId().setValue("Verizon")
            case 30:
                self.array.append("HBO Now")
                UserDefaults.standard.set(self.array, forKey: "addedAccounts")
                self.databaseRefer.child(email).child("AddedAccounts").childByAutoId().setValue("HBO Now")
            case 33:
                self.array.append("The Weather Channel")
                UserDefaults.standard.set(self.array, forKey: "addedAccounts")
                self.databaseRefer.child(email).child("AddedAccounts").childByAutoId().setValue("The Weather Channel")
            case 34:
                self.array.append("stackoverflow")
                UserDefaults.standard.set(self.array, forKey: "addedAccounts")
                self.databaseRefer.child(email).child("AddedAccounts").childByAutoId().setValue("stackoverflow")
            case 35:
                self.array.append("Flipboard")
                UserDefaults.standard.set(self.array, forKey: "addedAccounts")
                self.databaseRefer.child(email).child("AddedAccounts").childByAutoId().setValue("Flipboard")
            case 36:
                self.array.append("Ticket Master")
                UserDefaults.standard.set(self.array, forKey: "addedAccounts")
                self.databaseRefer.child(email).child("AddedAccounts").childByAutoId().setValue("Ticket Master")
            case 37:
                self.array.append("Discovery GO")
                UserDefaults.standard.set(self.array, forKey: "addedAccounts")
                self.databaseRefer.child(email).child("AddedAccounts").childByAutoId().setValue("Discovery GO")
            case 38:
                self.array.append("Zillow")
                UserDefaults.standard.set(self.array, forKey: "addedAccounts")
                self.databaseRefer.child(email).child("AddedAccounts").childByAutoId().setValue("Zillow")
            case 39:
                self.array.append("Xbox")
                UserDefaults.standard.set(self.array, forKey: "addedAccounts")
                self.databaseRefer.child(email).child("AddedAccounts").childByAutoId().setValue("Xboc")
            case 40:
                self.array.append("Bitmoji")
                UserDefaults.standard.set(self.array, forKey: "addedAccounts")
                self.databaseRefer.child(email).child("AddedAccounts").childByAutoId().setValue("Bitmoji")
            case 41:
                self.array.append("Trivia Crack")
                UserDefaults.standard.set(self.array, forKey: "addedAccounts")
                self.databaseRefer.child(email).child("AddedAccounts").childByAutoId().setValue("Trivia Crack")
            case 42:
                self.array.append("TurboTax")
                UserDefaults.standard.set(self.array, forKey: "addedAccounts")
                self.databaseRefer.child(email).child("AddedAccounts").childByAutoId().setValue("TurboTax")
            case 43:
                self.array.append("Viber")
                UserDefaults.standard.set(self.array, forKey: "addedAccounts")
                self.databaseRefer.child(email).child("AddedAccounts").childByAutoId().setValue("Viber")
            case 44:
                self.array.append("Twitch")
                UserDefaults.standard.set(self.array, forKey: "addedAccounts")
                self.databaseRefer.child(email).child("AddedAccounts").childByAutoId().setValue("Twitch")
            case 45:
                self.array.append("Tinder")
                UserDefaults.standard.set(self.array, forKey: "addedAccounts")
                self.databaseRefer.child(email).child("AddedAccounts").childByAutoId().setValue("Tinder")
            case 46:
                self.array.append("Yelp")
                UserDefaults.standard.set(self.array, forKey: "addedAccounts")
                self.databaseRefer.child(email).child("AddedAccounts").childByAutoId().setValue("Yelp")
            case 47:
                self.array.append("Luftansa")
                UserDefaults.standard.set(self.array, forKey: "addedAccounts")
                self.databaseRefer.child(email).child("AddedAccounts").childByAutoId().setValue("Luftansa")
            case 48:
                self.array.append("Emirates")
                UserDefaults.standard.set(self.array, forKey: "addedAccounts")
                self.databaseRefer.child(email).child("AddedAccounts").childByAutoId().setValue("Emirates")
            case 49:
                self.array.append("Delta")
                UserDefaults.standard.set(self.array, forKey: "addedAccounts")
                self.databaseRefer.child(email).child("AddedAccounts").childByAutoId().setValue("Delta")
            case 50:
                self.array.append("Spirit")
                UserDefaults.standard.set(self.array, forKey: "addedAccounts")
                self.databaseRefer.child(email).child("AddedAccounts").childByAutoId().setValue("Spirit")
            case 51:
                self.array.append("PowerSchool")
                UserDefaults.standard.set(self.array, forKey: "addedAccounts")
                self.databaseRefer.child(email).child("AddedAccounts").childByAutoId().setValue("Powerschool")
            case 52:
                self.array.append("Quora")
                UserDefaults.standard.set(self.array, forKey: "addedAccounts")
                self.databaseRefer.child(email).child("AddedAccounts").childByAutoId().setValue("Quora")
            default:
                print("Error")
                print(self.array)
            }
        }
        buy.backgroundColor = .darkGray
        let config = UISwipeActionsConfiguration(actions: [buy])
        config.performsFirstActionWithFullSwipe = false
        
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
