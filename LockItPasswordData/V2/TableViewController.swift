//
//  TableViewController.swift
//  LockItPasswordData
//
//  Created by JJ Zapata on 10/6/19.
//  Copyright © 2019 JJ Zapata. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController, UISearchBarDelegate {
    
    var Accounts = ["Instagram", "Snapchat", "VSCO", "Pinterest", "Tiktok", "Twitter", "Facebook", "Google", "Flickr", "iFunny", "Tumblr", "Viber", "Vine", "WhatsApp", "Amazon", "LetGo", "Walmart","Sam's Club", "Wish", "Ebay", "Fiverr", "Sweatcoin", "Khols", "Target", "Walgreens", "Costco", "Ebates", "Craigslist", "OfferUp", "ESPN", "theScore", "Bleacher Report", "NBC Sports", "NFL", "NHL", "Yahoo Sports", "FOX Sports GO", "CBS Sports", "MLB", "GameChanger", "GroupMe", "Evernote", "TCF Bank", "Slack", "Linkden", "Dropbox", "Capital One", "Fifth Third Bank", "Chase Bank", "Outlook", "Wells Fargo", "US Bank", "PNC Bank", "BMO Harris Bank", "Chick-Fil-A", "Credit Karma", "Discord", "Domino’s Pizza", "Door-Dash", "Fitbit", "Groupon", "Houseparty", "Hulu", "LockIt", "McDonalds", "Match", "Microsoft", "Netflix", "Pandora", "PayPal", "PhotoMath", "iHeartRadio", "Reddit", "Redfin", "Remind", "Roku", "Skype", "Southwest", "Spotify", "Starbucks", "Strava", "GoodReads", "Vimeo", "Verizon", "HBO Now", "The Weather Channel", "stackoverflow", "Flipboard", "Ticket Master", "Discovery GO", "Zillow", "Xbox", "Bitmoji", "Trivia Crack", "TurboTax", "Twitch", "Tinder", "Yelp", "Luftansa", "Emirates", "Delta", "Spirit", "Powerschool", "Quora"]
    var sortedAccounts = [String]()
    var AccountDictionary = [String:[String]]()
    var AccountSectionTitles = [String]()
    var Accountss : [String] = []
    var searchAccount = [String]()
    var isSearching = false
    var accountToTransfer = ""
    
    @IBOutlet var searchBar : UISearchBar!
    
    override func viewDidAppear(_ animated: Bool) {
        navigationController?.navigationBar.backgroundColor = .black
        DoDarkThings()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Functions To Throw
        MakeArray()
        TableViewSetUp()
        DoDarkThings()
        
        tabBarItem.selectedImage = tabBarItem.selectedImage?.withRenderingMode(.alwaysOriginal)

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    func MakeArray() {
        sortedAccounts = Accounts.sorted {
            $0 < $1
        }
        Accountss = sortedAccounts
        
        for Account in Accountss {
            let AccountKey = String(Account.prefix(1))
            if var AccountValues = AccountDictionary[AccountKey] {
                AccountValues.append(Account)
                AccountDictionary[AccountKey] = AccountValues
            } else {
                AccountDictionary[AccountKey] = [Account]
            }
        }
        
        AccountSectionTitles = [String](AccountDictionary.keys)
        AccountSectionTitles = AccountSectionTitles.sorted(by: {$0 < $1})
        
    }
    
    func TableViewSetUp() {
        self.tableView.separatorColor = .lightGray
        self.tableView.sectionIndexBackgroundColor = .black
        self.tableView.sectionIndexColor = .systemOrange
        
        navigationController?.navigationBar.backgroundColor = .black
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        if isSearching {
            return 1
        } else {
            return AccountSectionTitles.count
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        let AccountKey = AccountSectionTitles[section]
        if isSearching {
            return searchAccount.count
        } else {
            if let AccountValues = AccountDictionary[AccountKey] {
                return AccountValues.count
            }
        }
        return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Configure the cell...
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "V2Identifier", for: indexPath)
        let AccountKey = AccountSectionTitles[indexPath.section]
        if isSearching {
            let bool = UserDefaults.standard.bool(forKey: "DARK")
            if bool == true {
                view.backgroundColor = .black
                cell.textLabel?.textColor = .white
                cell.backgroundColor = .black
            } else {
                cell.textLabel?.textColor = .black
                cell.backgroundColor = .white
            }
            cell.textLabel?.text = searchAccount[indexPath.row]
        } else {
            if let AccountValues = AccountDictionary[AccountKey] {
                let bool = UserDefaults.standard.bool(forKey: "DARK")
                if bool == true {
                    view.backgroundColor = .black
                    cell.textLabel?.textColor = .white
                    cell.backgroundColor = .black
                } else {
                    cell.textLabel?.textColor = .black
                    cell.backgroundColor = .white
                }
                cell.textLabel?.text = AccountValues[indexPath.row]
            }
        }

        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if isSearching {
            return "Results"
        } else {
            return AccountSectionTitles[section]
        }
    }
    
    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return AccountSectionTitles
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (indexPath.section == 0) {
            if (indexPath.row == 0) {
                print("Amazon")
                accountToTransfer = "Amazon"
                performSegue(withIdentifier: "Next", sender: self)
            }
        } else if (indexPath.section == 1) {
            if (indexPath.row == 0) {
                print("BMO Harris Bank")
                accountToTransfer = "BMO Harris Bank"
                performSegue(withIdentifier: "Next", sender: self)
            } else if (indexPath.row == 1) {
                print("Bitmoji")
                accountToTransfer = "Bitmoji"
                performSegue(withIdentifier: "Next", sender: self)
            } else if (indexPath.row == 2) {
                print("Bleacher Report")
                accountToTransfer = "Bleacher Report"
                performSegue(withIdentifier: "Next", sender: self)
            }
        } else if (indexPath.section == 2) {
            if (indexPath.row == 0) {
                print("CBS Sports")
                accountToTransfer = "CBS Sports"
                performSegue(withIdentifier: "Next", sender: self)
            } else if (indexPath.row == 1) {
                print("Capital One")
                accountToTransfer = "Capital One"
                performSegue(withIdentifier: "Next", sender: self)
            } else if (indexPath.row == 2) {
                print("Chase Bank")
                accountToTransfer = "Chase Bank"
                performSegue(withIdentifier: "Next", sender: self)
            } else if (indexPath.row == 3) {
                print("Chick-Fil-A")
                accountToTransfer = "Chick-Fil-A"
                performSegue(withIdentifier: "Next", sender: self)
            } else if (indexPath.row == 4) {
                print("Costco")
                accountToTransfer = "Costco"
                performSegue(withIdentifier: "Next", sender: self)
            } else if (indexPath.row == 5) {
                print("Craigslist")
                accountToTransfer = "Craigslist"
                performSegue(withIdentifier: "Next", sender: self)
            } else if (indexPath.row == 6) {
                print("Credit Karma")
                accountToTransfer = "Credit Karma"
                performSegue(withIdentifier: "Next", sender: self)
            }
        } else if (indexPath.section == 3) {
            if (indexPath.row == 0) {
                print("Delta")
                accountToTransfer = "Delta"
                performSegue(withIdentifier: "Next", sender: self)
            } else if (indexPath.row == 1) {
                print("Discord")
                accountToTransfer = "Discord"
                performSegue(withIdentifier: "Next", sender: self)
            } else if (indexPath.row == 2) {
                print("Discovery GO")
                accountToTransfer = "Discovery"
                performSegue(withIdentifier: "Next", sender: self)
            } else if (indexPath.row == 3) {
                print("Domino's Pizza")
                accountToTransfer = "Domino's Pizza"
                performSegue(withIdentifier: "Next", sender: self)
            } else if (indexPath.row == 4) {
                print("Door-Dash")
                accountToTransfer = "Door-Dash"
                performSegue(withIdentifier: "Next", sender: self)
            } else if (indexPath.row == 5) {
                print("Dropbox")
                accountToTransfer = "Dropbox"
                performSegue(withIdentifier: "Next", sender: self)
            }
        } else if (indexPath.section == 4) {
            if (indexPath.row == 0) {
                print("ESPN")
                accountToTransfer = "ESPN"
                performSegue(withIdentifier: "Next", sender: self)
            } else if (indexPath.row == 1) {
                print("Ebates")
                accountToTransfer = "Ebates"
                performSegue(withIdentifier: "Next", sender: self)
            } else if (indexPath.row == 2) {
                print("Ebay")
                accountToTransfer = "Ebay"
                performSegue(withIdentifier: "Next", sender: self)
            } else if (indexPath.row == 3) {
                print("Emirates")
                accountToTransfer = "Emirates"
                performSegue(withIdentifier: "Next", sender: self)
            } else if (indexPath.row == 4) {
                print("Evernote")
                accountToTransfer = "Evernote"
                performSegue(withIdentifier: "Next", sender: self)
            }
        } else if (indexPath.section == 5) {
            if (indexPath.row == 0) {
                print("FOX Sports GO")
                accountToTransfer = "FOX Sports GO"
                performSegue(withIdentifier: "Next", sender: self)
            } else if (indexPath.row == 1) {
                print("Facebook")
                accountToTransfer = "Facebook"
                performSegue(withIdentifier: "Next", sender: self)
            } else if (indexPath.row == 2) {
                print("Fifth Third Bank")
                accountToTransfer = "Fifth Third Bank"
                performSegue(withIdentifier: "Next", sender: self)
            } else if (indexPath.row == 3) {
                print("Fitbit")
                accountToTransfer = "Fitbit"
                performSegue(withIdentifier: "Next", sender: self)
            } else if (indexPath.row == 4) {
                print("Fiverr")
                accountToTransfer = "Fiverr"
                performSegue(withIdentifier: "Next", sender: self)
            } else if (indexPath.row == 5) {
                print("Flickr")
                accountToTransfer = "Flickr"
                performSegue(withIdentifier: "Next", sender: self)
            } else if (indexPath.row == 6) {
                print("Flipboard")
                accountToTransfer = "Flipboard"
                performSegue(withIdentifier: "Next", sender: self)
            }
        } else if (indexPath.section == 6) {
            if (indexPath.row == 0) {
                print("GameChanger")
                accountToTransfer = "Gamechanger"
                performSegue(withIdentifier: "Next", sender: self)
            } else if (indexPath.row == 1) {
                print("GoodReads")
                accountToTransfer = "GoodReads"
                performSegue(withIdentifier: "Next", sender: self)
            } else if (indexPath.row == 2) {
                print("Google")
                accountToTransfer = "Google"
                performSegue(withIdentifier: "Next", sender: self)
            } else if (indexPath.row == 3) {
                print("GroupMe")
                accountToTransfer = "GroupMe"
                performSegue(withIdentifier: "Next", sender: self)
            } else if (indexPath.row == 4) {
                print("Groupon")
                accountToTransfer = "Groupn"
                performSegue(withIdentifier: "Next", sender: self)
            }
        } else if (indexPath.section == 7) {
            if (indexPath.row == 0) {
                print("HBO Now")
                accountToTransfer = "HBO Now"
                performSegue(withIdentifier: "Next", sender: self)
            } else if (indexPath.row == 1) {
                print("Houseparty")
                accountToTransfer = "HouseParty"
                performSegue(withIdentifier: "Next", sender: self)
            } else if (indexPath.row == 2) {
                print("Hulu")
                accountToTransfer = "Hulu"
                performSegue(withIdentifier: "Next", sender: self)
            }
        } else if (indexPath.section == 8) {
            if (indexPath.row == 0) {
                print("Instagram")
                accountToTransfer = "Instagram"
                performSegue(withIdentifier: "Next", sender: self)
            }
        } else if (indexPath.section == 9) {
            if (indexPath.row == 0) {
                print("Khols")
                accountToTransfer = "Khols"
                performSegue(withIdentifier: "Next", sender: self)
            }
        } else if (indexPath.section == 10) {
            if (indexPath.row == 0) {
                print("LetGo")
                accountToTransfer = "LetGo"
                performSegue(withIdentifier: "Next", sender: self)
            } else if (indexPath.row == 1) {
                print("Linkden")
                accountToTransfer = "Linkden"
                performSegue(withIdentifier: "Next", sender: self)
            } else if (indexPath.row == 2) {
                print("LockIt")
                accountToTransfer = "LockIt"
                performSegue(withIdentifier: "Next", sender: self)
            } else if (indexPath.row == 3) {
                print("Luftansa")
                accountToTransfer = "Luftansa"
                performSegue(withIdentifier: "Next", sender: self)
            }
        } else if (indexPath.section == 11) {
            if (indexPath.row == 0) {
                print("MLB")
                accountToTransfer = "MLB"
                performSegue(withIdentifier: "Next", sender: self)
            } else if (indexPath.row == 1) {
                print("Match")
                accountToTransfer = "Match"
                performSegue(withIdentifier: "Next", sender: self)
            } else if (indexPath.row == 2) {
                print("McDonalds")
                accountToTransfer = "McDonalds"
                performSegue(withIdentifier: "Next", sender: self)
            } else if (indexPath.row == 3) {
                print("Microsoft")
                accountToTransfer = "Microsoft"
                performSegue(withIdentifier: "Next", sender: self)
            }
        } else if (indexPath.section == 12) {
            if (indexPath.row == 0) {
                print("NBC Sports")
                accountToTransfer = "NBC Sports"
                performSegue(withIdentifier: "Next", sender: self)
            } else if (indexPath.row == 1) {
                print("NFL")
                accountToTransfer = "NFL"
                performSegue(withIdentifier: "Next", sender: self)
            } else if (indexPath.row == 2) {
                print("NHL")
                accountToTransfer = "NHL"
                performSegue(withIdentifier: "Next", sender: self)
            } else if (indexPath.row == 3) {
                print("Netflix")
                accountToTransfer = "Netflix"
                performSegue(withIdentifier: "Next", sender: self)
            }
        } else if (indexPath.section == 13) {
            if (indexPath.row == 0) {
                print("OfferUp")
                accountToTransfer = "OfferUp"
                performSegue(withIdentifier: "Next", sender: self)
            } else if (indexPath.row == 1) {
                print("Outlook")
                accountToTransfer = "Outlook"
                performSegue(withIdentifier: "Next", sender: self)
            }
        } else if (indexPath.section == 14) {
            if (indexPath.row == 0) {
                print("PNC Bank")
                accountToTransfer = "PNC Bank"
                performSegue(withIdentifier: "Next", sender: self)
            } else if (indexPath.row == 1) {
                print("Pandora")
                accountToTransfer = "Pandora"
                performSegue(withIdentifier: "Next", sender: self)
            } else if (indexPath.row == 2) {
                print("PayPal")
                accountToTransfer = "PayPal"
                performSegue(withIdentifier: "Next", sender: self)
            } else if (indexPath.row == 3) {
                print("PhotoMath")
                accountToTransfer = "PhotoMath"
                performSegue(withIdentifier: "Next", sender: self)
            } else if (indexPath.row == 4) {
                print("Pinterest")
                accountToTransfer = "Pinterest"
                performSegue(withIdentifier: "Next", sender: self)
            } else if (indexPath.row == 5) {
                print("Powerschool")
                accountToTransfer = "Powerschool"
                performSegue(withIdentifier: "Next", sender: self)
            }
        } else if (indexPath.section == 15) {
            if (indexPath.row == 0) {
                print("Quora")
                accountToTransfer = "Quora"
                performSegue(withIdentifier: "Next", sender: self)
            }
        } else if (indexPath.section == 16) {
            if (indexPath.row == 0) {
                print("Reddit")
                accountToTransfer = "Reddit"
                performSegue(withIdentifier: "Next", sender: self)
            } else if (indexPath.row == 1) {
                print("Redfin")
                accountToTransfer = "Redfin"
                performSegue(withIdentifier: "Next", sender: self)
            } else if (indexPath.row == 2) {
                print("Remind")
                accountToTransfer = "Remind"
                performSegue(withIdentifier: "Next", sender: self)
            } else if (indexPath.row == 3) {
                print("Roku")
                accountToTransfer = "Roku"
                performSegue(withIdentifier: "Next", sender: self)
            }
        } else if (indexPath.section == 17) {
            if (indexPath.row == 0) {
                print("Sam's Club")
                accountToTransfer = "Sam's Club"
                performSegue(withIdentifier: "Next", sender: self)
            } else if (indexPath.row == 1) {
                print("Skype")
                accountToTransfer = "Skype"
                performSegue(withIdentifier: "Next", sender: self)
            } else if (indexPath.row == 2) {
                print("Slack")
                accountToTransfer = "Slack"
                performSegue(withIdentifier: "Next", sender: self)
            } else if (indexPath.row == 3) {
                print("Snapchat")
                accountToTransfer = "Snapchat"
                performSegue(withIdentifier: "Next", sender: self)
            } else if (indexPath.row == 4) {
                print("Southwest")
                accountToTransfer = "Southwest"
                performSegue(withIdentifier: "Next", sender: self)
            } else if (indexPath.row == 5) {
                print("Spirit")
                accountToTransfer = "Spirit"
                performSegue(withIdentifier: "Next", sender: self)
            } else if (indexPath.row == 6) {
                print("Spotify")
                accountToTransfer = "Spotify"
                performSegue(withIdentifier: "Next", sender: self)
            } else if (indexPath.row == 7) {
                print("Starbucks")
                accountToTransfer = "Starbucks"
                performSegue(withIdentifier: "Next", sender: self)
            } else if (indexPath.row == 8) {
                print("Strava")
                accountToTransfer = "Strava"
                performSegue(withIdentifier: "Next", sender: self)
            } else if (indexPath.row == 9) {
                print("Sweatcoin")
                accountToTransfer = "Sweatcoin"
                performSegue(withIdentifier: "Next", sender: self)
            }
        } else if (indexPath.section == 18) {
            if (indexPath.row == 0) {
                print("TCF Bank")
                accountToTransfer = "TCF Bank"
                performSegue(withIdentifier: "Next", sender: self)
            } else if (indexPath.row == 1) {
                print("The Weather Channel")
                accountToTransfer = "The Weather Channel"
                performSegue(withIdentifier: "Next", sender: self)
            } else if (indexPath.row == 2) {
                print("Ticket Master")
                accountToTransfer = "Ticket Master"
                performSegue(withIdentifier: "Next", sender: self)
            } else if (indexPath.row == 3) {
                print("Tiktok")
                accountToTransfer = "Tiktok"
                performSegue(withIdentifier: "Next", sender: self)
            } else if (indexPath.row == 4) {
                print("Tinder")
                accountToTransfer = "Tinder"
                performSegue(withIdentifier: "Next", sender: self)
            } else if (indexPath.row == 5) {
                print("Trivia Crack")
                accountToTransfer = "Trivia Crack"
                performSegue(withIdentifier: "Next", sender: self)
            } else if (indexPath.row == 6) {
                print("Tumblr")
                accountToTransfer = "Tumblr"
                performSegue(withIdentifier: "Next", sender: self)
            } else if (indexPath.row == 7) {
                print("TurboTax")
                accountToTransfer = "TurboTax"
                performSegue(withIdentifier: "Next", sender: self)
            } else if (indexPath.row == 8) {
                print("Twitch")
                accountToTransfer = "Twitch"
                performSegue(withIdentifier: "Next", sender: self)
            } else if (indexPath.row == 9) {
                print("Twitter")
                accountToTransfer = "Twitter"
                performSegue(withIdentifier: "Next", sender: self)
            }
        } else if (indexPath.section == 19) {
            if (indexPath.row == 0) {
                print("US Bank")
                accountToTransfer = "US Bank"
                performSegue(withIdentifier: "Next", sender: self)
            }
        } else if (indexPath.section == 20) {
            if (indexPath.row == 0) {
                print("VSCO")
                accountToTransfer = "VSCO"
                performSegue(withIdentifier: "Next", sender: self)
            } else if (indexPath.row == 1) {
                print("Verizon")
                accountToTransfer = "Verizon"
                performSegue(withIdentifier: "Next", sender: self)
            } else if (indexPath.row == 2) {
                print("Viber")
                accountToTransfer = "Viber"
                performSegue(withIdentifier: "Next", sender: self)
            } else if (indexPath.row == 3) {
                print("Vimeo")
                accountToTransfer = "Vimeo"
                performSegue(withIdentifier: "Next", sender: self)
            } else if (indexPath.row == 4) {
                print("Vine")
                accountToTransfer = "Vine"
                performSegue(withIdentifier: "Next", sender: self)
            }
        } else if (indexPath.section == 21) {
            if (indexPath.row == 0) {
                print("Walgreens")
                accountToTransfer = "Walgreens"
                performSegue(withIdentifier: "Next", sender: self)
            } else if (indexPath.row == 1) {
                print("Walmart")
                accountToTransfer = "Walmart"
                performSegue(withIdentifier: "Next", sender: self)
            } else if (indexPath.row == 2) {
                print("Wells Fargo")
                accountToTransfer = "Wells Fargo"
                performSegue(withIdentifier: "Next", sender: self)
            } else if (indexPath.row == 3) {
                print("WhatsApp")
                accountToTransfer = "WhatsApp"
                performSegue(withIdentifier: "Next", sender: self)
            } else if (indexPath.row == 4) {
                print("Wish")
                accountToTransfer = "Wish"
                performSegue(withIdentifier: "Next", sender: self)
            }
        } else if (indexPath.section == 22) {
            if (indexPath.row == 0) {
                print("Xbox")
                accountToTransfer = "Xbox"
                performSegue(withIdentifier: "Next", sender: self)
            }
        } else if (indexPath.section == 23) {
            if (indexPath.row == 0) {
                print("Yahoo Sports")
                accountToTransfer = "Yahoo Sports"
                performSegue(withIdentifier: "Next", sender: self)
            } else if (indexPath.row == 1) {
                print("Yelp")
                accountToTransfer = "Yelp"
                performSegue(withIdentifier: "Next", sender: self)
            }
        } else if (indexPath.section == 24) {
            if (indexPath.row == 0) {
                print("Zillow")
                accountToTransfer = "Zillow"
                performSegue(withIdentifier: "Next", sender: self)
            }
        } else if (indexPath.section == 25) {
            if (indexPath.row == 0) {
                print("iFunny")
                accountToTransfer = "iFunny"
                performSegue(withIdentifier: "Next", sender: self)
            } else if (indexPath.row == 1) {
                print("iHeartRadio")
                accountToTransfer = "iHeartRadio"
                performSegue(withIdentifier: "Next", sender: self)
            }
        } else if (indexPath.section == 26) {
            if (indexPath.row == 0) {
                print("stackoverflow")
                accountToTransfer = "stackoverflow"
                performSegue(withIdentifier: "Next", sender: self)
            }
        } else if (indexPath.section == 27) {
            if (indexPath.row == 0) {
                print("theScore")
                accountToTransfer = "theScore"
                performSegue(withIdentifier: "Next", sender: self)
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.tintColor = .darkGray
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchAccount = sortedAccounts.filter({$0.prefix(searchText.count) == searchText})
        isSearching = true
        tableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        isSearching = false
        searchBar.text = ""
        tableView.reloadData()
        self.searchBar.endEditing(true)
    }
    
    // Hides keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        isSearching = false
        searchBar.text = ""
        tableView.reloadData()
        self.searchBar.endEditing(true)
    }
    
    // Return key
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchBar.resignFirstResponder()
        isSearching = false
        searchBar.text = ""
        tableView.reloadData()
        return (true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var second = segue.destination as! AccountController
        second.accountName = accountToTransfer
    }
    
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
