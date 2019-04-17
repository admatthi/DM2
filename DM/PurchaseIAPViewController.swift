//
//  PurchaseIAPViewController.swift
//  DM
//
//  Created by Alek Matthiessen on 4/14/19.
//  Copyright © 2019 The Matthiessen Group, LLC. All rights reserved.
//

import UIKit
import Purchases

class PurchaseIAPViewController: UIViewController {

    @IBAction func tapBack(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        productselected = "Monthly"
        tapmonthly.alpha = 1
        tapyearly.alpha = 0.25
        
        
        // Do any additional setup after loading the view.
    }
    
    var purchases = Purchases.configure(withAPIKey: "PoYCUyJuZSjXkCreijfZFeXMSIuqsWZX", appUserID: nil)

   
    @IBAction func tapRestore(_ sender: Any) {
    }
    @IBOutlet weak var tapmonthly: UIButton!
    @IBOutlet weak var tapyearly: UIButton!
    
    var productselected = String()
    
    @IBAction func tapBuy(_ sender: Any) {
        
        
        if productselected == "Yearly" {
            
         
        purchases.entitlements { (entitlements, error) in
            guard let pro = entitlements?["premium"] else { return }
            guard let monthly = pro.offerings["yearly"] else { return }
            guard let product = monthly.activeProduct else { return }
            
            self.purchases.makePurchase(product, { (transaction, purchaserInfo, error, cancelled) in
                if let purchaserInfo = purchaserInfo {
                    
                    if purchaserInfo.activeEntitlements.contains("my_entitlement_identifier") {
                        // Unlock that great "pro" content
                        
                        self.performSegue(withIdentifier: "PayToChat", sender: self)
                    }
                    
                }
            })


        }
            
        } else {
            
            purchases.entitlements { (entitlements, error) in
                guard let pro = entitlements?["premium"] else { return }
                guard let monthly = pro.offerings["monthly"] else { return }
                guard let product = monthly.activeProduct else { return }
                
       
                self.purchases.makePurchase(product, { (transaction, purchaserInfo, error, cancelled) in
                    
                    print(error?.localizedDescription)

                    if let purchaserInfo = purchaserInfo {
                        
                        ref?.child("Users").child(uid).updateChildValues(["Purchased" : "True"])

                        DispatchQueue.main.async {
                            
                            self.performSegue(withIdentifier: "PayToChat", sender: self)
                        }
                        
//                        if purchaserInfo.activeEntitlements.contains("my_entitlement_identifier") {
//                            // Unlock that great "pro" content
//                            
//                            
//                         
//                          
//                        }
                        
                    } else {
                        
                        print(error?.localizedDescription)
                    }
                })
                
                
            }
            
        }
    }
    @IBAction func tapBuyMonthly
        (_ sender: Any) {
        
        productselected = "Monthly"
        tapmonthly.alpha = 1
        tapyearly.alpha = 0.25
    }
    @IBAction func tapBuyYearly(_ sender: Any) {
        
        productselected = "Yearly"
        
        tapmonthly.alpha =  0.25
        tapyearly.alpha = 1
    }
    
    @IBAction func tapAccept(_ sender: Any) {
        
        if let url = NSURL(string: "https://www.dmndsjewelry.com/pages/terms"
            ) {
            UIApplication.shared.openURL(url as URL)
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
