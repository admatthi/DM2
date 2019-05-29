//
//  PlanViewController.swift
//  DM
//
//  Created by Alek Matthiessen on 5/4/19.
//  Copyright © 2019 The Matthiessen Group, LLC. All rights reserved.
//

import UIKit
import Firebase

var mybluefont = UIColor(red:0.61, green:0.63, blue:0.73, alpha:1.0)

var myblueback = UIColor(red:0.09, green:0.78, blue:0.91, alpha:1.0)

var armpress = Bool()
var hippressed = Bool()
var lbpressed = Bool()
var pelvispressed = Bool()
var ubpressed = Bool()
var anklepressed = Bool()
var kneepressed = Bool()
var neckpressed = Bool()
var shoulderpressed = Bool()
var opressed = Bool()
var yespressed = Bool()
var nopressed = Bool()

var selectedmusclegroup = String()
var selectedinjury = String()
class PlanViewController: UIViewController {

    @IBOutlet weak var tapwrist: UIButton!
    
    @IBOutlet weak var taphand: UIButton!
    @IBOutlet weak var tapelbow: UIButton!
    @IBOutlet weak var tapleg: UIButton!
    @IBOutlet weak var tapfoot: UIButton!
    @IBOutlet weak var taphip: UIButton!
    @IBOutlet weak var taplb: UIButton!
    @IBOutlet weak var tappelvis: UIButton!
    @IBOutlet weak var tapub: UIButton!
    @IBOutlet weak var tapankle: UIButton!
    @IBOutlet weak var tapknee: UIButton!
    @IBOutlet weak var tapneck: UIButton!
    @IBOutlet weak var tapshoulder: UIButton!
    @IBOutlet weak var tapo: UIButton!
    @IBOutlet weak var tapyes: UIButton!
    @IBOutlet weak var tapno: UIButton!
    

    
    func allboolsfalse() {
        
         armpress = false
         hippressed = false
         lbpressed = false
         pelvispressed = false
         ubpressed = false
         anklepressed = false
         kneepressed = false
         neckpressed = false
         shoulderpressed = false
         opressed = false
        
    }
    @IBAction func tapHand(_ sender: Any) {
        
        
        allboolsfalse()
        selectedmusclegroup = "Hand"
        taphand.backgroundColor = myblueback
        taphand.setTitleColor(.white, for: .normal)
        taphip.backgroundColor = .white
        taphip.setTitleColor(mybluefont, for: .normal)
        taplb.backgroundColor = .white
        taplb.setTitleColor(mybluefont, for: .normal)
       tapelbow.backgroundColor = .white
        tapelbow.setTitleColor(mybluefont, for: .normal)
        tapub.backgroundColor = .white
        tapub.setTitleColor(mybluefont, for: .normal)
        tapankle.backgroundColor = .white
        tapankle.setTitleColor(mybluefont, for: .normal)
        tapknee.backgroundColor = .white
        tapknee.setTitleColor(mybluefont, for: .normal)
        tapneck.backgroundColor = .white
        tapneck.setTitleColor(mybluefont, for: .normal)
        tapshoulder.backgroundColor = .white
        tapshoulder.setTitleColor(mybluefont, for: .normal)
        
        
        tapwrist.backgroundColor = .white
        tapwrist.setTitleColor(mybluefont, for: .normal)

        tapleg.backgroundColor = .white
        tapleg.setTitleColor(mybluefont, for: .normal)
        tapfoot.backgroundColor = .white
        tapfoot.setTitleColor(mybluefont, for: .normal)
    }
    
    @IBAction func tapHip(_ sender: Any) {
        
        allboolsfalse()
        selectedmusclegroup = "Hip"
        taphip.backgroundColor = myblueback
        taphip.setTitleColor(.white, for: .normal)

        taplb.backgroundColor = .white
        taplb.setTitleColor(mybluefont, for: .normal)
       tapelbow.backgroundColor = .white
        tapelbow.setTitleColor(mybluefont, for: .normal)
        tapub.backgroundColor = .white
        tapub.setTitleColor(mybluefont, for: .normal)
        tapankle.backgroundColor = .white
        tapankle.setTitleColor(mybluefont, for: .normal)
        tapknee.backgroundColor = .white
        tapknee.setTitleColor(mybluefont, for: .normal)
        tapneck.backgroundColor = .white
        tapneck.setTitleColor(mybluefont, for: .normal)
        tapshoulder.backgroundColor = .white
        tapshoulder.setTitleColor(mybluefont, for: .normal)
        
        tapwrist.backgroundColor = .white
        tapwrist.setTitleColor(mybluefont, for: .normal)
        taphand.backgroundColor = .white
        taphand.setTitleColor(mybluefont, for: .normal)
        tapleg.backgroundColor = .white
        tapleg.setTitleColor(mybluefont, for: .normal)
        tapfoot.backgroundColor = .white
        tapfoot.setTitleColor(mybluefont, for: .normal)
    }
    
    @IBAction func tapLB(_ sender: Any) {
        allboolsfalse()
        selectedmusclegroup = "Lower Back"
        taplb.backgroundColor = myblueback
        taplb.setTitleColor(.white, for: .normal)

        taphip.backgroundColor = .white
        taphip.setTitleColor(mybluefont, for: .normal)
       tapelbow.backgroundColor = .white
        tapelbow.setTitleColor(mybluefont, for: .normal)
        tapub.backgroundColor = .white
        tapub.setTitleColor(mybluefont, for: .normal)
        tapankle.backgroundColor = .white
        tapankle.setTitleColor(mybluefont, for: .normal)
        tapknee.backgroundColor = .white
        tapknee.setTitleColor(mybluefont, for: .normal)
        tapneck.backgroundColor = .white
        tapneck.setTitleColor(mybluefont, for: .normal)
        tapshoulder.backgroundColor = .white
        tapshoulder.setTitleColor(mybluefont, for: .normal)
        
        tapwrist.backgroundColor = .white
        tapwrist.setTitleColor(mybluefont, for: .normal)
        taphand.backgroundColor = .white
        taphand.setTitleColor(mybluefont, for: .normal)
        tapleg.backgroundColor = .white
        tapleg.setTitleColor(mybluefont, for: .normal)
        tapfoot.backgroundColor = .white
        tapfoot.setTitleColor(mybluefont, for: .normal)
    }
    @IBAction func tapElbow(_ sender: Any) {
        allboolsfalse()
        selectedmusclegroup = "Pelvis"
        tapelbow.backgroundColor = myblueback
        tapelbow.setTitleColor(.white, for: .normal)

        taphip.backgroundColor = .white
        taphip.setTitleColor(mybluefont, for: .normal)
        taplb.backgroundColor = .white
        taplb.setTitleColor(mybluefont, for: .normal)
        tapub.backgroundColor = .white
        tapub.setTitleColor(mybluefont, for: .normal)
        tapankle.backgroundColor = .white
        tapankle.setTitleColor(mybluefont, for: .normal)
        tapknee.backgroundColor = .white
        tapknee.setTitleColor(mybluefont, for: .normal)
        tapneck.backgroundColor = .white
        tapneck.setTitleColor(mybluefont, for: .normal)
        tapshoulder.backgroundColor = .white
        tapshoulder.setTitleColor(mybluefont, for: .normal)
        
        tapwrist.backgroundColor = .white
        tapwrist.setTitleColor(mybluefont, for: .normal)
        taphand.backgroundColor = .white
        taphand.setTitleColor(mybluefont, for: .normal)
        tapleg.backgroundColor = .white
        tapleg.setTitleColor(mybluefont, for: .normal)
        tapfoot.backgroundColor = .white
        tapfoot.setTitleColor(mybluefont, for: .normal)
    }
    
    @IBAction func tapUB(_ sender: Any) {
        allboolsfalse()
        selectedmusclegroup = "Upper Back"
        tapub.backgroundColor = myblueback
        tapub.setTitleColor(.white, for: .normal)
        taphip.backgroundColor = .white
        taphip.setTitleColor(mybluefont, for: .normal)
       tapelbow.backgroundColor = .white
        tapelbow.setTitleColor(mybluefont, for: .normal)
        taplb.backgroundColor = .white
        taplb.setTitleColor(mybluefont, for: .normal)
        tapankle.backgroundColor = .white
        tapankle.setTitleColor(mybluefont, for: .normal)
        tapknee.backgroundColor = .white
        tapknee.setTitleColor(mybluefont, for: .normal)
        tapneck.backgroundColor = .white
        tapneck.setTitleColor(mybluefont, for: .normal)
        tapshoulder.backgroundColor = .white
        tapshoulder.setTitleColor(mybluefont, for: .normal)
        
        tapwrist.backgroundColor = .white
        tapwrist.setTitleColor(mybluefont, for: .normal)
        taphand.backgroundColor = .white
        taphand.setTitleColor(mybluefont, for: .normal)
        tapleg.backgroundColor = .white
        tapleg.setTitleColor(mybluefont, for: .normal)
        tapfoot.backgroundColor = .white
        tapfoot.setTitleColor(mybluefont, for: .normal)
    }
    
    @IBAction func tapAnkle(_ sender: Any) {
        allboolsfalse()
        selectedmusclegroup = "Ankle"
        tapankle.backgroundColor = myblueback
        tapankle.setTitleColor(.white, for: .normal)

        taphip.backgroundColor = .white
        taphip.setTitleColor(mybluefont, for: .normal)
       tapelbow.backgroundColor = .white
        tapelbow.setTitleColor(mybluefont, for: .normal)
        tapub.backgroundColor = .white
        tapub.setTitleColor(mybluefont, for: .normal)
        taplb.backgroundColor = .white
        taplb.setTitleColor(mybluefont, for: .normal)
        tapknee.backgroundColor = .white
        tapknee.setTitleColor(mybluefont, for: .normal)
        tapneck.backgroundColor = .white
        tapneck.setTitleColor(mybluefont, for: .normal)
        tapshoulder.backgroundColor = .white
        tapshoulder.setTitleColor(mybluefont, for: .normal)
        
        tapwrist.backgroundColor = .white
        tapwrist.setTitleColor(mybluefont, for: .normal)
        taphand.backgroundColor = .white
        taphand.setTitleColor(mybluefont, for: .normal)
        tapleg.backgroundColor = .white
        tapleg.setTitleColor(mybluefont, for: .normal)
        tapfoot.backgroundColor = .white
        tapfoot.setTitleColor(mybluefont, for: .normal)
    }
    
    @IBAction func tapKnee(_ sender: Any) {
        allboolsfalse()
        selectedmusclegroup = "Knee"
        tapknee.backgroundColor = myblueback
        tapknee.setTitleColor(.white, for: .normal)
        tapwrist.backgroundColor = .white
        tapwrist.setTitleColor(mybluefont, for: .normal)
        taphand.backgroundColor = .white
        taphand.setTitleColor(mybluefont, for: .normal)
        tapleg.backgroundColor = .white
        tapleg.setTitleColor(mybluefont, for: .normal)
        tapfoot.backgroundColor = .white
        tapfoot.setTitleColor(mybluefont, for: .normal)
        taphip.backgroundColor = .white
        taphip.setTitleColor(mybluefont, for: .normal)
       tapelbow.backgroundColor = .white
        tapelbow.setTitleColor(mybluefont, for: .normal)
        tapub.backgroundColor = .white
        tapub.setTitleColor(mybluefont, for: .normal)
        tapankle.backgroundColor = .white
        tapankle.setTitleColor(mybluefont, for: .normal)
        taplb.backgroundColor = .white
        taplb.setTitleColor(mybluefont, for: .normal)
        tapneck.backgroundColor = .white
        tapneck.setTitleColor(mybluefont, for: .normal)
        tapshoulder.backgroundColor = .white
        tapshoulder.setTitleColor(mybluefont, for: .normal)
        
    }
    
    @IBAction func tapNeck(_ sender: Any) {
        allboolsfalse()
        selectedmusclegroup = "Neck"
        tapneck.backgroundColor = myblueback
        tapneck.setTitleColor(.white, for: .normal)
        tapwrist.backgroundColor = .white
        tapwrist.setTitleColor(mybluefont, for: .normal)
        taphand.backgroundColor = .white
        taphand.setTitleColor(mybluefont, for: .normal)
        tapleg.backgroundColor = .white
        tapleg.setTitleColor(mybluefont, for: .normal)
        tapfoot.backgroundColor = .white
        tapfoot.setTitleColor(mybluefont, for: .normal)
        taphip.backgroundColor = .white
        taphip.setTitleColor(mybluefont, for: .normal)
       tapelbow.backgroundColor = .white
        tapelbow.setTitleColor(mybluefont, for: .normal)
        tapub.backgroundColor = .white
        tapub.setTitleColor(mybluefont, for: .normal)
        tapankle.backgroundColor = .white
        tapankle.setTitleColor(mybluefont, for: .normal)
        tapknee.backgroundColor = .white
        tapknee.setTitleColor(mybluefont, for: .normal)
        taplb.backgroundColor = .white
        taplb.setTitleColor(mybluefont, for: .normal)
        tapshoulder.backgroundColor = .white
        tapshoulder.setTitleColor(mybluefont, for: .normal)
        
    }
    
    @IBAction func tapFoot(_ sender: Any) {
        
        allboolsfalse()
        selectedmusclegroup = "Foot"
        tapfoot.backgroundColor = myblueback
        tapfoot.setTitleColor(.white, for: .normal)
        tapwrist.backgroundColor = .white
        tapwrist.setTitleColor(mybluefont, for: .normal)
        taphand.backgroundColor = .white
        taphand.setTitleColor(mybluefont, for: .normal)
        tapleg.backgroundColor = .white
        tapleg.setTitleColor(mybluefont, for: .normal)
        tapshoulder.backgroundColor = .white
        tapshoulder.setTitleColor(mybluefont, for: .normal)
        taphip.backgroundColor = .white
        taphip.setTitleColor(mybluefont, for: .normal)
        tapelbow.backgroundColor = .white
        tapelbow.setTitleColor(mybluefont, for: .normal)
        tapub.backgroundColor = .white
        tapub.setTitleColor(mybluefont, for: .normal)
        tapankle.backgroundColor = .white
        tapankle.setTitleColor(mybluefont, for: .normal)
        tapknee.backgroundColor = .white
        tapknee.setTitleColor(mybluefont, for: .normal)
        tapneck.backgroundColor = .white
        tapneck.setTitleColor(mybluefont, for: .normal)
        taplb.backgroundColor = .white
        taplb.setTitleColor(mybluefont, for: .normal)
        
    }
    @IBAction func tapShoulder(_ sender: Any) {
        allboolsfalse()
        selectedmusclegroup = "Shoulder"
        tapshoulder.backgroundColor = myblueback
        tapshoulder.setTitleColor(.white, for: .normal)
        tapwrist.backgroundColor = .white
        tapwrist.setTitleColor(mybluefont, for: .normal)
        taphand.backgroundColor = .white
        taphand.setTitleColor(mybluefont, for: .normal)
        tapleg.backgroundColor = .white
        tapleg.setTitleColor(mybluefont, for: .normal)
        tapfoot.backgroundColor = .white
        tapfoot.setTitleColor(mybluefont, for: .normal)
        taphip.backgroundColor = .white
        taphip.setTitleColor(mybluefont, for: .normal)
       tapelbow.backgroundColor = .white
        tapelbow.setTitleColor(mybluefont, for: .normal)
        tapub.backgroundColor = .white
        tapub.setTitleColor(mybluefont, for: .normal)
        tapankle.backgroundColor = .white
        tapankle.setTitleColor(mybluefont, for: .normal)
        tapknee.backgroundColor = .white
        tapknee.setTitleColor(mybluefont, for: .normal)
        tapneck.backgroundColor = .white
        tapneck.setTitleColor(mybluefont, for: .normal)
        taplb.backgroundColor = .white
        taplb.setTitleColor(mybluefont, for: .normal)
        
    }
    
    @IBAction func tapOther(_ sender: Any) {
        allboolsfalse()
        selectedmusclegroup = "Wrist"
        tapwrist.backgroundColor = myblueback
        tapwrist.setTitleColor(.white, for: .normal)
        taphand.backgroundColor = .white
        taphand.setTitleColor(mybluefont, for: .normal)
        tapleg.backgroundColor = .white
        tapleg.setTitleColor(mybluefont, for: .normal)
        tapfoot.backgroundColor = .white
        tapfoot.setTitleColor(mybluefont, for: .normal)
        taphip.backgroundColor = .white
        taphip.setTitleColor(mybluefont, for: .normal)
       tapelbow.backgroundColor = .white
        tapelbow.setTitleColor(mybluefont, for: .normal)
        tapub.backgroundColor = .white
        tapub.setTitleColor(mybluefont, for: .normal)
        tapankle.backgroundColor = .white
        tapankle.setTitleColor(mybluefont, for: .normal)
        tapknee.backgroundColor = .white
        tapknee.setTitleColor(mybluefont, for: .normal)
        tapneck.backgroundColor = .white
        tapneck.setTitleColor(mybluefont, for: .normal)
        tapshoulder.backgroundColor = .white
        tapshoulder.setTitleColor(mybluefont, for: .normal)
        taplb.backgroundColor = .white
        taplb.setTitleColor(mybluefont, for: .normal)
    }
    
    @IBAction func tapLeg(_ sender: Any) {
        
        allboolsfalse()
        selectedmusclegroup = "Leg"
        tapleg.backgroundColor = myblueback
        tapleg.setTitleColor(.white, for: .normal)
        taphand.backgroundColor = .white
        taphand.setTitleColor(mybluefont, for: .normal)
        tapwrist.backgroundColor = .white
        tapwrist.setTitleColor(mybluefont, for: .normal)
        tapfoot.backgroundColor = .white
        tapfoot.setTitleColor(mybluefont, for: .normal)
        taphip.backgroundColor = .white
        taphip.setTitleColor(mybluefont, for: .normal)
        tapelbow.backgroundColor = .white
        tapelbow.setTitleColor(mybluefont, for: .normal)
        tapub.backgroundColor = .white
        tapub.setTitleColor(mybluefont, for: .normal)
        tapankle.backgroundColor = .white
        tapankle.setTitleColor(mybluefont, for: .normal)
        tapknee.backgroundColor = .white
        tapknee.setTitleColor(mybluefont, for: .normal)
        tapneck.backgroundColor = .white
        tapneck.setTitleColor(mybluefont, for: .normal)
        tapshoulder.backgroundColor = .white
        tapshoulder.setTitleColor(mybluefont, for: .normal)
        taplb.backgroundColor = .white
        taplb.setTitleColor(mybluefont, for: .normal)
    }
    @IBAction func tapYes(_ sender: Any) {
        selectedinjury = "Yes"
        tapyes.backgroundColor = myblueback
        tapyes.setTitleColor(.white, for: .normal)
        tapno.backgroundColor = .white
        tapno.setTitleColor(mybluefont, for: .normal)
    }
    
    @IBAction func tapNo(_ sender: Any) {
        selectedinjury = "No"
        tapno.backgroundColor = myblueback
        tapno.setTitleColor(.white, for: .normal)
        tapyes.backgroundColor = .white
        tapyes.setTitleColor(mybluefont, for: .normal)
        
    }
    
    @IBAction func tapPlan(_ sender: Any) {
    }
    
    @IBOutlet weak var tapplan: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        tapwrist.layer.cornerRadius = 30.0
        tapwrist.layer.masksToBounds = true
        taphand.layer.cornerRadius = 30.0
        taphand.layer.masksToBounds = true
        tapleg.layer.cornerRadius = 30.0
        tapleg.layer.masksToBounds = true
        tapfoot.layer.cornerRadius = 30.0
        tapfoot.layer.masksToBounds = true
        
        taphip.layer.cornerRadius = 30.0
        taphip.layer.masksToBounds = true
        taplb.layer.cornerRadius = 30.0
        taplb.layer.masksToBounds = true

        tapub.layer.cornerRadius = 30.0
        tapub.layer.masksToBounds = true
        tapankle.layer.cornerRadius = 30.0
        tapankle.layer.masksToBounds = true
        tapknee.layer.cornerRadius = 30.0
        tapknee.layer.masksToBounds = true
        tapneck.layer.cornerRadius = 30.0
        tapneck.layer.masksToBounds = true
        tapshoulder.layer.cornerRadius = 30.0
        tapshoulder.layer.masksToBounds = true
        tapelbow.layer.cornerRadius = 30.0
        tapelbow.layer.masksToBounds = true
   
        
        if selectedmusclegroup == "Hand" {
            
            selectedmusclegroup = "Hand"
            taphand.backgroundColor = myblueback
            taphand.setTitleColor(.white, for: .normal)

        }
        
        if selectedmusclegroup == "Hip" {
            
            selectedmusclegroup = "Hip"
            taphip.backgroundColor = myblueback
            taphip.setTitleColor(.white, for: .normal)
        }
        
        if selectedmusclegroup == "Lower Back" {
            
            taplb.backgroundColor = myblueback
            taplb.setTitleColor(.white, for: .normal)
        }
        
        if selectedmusclegroup == "Pelvis" {
            
            tappelvis.backgroundColor = myblueback
            tappelvis.setTitleColor(.white, for: .normal)
        }
        
        if selectedmusclegroup == "Upper Back" {
            tapub.backgroundColor = myblueback
            tapub.setTitleColor(.white, for: .normal)
            
        }
        
        if selectedmusclegroup == "Ankle" {
            
            tapankle.backgroundColor = myblueback
            tapankle.setTitleColor(.white, for: .normal)
        }
        
        if selectedmusclegroup == "Knee" {
            
            tapknee.backgroundColor = myblueback
            tapknee.setTitleColor(.white, for: .normal)
        }
        
        if selectedmusclegroup == "Neck" {
            
            tapneck.backgroundColor = myblueback
            tapneck.setTitleColor(.white, for: .normal)
        }
        
        if selectedmusclegroup == "Shoulder" {
            tapshoulder.backgroundColor = myblueback
            tapshoulder.setTitleColor(.white, for: .normal)
            
        }
        
        if selectedmusclegroup == "Other" {
            
            tapo.backgroundColor = myblueback
            tapo.setTitleColor(.white, for: .normal)
        }
        
        if selectedinjury == "Yes" {
            
            tapyes.backgroundColor = myblueback
            tapyes.setTitleColor(.white, for: .normal)
        }
        if selectedinjury == "No" {
            
            tapno.backgroundColor = myblueback
            tapno.setTitleColor(.white, for: .normal)
        }
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
