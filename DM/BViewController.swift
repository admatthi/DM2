//
//  BViewController.swift
//  DM
//
//  Created by Alek Matthiessen on 5/7/19.
//  Copyright © 2019 The Matthiessen Group, LLC. All rights reserved.
//

import UIKit

class BViewController: UIViewController, UITextFieldDelegate     {

    @IBOutlet weak var tf: UITextField!
    @IBAction func tapContinue(_ sender: Any) {
        
        let generator = UIImpactFeedbackGenerator(style: .heavy)
        generator.impactOccurred()
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.view.endEditing(true)
        
    }
    @IBOutlet weak var tapcontinue: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tf.becomeFirstResponder()
        tapcontinue.layer.cornerRadius = 10.0
        tapcontinue.layer.masksToBounds = true
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
