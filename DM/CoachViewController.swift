//
//  CoachViewController.swift
//  Together
//
//  Created by Alek Matthiessen on 4/10/19.
//  Copyright © 2019 AA Tech. All rights reserved.
//

import UIKit
import Firebase

var descriptionlabel = String()
var focus = String()
var approach = String()
var yearstraining = String()
var totalclients = String()

class CoachViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Coach", for: indexPath) as! CoachTableViewCell
        
   
        cell.descriptionl.text = descriptionlabel
        cell.focusl.text = focus
        cell.yearsl.text = approach
        cell.clientsl.text = yearstraining
        cell.approachl.text = totalclients
        cell.proimage.image = proimage2
        return cell
        
    }
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ref = Database.database().reference()

        
         queryforcoachinfo()
        // Do any additional setup after loading the view.
    }
    

    
    func queryforcoachinfo() {
        
        var functioncounter = 0
        
        ref?.child("Coaches").child("Alek").observeSingleEvent(of: .value, with: { (snapshot) in
            
            var value = snapshot.value as? NSDictionary
            
            if var activityvalue2 = value?["Description"] as? String {
                
                descriptionlabel = activityvalue2
            }
            
            if var activityvalue2 = value?["Focus"] as? String {
                
                focus  = activityvalue2
                //                    self.keyinsights.text = "\(activityvalue2) views"
            }
            
            if var activityvalue2 = value?["Approach"] as? String {
                
                approach  = activityvalue2
                //                    self.keyinsights.text = "\(activityvalue2) views"
            }
            
            if var activityvalue2 = value?["Years Training"] as? String {
                
                yearstraining  = activityvalue2
                //                    self.keyinsights.text = "\(activityvalue2) views"
            }
            
            if var activityvalue2 = value?["Total Clients"] as? String {
                
                totalclients  = activityvalue2
                //                    self.keyinsights.text = "\(activityvalue2) views"
            }
            
                        if var productimagee = value?["Image"] as? String {
            
            
                            if productimagee.hasPrefix("http://") || productimagee.hasPrefix("https://") {
            
                                let url = URL(string: productimagee)
            
                                let data = try? Data(contentsOf: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
            
                                if data != nil {
            
                                    let productphoto = UIImage(data: (data)!)
                                    
                                    proimage2 = productphoto!
                                }
                                
                            }
                            
            }
            
            self.tableView.reloadData()
            //                if let first = selecteddescription.components(separatedBy: ".").first {
            
            //                    self.descriptionlabel.text = "\(first)."
            
            //                }
            
            
        })
        
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
