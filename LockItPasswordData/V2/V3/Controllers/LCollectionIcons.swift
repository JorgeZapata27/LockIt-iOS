//
//  LCollectionIcons.swift
//  LockItPasswordData
//
//  Created by JJ Zapata on 2/3/20.
//  Copyright © 2020 JJ Zapata. All rights reserved.
//

import UIKit


class LCollectionIcons: UITableViewController, UISearchResultsUpdating {
    
    var Accounts = ["Instagram", "Snapchat", "VSCO", "Pinterest", "Tiktok", "Twitter", "Facebook", "Google", "Flickr", "iFunny", "Tumblr", "Viber", "Vine", "WhatsApp", "Amazon", "LetGo", "Walmart","Sam's Club", "Wish", "Ebay", "Fiverr", "Sweatcoin", "Khols", "Target", "Walgreens", "Costco", "Ebates", "Craigslist", "OfferUp", "ESPN", "theScore", "Bleacher Report", "NBC Sports", "NFL", "NHL", "Yahoo Sports", "FOX Sports GO", "CBS Sports", "MLB", "GameChanger", "GroupMe", "Evernote", "TCF Bank", "Slack", "Linkden", "Dropbox", "Capital One", "Fifth Third Bank", "Chase Bank", "Outlook", "Wells Fargo", "US Bank", "PNC Bank", "BMO Harris Bank", "Chick-Fil-A", "Credit Karma", "Discord", "Domino’s Pizza", "Door-Dash", "Fitbit", "Groupon", "Houseparty", "Hulu", "LockIt", "McDonalds", "Match", "Microsoft", "Netflix", "Pandora", "PayPal", "PhotoMath", "iHeartRadio", "Reddit", "Redfin", "Remind", "Roku", "Skype", "Southwest", "Spotify", "Starbucks", "Strava", "GoodReads", "Vimeo", "Verizon", "HBO Now", "The Weather Channel", "stackoverflow", "Flipboard", "Ticket Master", "Discovery GO", "Zillow", "Xbox", "Bitmoji", "Trivia Crack", "TurboTax", "Twitch", "Tinder", "Yelp", "Luftansa", "Emirates", "Delta", "Spirit", "Powerschool", "Quora"]
    var sortedAccounts = [String]()
    var filteredTableData = [String]()
    var resultSearchController = UISearchController()
    
    var hello = "  hello  "
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        sortedAccounts = Accounts.sorted {
            $0 < $1
        }
        tableView.reloadData()
        tableView.register(LHomeControllerCell.self, forCellReuseIdentifier: "AddAccount")
        
        resultSearchController = ({
            let controller = UISearchController(searchResultsController: nil)
            controller.searchResultsUpdater = self
            controller.dimsBackgroundDuringPresentation = false
            controller.searchBar.sizeToFit()

            tableView.tableHeaderView = controller.searchBar
            return controller
        })()

        // Reload the table
        tableView.reloadData()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if  (resultSearchController.isActive) {
            return filteredTableData.count
        } else {
            return sortedAccounts.count
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (resultSearchController.isActive) {
            let cell = tableView.dequeueReusableCell(withIdentifier: "AddAccount", for: indexPath) as! LHomeControllerCell
            cell.nameLabel.text = filteredTableData[indexPath.row]
            cell.imageViewImage.image = UIImage(named: filteredTableData[indexPath.row])
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "AddAccount", for: indexPath) as! LHomeControllerCell
            cell.imageViewImage.image = UIImage(named: sortedAccounts[indexPath.row])
            cell.nameLabel.text = sortedAccounts[indexPath.row]
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        filteredTableData.removeAll(keepingCapacity: false)

        let searchPredicate = NSPredicate(format: "SELF CONTAINS[c] %@", searchController.searchBar.text!)
        let array = (self.sortedAccounts as NSArray).filtered(using: searchPredicate)
        filteredTableData = array as! [String]
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (resultSearchController.isActive) {
            print(filteredTableData[indexPath.row])
            MyVariables.account = "\(filteredTableData[indexPath.row])"
            self.dismiss(animated: true, completion: nil)
            self.dismiss(animated: true, completion: nil)
            let alertController = UIAlertController(title: "\(filteredTableData[indexPath.row])", message: "Is your choice", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Okay", style: .default, handler: { (action) in
                self.dismiss(animated: true, completion: nil)
            }))
        } else {
            MyVariables.account = "\(sortedAccounts[indexPath.row])"
            self.dismiss(animated: true, completion: nil)
            self.dismiss(animated: true, completion: nil)
            print(sortedAccounts[indexPath.row])
            let alertController = UIAlertController(title: "\(sortedAccounts[indexPath.row])", message: "Is your choice", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Okay", style: .default, handler: { (action) in
                self.dismiss(animated: true, completion: nil)
            }))
//            self.present(alertController, animated: true, completion: nil)
        }
    }
    
}
