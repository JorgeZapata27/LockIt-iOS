//
//  AccountController.swift
//  LockItPasswordData
//
//  Created by JJ Zapata on 10/11/19.
//  Copyright © 2019 JJ Zapata. All rights reserved.
//

import UIKit
import FirebaseDatabase

class AccountController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //@IBOutlet var TableVIew : UITableView!
    @IBOutlet var usernameText : UILabel!
    @IBOutlet var passwordText : UILabel!
    
    // Firebase Init
    var databaseRefer : DatabaseReference!
    var databaseHandle : DatabaseHandle!
    var username = String()
    var accountName = String()
    var titleInfo = ["Username", "Password"]
    var acutalInformation = ["None", "None"]
    var toCopy = ""
    var ArrayForInfo = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Firebase Init ( Read )
        databaseRefer = Database.database().reference()
        DoDarkThings()
        
        NvgiationShit()
        DelegatesUndData()
        FirebaseRead()
        isClear()
        
        print(self.ArrayForInfo)
        
        username = "Jorge Zapata"

            // Do any additional setup after loading the view.
    }
        
    override func viewDidAppear(_ animated: Bool) {
        DoDarkThings()
    }
        
    func DoDarkThings() {
        let bool = UserDefaults.standard.bool(forKey: "DARK")
        if bool == true {
            view.backgroundColor = .black
            usernameText.textColor = .white
            passwordText.textColor = .white
        } else {
            view.backgroundColor = .white
            usernameText.textColor = .black
            passwordText.textColor = .black
        }
    }
    
    func NvgiationShit() {
        let image = UIImageView(image: UIImage(named: accountName))
        image.frame = CGRect(x: 0, y: 0, width: 75, height: 75)
        image.contentMode = .scaleAspectFit
        image.layer.cornerRadius = 5
        navigationItem.titleView = image
        navigationItem.prompt = " "
        navigationController?.navigationBar.backgroundColor = .darkGray
    }

    func DelegatesUndData() {
        //TableVIew.delegate = self
        //TableVIew.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //configure cell type 1
        let cell = tableView.dequeueReusableCell(withIdentifier: "EnailUndPass", for: indexPath) as! EmailUndPassCell
        cell.Label1.text = titleInfo[indexPath.row]
        cell.Label2.text = acutalInformation[indexPath.row]
        return cell
        
    }
    
    @IBAction func copyUsername (_ sender: Any) {
        print("Copied Username")
        UIPasteboard.general.string = usernameText.text
    }
    
    @IBAction func copyPassword (_ sender: Any) {
        print("Copied Password")
        UIPasteboard.general.string = passwordText.text
    }
    
    func FirebaseRead() {
        let saveAsUser = accountName + "User"
        let saveAsPass = accountName + "Pass"
        
        guard let email = UserDefaults.standard.string(forKey: "PASSWORD") else {
            return
        }
        
        databaseHandle = databaseRefer.child(email).child("AddedAccounts").child(accountName).child(saveAsUser).observe(.childAdded, with: { (data) in
            let name : String = (data.value as? String)!
            self.ArrayForInfo.append(name)
            self.usernameText.text = name
            debugPrint(name)
        })
        
        databaseHandle = databaseRefer.child(email).child("AddedAccounts").child(accountName).child(saveAsPass).observe(.childAdded, with: { (data) in
            let name : String = (data.value as? String)!
            self.ArrayForInfo.append(name)
            self.passwordText.text = name
            debugPrint(name)
        })
    }
    
    func isClear() {
        if self.usernameText.text == "" {
            self.usernameText.text = "None"
        } else if self.passwordText.text == "" {
            self.passwordText.text = "None"
        } else if self.usernameText.text == "" || self.passwordText.text == "" {
            self.usernameText.text = "None"
            self.passwordText.text = "None"
        } else {
            print("All Good")
        }
    }
    
    @IBAction func editInformation(_ sender: Any) {
        let alertController = UIAlertController(title: "Update Your Information", message: "", preferredStyle: .alert)
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let ok = UIAlertAction(title: "Save", style: .default) { (action: UIAlertAction) -> Void in
            print("OK")
            guard let email = UserDefaults.standard.string(forKey: "PASSWORD") else {
                return
            }
                
            print(email)
            
            let Username = alertController.textFields?[0]
            print(Username!.text!)
            let Password = alertController.textFields?[1]
            print(Password!.text!)
            
            self.ArrayForInfo.append(Username!.text!)
            self.ArrayForInfo.append(Password!.text!)
                
            let saveAsUser = self.accountName + "User"
            let saveAsPass = self.accountName + "Pass"
            
            self.databaseRefer.child(email).child("AddedAccounts").child(self.accountName).child(saveAsUser).childByAutoId().setValue(Username!.text!)
            self.databaseRefer.child(email).child("AddedAccounts").child(self.accountName).child(saveAsPass).childByAutoId().setValue(Password!.text!)
            
        }
        alertController.addTextField { (textField : UITextField) in
            textField.placeholder = "Account Username"
            
        }
        alertController.addTextField { (textField : UITextField) in
            textField.placeholder = "Account Password"
        }
        alertController.addAction(cancel)
        alertController.addAction(ok)
        self.present(alertController, animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
