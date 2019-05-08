//
//  AViewController.swift
//  DM
//
//  Created by Alek Matthiessen on 5/7/19.
//  Copyright © 2019 The Matthiessen Group, LLC. All rights reserved.
//

import UIKit

class AViewController: UIViewController, UITextFieldDelegate {

    var b1pressed = Bool()
    var b2pressed = Bool()
    var b3pressed = Bool()
    var b4pressed = Bool()
    
    @IBAction func tapContinue(_ sender: Any) {
        
        let generator = UIImpactFeedbackGenerator(style: .heavy)
        generator.impactOccurred()
        
    }
    @IBOutlet weak var tf: UITextField!
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.view.endEditing(true)
        
    }
    @IBOutlet weak var tapcontinue: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

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
