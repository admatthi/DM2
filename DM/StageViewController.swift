//
//  StageViewController.swift
//  DM
//
//  Created by Alek Matthiessen on 4/14/19.
//  Copyright © 2019 The Matthiessen Group, LLC. All rights reserved.
//

import UIKit

var descriptions = [String]()
var lengths = [String]()
var titlelabels = [String]()

class StageViewController: UIViewController {

    @IBOutlet weak var descriptionlabel: UILabel!
    @IBOutlet weak var length: UILabel!
    @IBOutlet weak var titlelbel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        titlelabels.removeAll()
        lengths.removeAll()
        descriptions.removeAll()
        
        titlelabels.append("Intake")
        titlelabels.append("Pre Treatment")
        titlelabels.append("First Steps")
        titlelabels.append("Moving Forward")
        titlelabels.append("Broadening Scope")
        titlelabels.append("Continuing On")
        titlelabels.append("Closure")
        
        lengths.append("1 Day")
        lengths.append("5 - 7 Days")
        lengths.append("3 Weeks")
        lengths.append("3 Weeks")
        lengths.append("3 Weeks")
        lengths.append("3 Weeks")
        lengths.append("3 Weeks")
        lengths.append("1 Week")
        
      
        
        descriptions.append("Your matching coach will gather some basic information about you to make sure you are matched with a coach who fits your preferences.")

        descriptions.append("Your coach will introduce themselves and help you get started on your weight loss journey. Your coach will address your concerns in a safe and supportive way. Feel free to share any information that you want your coach to know. You'll talk with your coach about your role and theirs in the weight loss process. This greatly increases the success of weight loss. Let your coach know how you prefer to be communicated with.")
        
        descriptions.append("Your coach will collaborate with you to agree on steps and goals for weight loss. They will provide strategies based on your goals, your client assessment, and their health approach. You'll also have a conversation with your coach about your progress so far, including your feelings on the pace of weight loss to ensure you're on track with your goals.")
        descriptions.append("Your coach will collaborate with you to set goals for your weight loss. Your coach will provide strategies based on your goals, your client assessment, and their health approach. You'll also have a conversation with your coach about your progress so far, including your feelings on the pace of weight loss to ensure you're on track with your goals.")
        descriptions.append("You'll also have a conversation with your coach about your progress so far, including your feelings on the pace of weight loss to ensure you're on track with your goals.")
      
        
        descriptions.append("Ending your coaching with a conversation about your progress, personal growth, and healing. Your private coach stays available for you and you can always come back.")
        titlelbel.text = titlelabels[selectedbutton]
        length.text = lengths[selectedbutton]
        descriptionlabel.text = descriptions[selectedbutton]
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
