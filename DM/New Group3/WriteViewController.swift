//
//  WriteViewController.swift
//  DM
//
//  Created by Alek Matthiessen on 5/14/19.
//  Copyright © 2019 The Matthiessen Group, LLC. All rights reserved.
//

import UIKit
import Firebase
import IQKeyboardManager

class WriteViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var tf1: UITextField!
    @IBOutlet weak var tf2: UITextField!
    @IBOutlet weak var tf3: UITextField!
    @IBOutlet weak var tf4: UITextField!
    @IBOutlet weak var tf5: UITextField!
    @IBOutlet weak var tf6: UITextField!
    @IBOutlet weak var tf7: UITextField!
    @IBOutlet weak var tf8: UITextField!
    @IBOutlet weak var tf9: UITextField!
    
    @IBOutlet weak var t10: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ref = Database.database().reference()

        self.addLineToView(view: tf1, position:.LINE_POSITION_BOTTOM, color: UIColor.lightGray, width: 0.5)
        
           self.addLineToView(view: tf2, position:.LINE_POSITION_BOTTOM, color: UIColor.lightGray, width: 0.5)
           self.addLineToView(view: tf3, position:.LINE_POSITION_BOTTOM, color: UIColor.lightGray, width: 0.5)
           self.addLineToView(view: tf4, position:.LINE_POSITION_BOTTOM, color: UIColor.lightGray, width: 0.5)
           self.addLineToView(view: tf5, position:.LINE_POSITION_BOTTOM, color: UIColor.lightGray, width: 0.5)
           self.addLineToView(view: tf6, position:.LINE_POSITION_BOTTOM, color: UIColor.lightGray, width: 0.5)
           self.addLineToView(view: tf7, position:.LINE_POSITION_BOTTOM, color: UIColor.lightGray, width: 0.5)
           self.addLineToView(view: tf8, position:.LINE_POSITION_BOTTOM, color: UIColor.lightGray, width: 0.5)
           self.addLineToView(view: tf9, position:.LINE_POSITION_BOTTOM, color: UIColor.lightGray, width: 0.5)
        // Do any additional setup after loading the view.
        
        t10.layer.borderWidth = 0.5
        t10.layer.borderColor = UIColor.lightGray.cgColor
        t10.layer.cornerRadius = 5.0
        
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT") //Set timezone that you want
        dateFormatter.locale = NSLocale.current
        dateFormatter.dateFormat = "y-MM-dd" //Specify your format that you want
        strDate = dateFormatter.string(from: date)
    }
    
    var strDate = String()
    @IBAction func tapSave(_ sender: Any) {
        
        
        if tf1.text != "" {
        ref?.child("Users").child(uid).child("Gratitude").child("1\(strDate)").updateChildValues(["Text" : tf1.text!, "Date" : strDate])
        
        }
    
        if tf2.text != "" {
            ref?.child("Users").child(uid).child("Gratitude").child("2\(strDate)").updateChildValues(["Text" : tf2.text!, "Date" : strDate])
            
        }
        
        if tf3.text != "" {
            ref?.child("Users").child(uid).child("Gratitude").child("3\(strDate)").updateChildValues(["Text" : tf3.text!, "Date" : strDate])
            
        }
        
        
        if tf4.text != "" {
            ref?.child("Users").child(uid).child("Lessons").child("1\(strDate)").updateChildValues(["Text" : tf4.text!, "Date" : strDate])
            
        }
        
        if tf5.text != "" {
            ref?.child("Users").child(uid).child("Lessons").child("2\(strDate)").updateChildValues(["Text" : tf5.text!, "Date" : strDate])
            
        }
        
        if tf6.text != "" {
           
            ref?.child("Users").child(uid).child("Lessons").child("3\(strDate)").updateChildValues(["Text" : tf6.text!, "Date" : strDate])
            
        }
        
        
        if tf7.text != "" {
            ref?.child("Users").child(uid).child("Wins").child("1\(strDate)").updateChildValues(["Text" : tf7.text!, "Date" : strDate])
            
        }
        
        if tf8.text != "" {
            ref?.child("Users").child(uid).child("Wins").child("2\(strDate)").updateChildValues(["Text" : tf8.text!, "Date" : strDate])
            
        }
        
        if tf9.text != "" {
            ref?.child("Users").child(uid).child("Wins").child("3\(strDate)").updateChildValues(["Text" : tf9.text!, "Date" : strDate])
            
        }
        
        if t10.text != "" {
            ref?.child("Users").child(uid).child("Notes").child("3\(strDate)").updateChildValues(["Text" : t10.text!, "Date" : strDate])
            
        }
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        

        
        
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.view.endEditing(true)
        
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
    
    func addLineToView(view : UIView, position : LINE_POSITION, color: UIColor, width: Double) {
        let lineView = UIView()
        lineView.backgroundColor = color
        lineView.translatesAutoresizingMaskIntoConstraints = false // This is important!
        view.addSubview(lineView)
        
        let metrics = ["width" : NSNumber(value: width)]
        let views = ["lineView" : lineView]
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[lineView]|", options:NSLayoutConstraint.FormatOptions(rawValue: 0), metrics:metrics, views:views))
        
        switch position {
        case .LINE_POSITION_TOP:
            view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[lineView(width)]", options:NSLayoutConstraint.FormatOptions(rawValue: 0), metrics:metrics, views:views))
            break
        case .LINE_POSITION_BOTTOM:
            view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[lineView(width)]|", options:NSLayoutConstraint.FormatOptions(rawValue: 0), metrics:metrics, views:views))
            break
        default:
            break
        }
    }

    
}

