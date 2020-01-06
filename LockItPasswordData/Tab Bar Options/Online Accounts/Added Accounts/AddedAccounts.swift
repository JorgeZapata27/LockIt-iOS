//
//  AddedAccounts.swift
//  LockItPasswordData
//
//  Created by JJ Zapata on 5/30/19.
//  Copyright © 2019 JJ Zapata. All rights reserved.
//

import UIKit
import FirebaseDatabase

// Global Variables
var myIndex = 0
let addedAccounts = UserDefaults.standard.object(forKey: "addedAccounts") as? [String]

class AddedAccounts: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var tblList: UITableView!
    
    // Firebase Init
    var databaseRefer : DatabaseReference!
    var databaseHandle : DatabaseHandle!
    
    // Variables
    let addedAccounts = UserDefaults.standard.object(forKey: "addedAccounts") as? [String]
    //var refresher: UIRefreshControl!
    
    var refreshControl : UIRefreshControl?
    
    // Table View
    @IBOutlet var tableView: UITableView!
    
    func addRefreshControl() {
        refreshControl = UIRefreshControl()
        refreshControl?.tintColor = .white
        refreshControl?.addTarget(self, action: #selector(refreshList), for: .valueChanged)
        tableView.addSubview(refreshControl!)
    }
    
    @objc func refreshList()
    {
        print("Hello")
        refreshControl?.endRefreshing()
        tblList.reloadData()
    }
    
    // Table View Rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return (self.addedAccounts!.count)
    }
    
    // Alert Action
    @objc func sub(alert: UIAlertAction)
    {
        performSegue(withIdentifier: "goToAdded", sender: self)
    }
    
    // Table View Cells
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "added", for: indexPath) as! AddedAccountsCell
        cell.label.text = self.addedAccounts![indexPath.row]
        
        return (cell)
    }
    
    // Table View Segues
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        myIndex = indexPath.row
        performSegue(withIdentifier: "segue", sender: self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Firebase Init ( Read )
        databaseRefer = Database.database().reference()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Refresh", style: .plain, target: self, action: #selector(AddedAccounts.addTapped))
        
        navigationItem.rightBarButtonItem?.tintColor = .orange
        
        // Do any additional setup after loading the view.
    }
    
    // Refresh Function
    func reloading()
    {
        let alert = UIAlertController(title: "Force Close App To Refresh", message: "In Order To Reload Results, Please Force CLose This Application And Re-Open It", preferredStyle: .alert)
        let forceClose = UIAlertAction(title: "Force Close", style: .default , handler: self.forceClose)
        let okay = UIAlertAction(title: "Okay", style: .cancel, handler: nil)
        alert.addAction(forceClose)
        alert.addAction(okay)
        self.present(alert, animated: true, completion: nil)
    }
    
    // Force Close Function
    func forceClose(alert: UIAlertAction!)
    {
        exit(0);
    }
    
    // AddTapped
    @objc func addTapped(sender: Any) {
        reloading()
    }
    
    // Hides keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    // Return key
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return (true)
    }
    
    // Adds Alert
    func alert()
    {
        let alert = UIAlertController(title: "Have You Refreshed?", message: "Don't Forget To Refresh!", preferredStyle: .alert)
        let okay = UIAlertAction(title: "Okay!", style: .cancel, handler: nil)
        let refreshForMe = UIAlertAction(title: "Refresh For Me", style: .default, handler: self.refreshThing)
        alert.addAction(okay)
        alert.addAction(refreshForMe)
        present(alert, animated: true, completion: nil)
    }
    
    // Once View Appears
    override func viewDidAppear(_ animated: Bool)
    {
        //alert()
    }
    
    // Refresher
    @objc func refreshThing(alert: UIAlertAction!)
    {
        let alert = UIAlertController(title: "Force Close App To Refresh", message: "In Order To Reload Results, Please Force CLose This Application And Re-Open It", preferredStyle: .alert)
        let forceClose = UIAlertAction(title: "Force Close", style: .default , handler: self.forceClose)
        let okay = UIAlertAction(title: "Okay", style: .cancel, handler: nil)
        alert.addAction(forceClose)
        alert.addAction(okay)
        self.present(alert, animated: true, completion: nil)
    }
    
}
