//
//  LAccountsControllerV4.swift
//  LockItPasswordData
//
//  Created by JJ Zapata on 3/28/20.
//  Copyright © 2020 JJ Zapata. All rights reserved.
//

import UIKit

class LAccountsControllerV4: UIViewController, UITableViewDelegate, UITableViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "V4AccountCell", for: indexPath) as! LAccountControllerCellV4
        cell.accountImage!.image = UIImage(named: "Amazon")
        cell.accountName!.text! = "Amazon"
        cell.accountUsername!.text! = "jorgejaden@gmail.com"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 112
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
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
