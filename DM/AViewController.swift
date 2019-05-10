//
//  AViewController.swift
//  DM
//
//  Created by Alek Matthiessen on 5/7/19.
//  Copyright © 2019 The Matthiessen Group, LLC. All rights reserved.
//

import UIKit

var myage = String()
class AViewController: UIViewController, UITextFieldDelegate {

    var b1pressed = Bool()
    var b2pressed = Bool()
    var b3pressed = Bool()
    var b4pressed = Bool()
    
    @IBAction func tapContinue(_ sender: Any) {
        
        if tf.text != "" {
            
            myname = tf.text!
        }
        let generator = UIImpactFeedbackGenerator(style: .heavy)
        generator.impactOccurred()
        
        
        self.performSegue(withIdentifier: "Path2", sender: self)
        
        
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        //textField code
        self.view.endEditing(true)
        
        
        return true
    }

    @IBOutlet weak var tf: UITextField!
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.view.endEditing(true)
        
    }
    @IBOutlet weak var tapcontinue: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tf.delegate = self
        tapcontinue.layer.cornerRadius = 10.0
        tapcontinue.layer.masksToBounds = true
        tf.becomeFirstResponder()
        
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

}
