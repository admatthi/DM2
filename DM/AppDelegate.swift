//
//  AppDelegate.swift
//  DM
//
//  Created by Alek Matthiessen on 4/12/19.
//  Copyright © 2019 The Matthiessen Group, LLC. All rights reserved.
//

import UIKit
import Firebase
import Purchases

protocol SnippetsPurchasesDelegate: AnyObject {
    
    func purchaseCompleted(product: String)
    
}

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    var purchases: Purchases?

    weak var purchasesdelegate : SnippetsPurchasesDelegate?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        FirebaseApp.configure()
        
        
        Purchases.debugLogsEnabled = true
        Purchases.configure(withAPIKey: "PoYCUyJuZSjXkCreijfZFeXMSIuqsWZX", appUserID: "my_app_user_id")
        
        ref = Database.database().reference()
        
        if Auth.auth().currentUser == nil {
            //
            
//            let mainStoryboardIpad : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//            let initialViewControlleripad : UIViewController = mainStoryboardIpad.instantiateViewController(withIdentifier: "Register") as UIViewController
//            self.window = UIWindow(frame: UIScreen.main.bounds)
//            self.window?.rootViewController = initialViewControlleripad
//            self.window?.makeKeyAndVisible()
            
            let mainStoryboardIpad : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let initialViewControlleripad : UIViewController = mainStoryboardIpad.instantiateViewController(withIdentifier: "Chat") as UIViewController
            self.window = UIWindow(frame: UIScreen.main.bounds)
            self.window?.rootViewController = initialViewControlleripad
            self.window?.makeKeyAndVisible()
            
        } else {
            
            uid = (Auth.auth().currentUser?.uid)!
            
            if uid == "rmmMbNlS5ZPoE2OPTOetUVYBWqf2" {
                
                let mainStoryboardIpad : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let initialViewControlleripad : UIViewController = mainStoryboardIpad.instantiateViewController(withIdentifier: "Conversations") as UIViewController
                self.window = UIWindow(frame: UIScreen.main.bounds)
                self.window?.rootViewController = initialViewControlleripad
                self.window?.makeKeyAndVisible()
                
            } else {
                
                let mainStoryboardIpad : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let initialViewControlleripad : UIViewController = mainStoryboardIpad.instantiateViewController(withIdentifier: "Chat") as UIViewController
                self.window = UIWindow(frame: UIScreen.main.bounds)
                self.window?.rootViewController = initialViewControlleripad
                self.window?.makeKeyAndVisible()
                
                
            }
        }
        
        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    func letsgo() {
        
        
        if Auth.auth().currentUser != nil {
                        
            ref?.child("Snippets").child("Users").child(uid).updateChildValues(["Purchased" : "Yes"])
            
            let mainStoryboardIpad : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            
            
            let initialViewControlleripad : UIViewController = mainStoryboardIpad.instantiateViewController(withIdentifier: "Chat") as UIViewController
            self.window = UIWindow(frame: UIScreen.main.bounds)
            self.window?.rootViewController = initialViewControlleripad
            self.window?.makeKeyAndVisible()//
            
        }
        
    }
    
    
}

extension AppDelegate: PurchasesDelegate {
    func purchases(_ purchases: Purchases, completedTransaction transaction: SKPaymentTransaction, withUpdatedInfo purchaserInfo: PurchaserInfo) {
        
        self.purchasesdelegate?.purchaseCompleted(product: transaction.payment.productIdentifier)
        
       
        
        
        letsgo()
        
    }
    
    func purchases(_ purchases: Purchases, receivedUpdatedPurchaserInfo purchaserInfo: PurchaserInfo) {
        //        handlePurchaserInfo(purchaserInfo)
        
        print(purchaserInfo)
        
    }
    
    func purchases(_ purchases: Purchases, failedToUpdatePurchaserInfoWithError error: Error) {
        print(error)
        

    }
    
    func purchases(_ purchases: Purchases, failedTransaction transaction: SKPaymentTransaction, withReason failureReason: Error) {
        print(failureReason)
        

    }
    
    func purchases(_ purchases: Purchases, restoredTransactionsWith purchaserInfo: PurchaserInfo) {
        //        handlePurchaserInfo(purchaserInfo)
        
   
        letsgo()
        
        
    }
    
    func purchases(_ purchases: Purchases, failedToRestoreTransactionsWithError error: Error) {
        print(error)
        
    }
}
