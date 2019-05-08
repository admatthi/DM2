//
//  PurchasesViewController.swift
//  DM
//
//  Created by Alek Matthiessen on 5/4/19.
//  Copyright © 2019 The Matthiessen Group, LLC. All rights reserved.
//

import UIKit
import Purchases
import Firebase
import FirebaseAuth

class PurchasesViewController: UIViewController {

    var purchases = Purchases.configure(withAPIKey: "PoYCUyJuZSjXkCreijfZFeXMSIuqsWZX", appUserID: nil)

    @IBOutlet weak var tapmonthly: UIButton!
    @IBOutlet weak var tapsave: UIButton!
    @IBAction func tapMonthly(_ sender: Any) {
        
        
        purchases.entitlements { (entitlements, error) in
            guard let pro = entitlements?["premium"] else { return }
            guard let monthly = pro.offerings["monthly"] else { return }
            guard let product = monthly.activeProduct else { return }
            
            self.purchases.makePurchase(product, { (transaction, purchaserInfo, error, cancelled) in
                if let purchaserInfo = purchaserInfo {
                    
                    print("x")
                    
                    
                    if purchaserInfo.activeEntitlements.contains("my_entitlement_identifier") {
                        // Unlock that great "pro" content
                        
                        self.performSegue(withIdentifier: "PayToCreate", sender: self)
                        
                        print("n")
                    } else {
                        
                        self.performSegue(withIdentifier: "PayToCreate", sender: self)
                        
                        print("y")
                    }
                    
                } else {
                    
//                    self.performSegue(withIdentifier: "PayToCreate", sender: self)
//                    
//                    print("n")
                }
            })
            
        }
    }
    
    @IBOutlet weak var tapyearly: UIButton!
    @IBAction func tapYearly(_ sender: Any) {
        
        
        purchases.entitlements { (entitlements, error) in
            guard let pro = entitlements?["premium"] else { return }
            guard let monthly = pro.offerings["yearly"] else { return }
            guard let product = monthly.activeProduct else { return }
            
            self.purchases.makePurchase(product, { (transaction, purchaserInfo, error, cancelled) in
                if let purchaserInfo = purchaserInfo {
                    
                    print("x")
                    
                    
                    if purchaserInfo.activeEntitlements.contains("my_entitlement_identifier") {
                        // Unlock that great "pro" content
                        
                        self.performSegue(withIdentifier: "PayToCreate", sender: self)
                        
                        print("n")
                    } else {
                        
                        self.performSegue(withIdentifier: "PayToCreate", sender: self)
                        
                        print("y")
                    }
                    
                } else {
                    
//                    self.performSegue(withIdentifier: "PayToCreate", sender: self)
//
//                    print("n")
                }
            })
            
        }
    }
    
    @IBAction func tapRestore(_ sender: Any) {
    }
    @IBAction func tapTerms(_ sender: Any) {
        
        if let url = NSURL(string: "https://www.gethealphysicaltherapy.com/pages/terms"
            ) {
            UIApplication.shared.openURL(url as URL)
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = Database.database().reference()

        
tapsave.layer.cornerRadius = 5
        tapsave.clipsToBounds = true
//        tapmonthly.layer.cornerRadius = 22.0
//        tapmonthly.clipsToBounds = true
//
        tapyearly.layer.cornerRadius = 35.0
        tapyearly.clipsToBounds = true
        // Do any additional setup after loading the view.
    }
    
    @IBAction func tapBack(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
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
