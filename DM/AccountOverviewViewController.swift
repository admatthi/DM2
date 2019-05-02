//
//  AccountOverviewViewController.swift
//  Together
//
//  Created by Alek Matthiessen on 4/10/19.
//  Copyright © 2019 AA Tech. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

var selectedbutton = Int()

class AccountOverviewViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Account", for: indexPath) as! AccountTableViewCell
        cell.selectionStyle = .none
        
        cell.tapb1.addTarget(self, action: #selector(AccountOverviewViewController.tapButton(_:)), for: UIControl.Event.touchUpInside)
        
        cell.tapb1.tag = 0
        cell.tapb2.addTarget(self, action: #selector(AccountOverviewViewController.tapButton(_:)), for: UIControl.Event.touchUpInside)
        
        cell.tapb2.tag = 1
        cell.tapb3.addTarget(self, action: #selector(AccountOverviewViewController.tapButton(_:)), for: UIControl.Event.touchUpInside)
        
        cell.tapb3.tag = 2
        cell.tapb4.addTarget(self, action: #selector(AccountOverviewViewController.tapButton(_:)), for: UIControl.Event.touchUpInside)
        
        cell.tapb4.tag = 3
        cell.tapb5.addTarget(self, action: #selector(AccountOverviewViewController.tapButton(_:)), for: UIControl.Event.touchUpInside)
        
        cell.tapb5.tag = 4
        cell.tapb6.addTarget(self, action: #selector(AccountOverviewViewController.tapButton(_:)), for: UIControl.Event.touchUpInside)
           cell.tapprivacy.addTarget(self, action: #selector(AccountOverviewViewController.tapPrivacy(_:)), for: UIControl.Event.touchUpInside)
           cell.taprate.addTarget(self, action: #selector(AccountOverviewViewController.tapRate(_:)), for: UIControl.Event.touchUpInside)
        
        cell.tapb6.tag = 5
        cell.tapb7.addTarget(self, action: #selector(AccountOverviewViewController.tapButton(_:)), for: UIControl.Event.touchUpInside)
        
        cell.tapbuynow.addTarget(self, action: #selector(AccountOverviewViewController.tapBuyNow(_:)), for: UIControl.Event.touchUpInside)
        
        cell.tapb7.tag = 6
        
        
        return cell
    }
    

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.layer.cornerRadius = 5.0
        // Do any additional setup after loading the view.
    }
    
    @objc func tapButton(_ sender: UIButton) {
        
        
        selectedbutton = sender.tag
        
        self.performSegue(withIdentifier: "AccountToSection", sender: self)
        
    }
    
    @objc func tapBuyNow(_ sender: UIButton) {
        
        if Auth.auth().currentUser == nil {

            self.performSegue(withIdentifier: "AccountToRegister", sender: self)

        } else {
            
            self.performSegue(withIdentifier: "AccountToPurchase", sender: self)

        }
    }
    
    
    
    func rateApp(appId: String, completion: @escaping ((_ success: Bool)->())) {
        guard let url = URL(string : "itms-apps://itunes.apple.com/app/" + appId) else {
            completion(false)
            return
        }
        guard #available(iOS 10, *) else {
            completion(UIApplication.shared.openURL(url))
            return
        }
        UIApplication.shared.open(url, options: [:], completionHandler: completion)
    }
    
    @objc func tapRate(_ sender: UIButton) {
        
    
        rateApp(appId: "id1264546236") { success in
            print("RateApp \(success)")
        
        }
    }
    
    @IBAction func tapLogin(_ sender: Any) {
        
        if Auth.auth().currentUser == nil {

            
            
            self.performSegue(withIdentifier: "AccountToLogin", sender: self)
            
        } else {
            
            try! Auth.auth().signOut()

            self.performSegue(withIdentifier: "AccountToLogin", sender: self)
        }
    }
    @objc func tapPrivacy(_ sender: UIButton) {
        
        
        
        if let url = NSURL(string: "https://www.dmndsjewelry.com/pages/privacy"
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
