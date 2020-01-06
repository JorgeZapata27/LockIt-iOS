//
//  AddInfo.swift
//  LockItPasswordData
//
//  Created by JJ Zapata on 4/27/19.
//  Copyright © 2019 JJ Zapata. All rights reserved.
//

import UIKit

class AddInfo: UIViewController {
    
    // Views
    @IBOutlet var SclMdiaView: UIView!
    @IBOutlet var BSView: UIView!
    @IBOutlet var SportsView: UIView!
    @IBOutlet var TravelView: UIView!
    @IBOutlet var BusView: UIView!
    @IBOutlet var ExtrasView: UIView!
    
    // Buttons
    @IBOutlet var SclMdiaBtn: UIButton!
    @IBOutlet var BSBtn: UIButton!
    @IBOutlet var SportsBtn: UIButton!
    @IBOutlet var TravelBtn: UIButton!
    @IBOutlet var BusBtn: UIButton!
    @IBOutlet var ExtrasBtn: UIButton!
    
    // Images
    @IBOutlet var SclMdiaImg: UIImageView!
    @IBOutlet var BSImg: UIImageView!
    @IBOutlet var SportsImg: UIImageView!
    @IBOutlet var TravelImg: UIImageView!
    @IBOutlet var BusImg: UIImageView!
    @IBOutlet var ExtrasImg: UIImageView!
    
    // Labels
    @IBOutlet var SclMdiaLbl: UILabel!
    @IBOutlet var BSLbl: UILabel!
    @IBOutlet var SportsLbl: UILabel!
    @IBOutlet var TravelLbl: UILabel!
    @IBOutlet var BusLbl: UILabel!
    @IBOutlet var ExtrasLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Social Media Label
        self.SclMdiaLbl.layer.cornerRadius = 20
        self.SclMdiaLbl.clipsToBounds = true
        self.SclMdiaLbl.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        
        // Social Media Image
        self.SclMdiaImg.layer.cornerRadius = 20
        self.SclMdiaImg.clipsToBounds = true
        self.SclMdiaImg.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        
        // Buy & Sell Label
        self.BSLbl.layer.cornerRadius = 20
        self.BSLbl.clipsToBounds = true
        self.BSLbl.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        
        // Buy & Sell Image
        self.BSImg.layer.cornerRadius = 20
        self.BSImg.clipsToBounds = true
        self.BSImg.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        
        // Sports Label
        self.SportsLbl.layer.cornerRadius = 20
        self.SportsLbl.clipsToBounds = true
        self.SportsLbl.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        
        // Sports Image
        self.SportsImg.layer.cornerRadius = 20
        self.SportsImg.clipsToBounds = true
        self.SportsImg.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        
        // Travel Label
        self.TravelLbl.layer.cornerRadius = 20
        self.TravelLbl.clipsToBounds = true
        self.TravelLbl.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        
        // Travel Image
        self.TravelImg.layer.cornerRadius = 20
        self.TravelImg.clipsToBounds = true
        self.TravelImg.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        
        // Business | Finance Label
        self.BusLbl.layer.cornerRadius = 20
        self.BusLbl.clipsToBounds = true
        self.BusLbl.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        
        // Business | Finance Image
        self.BusImg.layer.cornerRadius = 20
        self.BusImg.clipsToBounds = true
        self.BusImg.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        
        // Extras Label
        self.ExtrasLbl.layer.cornerRadius = 20
        self.ExtrasLbl.clipsToBounds = true
        self.ExtrasLbl.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
        
        // Extras Image
        self.ExtrasImg.layer.cornerRadius = 20
        self.ExtrasImg.clipsToBounds = true
        self.ExtrasImg.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
        
        lookAlert()

        // Do any additional setup after loading the view.
    }
    
    func alert()
    {
        let showAlert = UIAlertController(title: "Here's How To Add Data!", message: "Swipe To The Left Of The Account, And Select 'Add;", preferredStyle: .alert)
        let imageView = UIImageView(frame: CGRect(x: 10, y: 50, width: 250, height: 250))
        imageView.image = UIImage(named: "add")
        showAlert.view.addSubview(imageView)
        let height = NSLayoutConstraint(item: showAlert.view, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 320)
        let width = NSLayoutConstraint(item: showAlert.view, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 250)
        showAlert.view.addConstraint(height)
        showAlert.view.addConstraint(width)
        showAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            UserDefaults.standard.set(true, forKey: "KNOWING")
        }))
        self.present(showAlert, animated: true, completion: nil)
    }
    
    func lookAlert()
    {
        let knowing = UserDefaults.standard.bool(forKey: "KNOWING")
        if knowing != true
        {
            alert()
        }
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
