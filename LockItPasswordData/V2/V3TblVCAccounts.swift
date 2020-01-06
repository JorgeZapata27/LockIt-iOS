//
//  V3TblVCAccounts.swift
//  LockItPasswordData
//
//  Created by JJ Zapata on 12/12/19.
//  Copyright © 2019 JJ Zapata. All rights reserved.
//

import UIKit

class V3TblVCAccounts: UITableViewController {
        
        var Accounts = ["Instagram", "Snapchat", "VSCO", "Pinterest", "Tiktok", "Twitter", "Facebook", "Google", "Flickr", "iFunny", "Tumblr", "Viber", "Vine", "WhatsApp", "Amazon", "LetGo", "Walmart","Sam's Club", "Wish", "Ebay", "Fiverr", "Sweatcoin", "Khols", "Target", "Walgreens", "Costco", "Ebates", "Craigslist", "OfferUp", "ESPN", "theScore", "Bleacher Report", "NBC Sports", "NFL", "NHL", "Yahoo Sports", "FOX Sports GO", "CBS Sports", "MLB", "GameChanger", "GroupMe", "Evernote", "TCF Bank", "Slack", "Linkden", "Dropbox", "Capital One", "Fifth Third Bank", "Chase Bank", "Outlook", "Wells Fargo", "US Bank", "PNC Bank", "BMO Harris Bank", "Chick-Fil-A", "Credit Karma", "Discord", "Domino’s Pizza", "Door-Dash", "Fitbit", "Groupon", "Houseparty", "Hulu", "LockIt", "McDonalds", "Match", "Microsoft", "Netflix", "Pandora", "PayPal", "PhotoMath", "iHeartRadio", "Reddit", "Redfin", "Remind", "Roku", "Skype", "Southwest", "Spotify", "Starbucks", "Strava", "GoodReads", "Vimeo", "Verizon", "HBO Now", "The Weather Channel", "stackoverflow", "Flipboard", "Ticket Master", "Discovery GO", "Zillow", "Xbox", "Bitmoji", "Trivia Crack", "TurboTax", "Twitch", "Tinder", "Yelp", "Luftansa", "Emirates", "Delta", "Spirit", "Powerschool", "Quora"]
        var sortedAccounts = [String]()
        var AccountDictionary = [String:[String]]()
        var AccountSectionTitles = [String]()
        var Accountss : [String] = []
        var searchAccount = [String]()
        var isSearching = false
        var accountToTransfer = ""
        
        override func viewDidAppear(_ animated: Bool) {
            navigationController?.navigationBar.backgroundColor = .black
            DoDarkThings()
        }

        override func viewDidLoad() {
            super.viewDidLoad()
            
            // Functions To Throw
            TableViewSetUp()
            DoDarkThings()
            
            tabBarItem.selectedImage = tabBarItem.selectedImage?.withRenderingMode(.alwaysOriginal)
            
            let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(tapButton))
            self.navigationItem.rightBarButtonItem = addButton

            // Uncomment the following line to preserve selection between presentations
            // self.clearsSelectionOnViewWillAppear = false

            // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
            // self.navigationItem.rightBarButtonItem = self.editButtonItem
        }
    
        @objc func tapButton() {
            performSegue(withIdentifier: "Add", sender: self)
        }
        
        func TableViewSetUp() {
            self.tableView.separatorColor = .lightGray
            self.tableView.sectionIndexBackgroundColor = .black
            self.tableView.sectionIndexColor = .systemOrange
            
            navigationController?.navigationBar.backgroundColor = .black
        }

        // MARK: - Table view data source

        override func numberOfSections(in tableView: UITableView) -> Int {
            return 1
        }

        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return Accounts.count
        }
        
        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            // Configure the cell...
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "V3", for: indexPath) as! V3CellMain
            let bool = UserDefaults.standard.bool(forKey: "DARK")
            if bool == true {
                view.backgroundColor = .black
                cell.name.text = Accounts[indexPath.row]
                cell.iconImageView.image = UIImage(named: Accounts[indexPath.row])
                cell.backgroundColor = .black
            } else {
                cell.name.text = Accounts[indexPath.row]
                cell.iconImageView.image = UIImage(named: Accounts[indexPath.row])
                cell.backgroundColor = .white
            }
            return cell
        }
        
        override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            if (indexPath.section == 0) {
                if (indexPath.row == 0) {
                    print("Amazon")
                    accountToTransfer = "Amazon"
                    performSegue(withIdentifier: "Next", sender: self)
                }
            } else {
                print("Selected")
            }
        }
        
        // Return key
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            textField.resignFirstResponder()
            return (true)
        }
//
//        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//            var second = segue.destination as! AccountController
//            second.accountName = accountToTransfer
//        }
        
        func DoDarkThings() {
            let bool = UserDefaults.standard.bool(forKey: "DARK")
            if bool == true {
                view.backgroundColor = .black
                tableView.backgroundColor = .black
            } else {
                view.backgroundColor = .white
                tableView.backgroundColor = .white
            }
        }

        /*
        // Override to support conditional editing of the table view.
        override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
            // Return false if you do not want the specified item to be editable.
            return true
        }
        */

        /*
        // Override to support editing the table view.
        override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            if editingStyle == .delete {
                // Delete the row from the data source
                tableView.deleteRows(at: [indexPath], with: .fade)
            } else if editingStyle == .insert {
                // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
            }
        }
        */

        /*
        // Override to support rearranging the table view.
        override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

        }
        */

        /*
        // Override to support conditional rearranging of the table view.
        override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
            // Return false if you do not want the item to be re-orderable.
            return true
        }
        */

    }
