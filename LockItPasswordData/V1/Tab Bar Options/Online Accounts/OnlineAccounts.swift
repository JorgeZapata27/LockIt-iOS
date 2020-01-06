//
//  OnlineAccounts.swift
//  LOCKIT
//
//  Created by JJ Zapata on 4/23/19.
//  Copyright © 2019 JJ Zapata. All rights reserved.
//

import UIKit

class OnlineAccounts: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tblList: UITableView!
    
    // Variables
    var defaultArray = ["Apple Id", "Email", "iPhone Password", "Added Accounts"]
    var defaultSegue = ["appleid", "email", "iPhone", "added"]
    var refreshControl : UIRefreshControl?
    
    // Table View Rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return (defaultArray.count)
    }
    
    // Table View Row Names
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let defaults = tableView.dequeueReusableCell(withIdentifier: "defaults", for: indexPath) as! Defaults
        defaults.myLabel.text = defaultArray[indexPath.row]
        return (defaults)
    }
    
    // Table View Segues
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        performSegue(withIdentifier: defaultSegue[indexPath.row], sender: self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        lookUp()

        // Do any additional setup after loading the view.
    }
    
    func startUp()
    {
        let alert = UIAlertController(title: "Have You Added Any Accounts Yet?", message: "Try adding some now!", preferredStyle: .alert)
        let no = UIAlertAction(title: "No", style: .default, handler: self.no)
        let yes = UIAlertAction(title: "Yes", style: .cancel, handler: self.yes)
        
        alert.addAction(no)
        alert.addAction(yes)
        self.present(alert, animated: true, completion: nil)
    }
    
    @objc func yes(alert: UIAlertAction!)
    {
        UserDefaults.standard.set(true, forKey: "SET")
    }
    
    @objc func no(alert: UIAlertAction!)
    {
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc: UIViewController = storyboard.instantiateViewController(withIdentifier: "asdfasdf") as! AddInfo
        self.present(vc, animated: true, completion: nil)
        
        UserDefaults.standard.set(true, forKey: "SET")
    }
    
    func lookUp()
    {
        let yesorno = UserDefaults.standard.bool(forKey: "SET")
        if yesorno != true
        {
            startUp()
        }
    }

}
