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
                    
                  
                    
                    if uid != "rmmMbNlS5ZPoE2OPTOetUVYBWqf2" {
                        
                        let content = "Hi, welcome to Coach! I'm Alek, your consultation coach. I've been working in weight loss and fitness for over 10 years. I'll be explaining how Coach works and guiding you through our subscription options for working with a weight loss coach here. When you're ready to start being coached, I'll help you find a coach who is best suited to your specific health needs. Would you please share your name, age, and what health concerns you would like to work?"
                        
                        
                        let values = ["type": "text", "content": content, "fromID": "rmmMbNlS5ZPoE2OPTOetUVYBWqf2", "toID": uid, "timestamp": Int(Date().timeIntervalSince1970), "isRead": false] as [String : Any]
                        
                        Database.database().reference().child("conversations").childByAutoId().childByAutoId().setValue(values, withCompletionBlock: { (error, reference) in
                            let data = ["location": reference.parent!.key]
                            Database.database().reference().child("users").child("rmmMbNlS5ZPoE2OPTOetUVYBWqf2").child("conversations").child(uid).updateChildValues(data)
                            Database.database().reference().child("users").child(uid).child("conversations").child("rmmMbNlS5ZPoE2OPTOetUVYBWqf2").updateChildValues(data)
                            
                            NotificationCenter.default.post(name: Notification.Name(rawValue: "disconnectPaxiSockets"), object: nil)
                            
                            self.performSegue(withIdentifier: "RegisterToChat", sender: self)

                        })
                        
                    }
                    
                    
//                    let message = Message.init(type: type, content: content, owner: .sender, timestamp: Int(Date().timeIntervalSince1970), isRead: false)
//                    Message.send(message: message, toID: selectedid, completion: {(_) in
//                    })
                    
                    
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
