//
//  RegisterViewController.swift
//  Together
//
//  Created by Alek Matthiessen on 11/29/18.
//  Copyright © 2018 AA Tech. All rights reserved.
//

import UIKit
import Firebase
import FirebaseCore
import FirebaseStorage
import FirebaseDatabase
import FirebaseAuth
import FBSDKCoreKit

class RegisterViewController: UIViewController, UITextFieldDelegate     {

    @IBAction func tapTerms(_ sender: Any) {
        
        if let url = NSURL(string: "https://theballrshop.com/pages/terms"
            ) {
            UIApplication.shared.openURL(url as URL)
        }
    }
    @IBOutlet weak var tapterms: UIButton!
    @IBAction func tapSignUp(_ sender: Any) {
        
        signup()
    }
    @IBOutlet weak var errorlabel: UILabel!
    @IBOutlet weak var passwordtf: UITextField!
    @IBOutlet weak var emailtf: UITextField!
    
    func signup() {
        
        
        var email = "\(emailtf.text!)"
        var password = "\(passwordtf.text!)"
        
        Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
            
            if let error = error {
                
                self.errorlabel.alpha = 1
                self.errorlabel.text = error.localizedDescription
                return
                
            } else {
                
                var  uid = (Auth.auth().currentUser?.uid)!
                let values = ["password": password, "email": email]
            Database.database().reference().child("users").child((uid)).child("credentials").updateChildValues(values)
                
                let userInfo = ["email" : email, "password" : password]
                UserDefaults.standard.set(userInfo, forKey: "userInformation")
              
                
                DispatchQueue.main.async {
                    
                    //                    purchased = true
                    
                    let mainStoryboardIpad : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                    let tabBarBuyer : UITabBarController = mainStoryboardIpad.instantiateViewController(withIdentifier: "HomeTab") as! UITabBarController
                    
                    tabBarBuyer.selectedIndex = 1
                    
                    self.performSegue(withIdentifier: "RegisterToTab", sender: self)
                    
                }
            }
            
        }
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.view.endEditing(true)
        
    }
    @IBOutlet weak var tapcreate: UIButton!
    @IBOutlet weak var header: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

//        header.addCharacterSpacing()
        // Do any additional setup after loading the view.
        tapterms.titleLabel?.textAlignment = NSTextAlignment.center
        
        emailtf.layer.borderColor = UIColor.gray.cgColor
        emailtf.layer.borderWidth = 0.5
        passwordtf.layer.borderColor = UIColor.gray.cgColor
        passwordtf.layer.borderWidth = 0.5
        passwordtf.layer.cornerRadius = 2.0
        emailtf.layer.cornerRadius = 2.0
        
//        self.addLineToView(view: emailtf, position:.LINE_POSITION_BOTTOM, color: UIColor.lightGray, width: 0.5)
//
//        self.addLineToView(view: passwordtf, position:.LINE_POSITION_BOTTOM, color: UIColor.lightGray, width: 0.5)
        
        
        ref = Database.database().reference()
        
        emailtf.delegate = self
        passwordtf.delegate = self
        emailtf.becomeFirstResponder()
        //        tapcreate.layer.cornerRadius = 22.0
        //        tapcreate.layer.masksToBounds = true
        
        errorlabel.alpha = 0
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    enum LINE_POSITION {
        case LINE_POSITION_TOP
        case LINE_POSITION_BOTTOM
    }
 
}
