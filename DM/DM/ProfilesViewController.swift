//
//  ProfilesViewController.swift
//  DM
//
//  Created by Alek Matthiessen on 5/1/19.
//  Copyright © 2019 The Matthiessen Group, LLC. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseCore

var productimages = [UIImage]()
var selectedid = String()
var selectedprice = String()
class ProfilesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Profiles", for: indexPath) as! ProfilesTableViewCell
        
        
        
        
        return cell
    }
    
    @IBAction func tapX(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBOutlet weak var tapx: UIButton!
    @IBAction func tapMessage(_ sender: Any) {
        
        self.performSegue(withIdentifier: "ProfilesToChat", sender: self)
    }
    @IBOutlet weak var tapmessage: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var primaryimage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        tapmessage.layer.cornerRadius = 5.0
        tapmessage.layer.masksToBounds = true
            tapx.layer.cornerRadius = tapx.frame.height/2
        tapx.clipsToBounds = true

        progressView.transform = progressView.transform.scaledBy(x: 1, y: 2)
        progressView.layer.cornerRadius = 5.0
        
//        primaryimage.image = selectedimage
//        namelabel.text = selectedname2
//        agelabel.text = selectedage
//        heightlabel.text = selectedheight
//        locationlabel.text = selectedhometown
//        biolabel.text = selectedbio
//        responsetimelabel.text = selectedresponsetime
        pricelabel.text = "$2/min"
//        buttonlabel.setTitle("Chat now for \(selectedprice)", for: .normal)
        buttonlabel.setTitle("Chat now for $2/min", for: .normal)

        var swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(ProfilesViewController.respondToSwipeGesture(gesture:)))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        self.view.addGestureRecognizer(swipeRight)
        
        var swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(ProfilesViewController.respondToSwipeGesture(gesture:)))
        
        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
        self.view.addGestureRecognizer(swipeLeft)
        
        counter = 0
        queryforinfo()
        
        // Do any additional setup after loading the view.
    }
    
    func loadprogressview() {
        
        if productimages.count > 0 && counter == 0  {
            
            progressView.setProgress(0.1, animated: true)
            
        } else {
            
            if counter == 0 {
                
                progressView.setProgress(0.0, animated: false)
                
            } else {
                
                let fractionalProgress = Float(counter) / Float(productimages.count)
                
                progressView.setProgress(fractionalProgress, animated: true)
                
            }
        }
    }
    
    @objc func respondToSwipeGesture(gesture: UIGestureRecognizer) {
        
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            
            
            switch swipeGesture.direction {
            case UISwipeGestureRecognizer.Direction.right:
                print("Swiped right")
                tapLeft()
            case UISwipeGestureRecognizer.Direction.down:
                print("Swiped down")
            case UISwipeGestureRecognizer.Direction.left:
                print("Swiped left")
                connected()
            case UISwipeGestureRecognizer.Direction.up:
                print("Swiped up")
            default:
                break
            }
        }
    }
    var counter = Int()
    
    func tapLeft() {
        print(counter)
        
        
        if counter > 0 {
            counter -= 1

            if counter == 0 {
                
                primaryimage.image = selectedimage
                loadprogressview()
                
            } else {
            
            primaryimage.image = productimages[counter-1]
            loadprogressview()
                
            }
            
        } else {
            
            
            primaryimage.image = selectedimage
            loadprogressview()
        }
    }
    
    func connected() {
        
        
        print(counter)
        
        if counter < productimages.count {
            counter += 1
            
            
            primaryimage.image = productimages[counter-1]
            loadprogressview()
            
        } else {
            
            primaryimage.image = selectedimage
            loadprogressview()
        }
        
        
        
    }
    @IBOutlet weak var progressView: UIProgressView!
    
    func queryforinfo() {
        
        
        productimages.removeAll()
        var functioncounter = 0
        
        ref?.child("People").child(selectedid).observeSingleEvent(of: .value, with: { (snapshot) in
            
            var value = snapshot.value as? NSDictionary
            
            
            if var profileUrl = value?["Image 2"] as? String {
                // Create a storage reference from the URL
                
                if profileUrl == "null" {
                    
                } else {
                    
                    let url = URL(string: profileUrl)
                    
                    do {
                        
                        let data = try? Data(contentsOf: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
                        
                        if data != nil {
                            
                            if let selectedimage2 = UIImage(data: data!) {
                                
                                productimages.append(selectedimage2)
                                
                            }
                            
                        } else {
                            
                            
                        }
                        
                    } catch let error {
                        
                        
                    }
                }
            }
            
            if var profileUrl = value?["Image 3"] as? String {
                // Create a storage reference from the URL
                
                if profileUrl == "null" {
                    
                } else {
                    
                    let url = URL(string: profileUrl)
                    do {
                        
                        let data = try? Data(contentsOf: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
                        
                        if data != nil {
                            
                            if let selectedimage2 = UIImage(data: data!) {
                                
                                productimages.append(selectedimage2)
                                
                            }
                            
                        }
                        
                    } catch let error {
                        
                        
                        
                    }
                    
                }
            }
            
            if var profileUrl = value?["Image 4"] as? String {
                // Create a storage reference from the URL
                
                if profileUrl == "null" {
                    
                } else {
                    
                    let url = URL(string: profileUrl)
                    
                    do {
                        
                        
                        let data = try? Data(contentsOf: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
                        
                        if data != nil {
                            
                            if let selectedimage2 = UIImage(data: data!) {
                                
                                productimages.append(selectedimage2)
                                
                            }
                            
                        }
                        
                    } catch let error {
                        
                        
                        
                    }
                }
            }
            
            if var profileUrl = value?["Image 5"] as? String {
                // Create a storage reference from the URL
                
                if profileUrl == "null" {
                    
                } else {
                    
                    let url = URL(string: profileUrl)
                    do {
                        
                        let data = try? Data(contentsOf: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
                        
                        if let selectedimage2 = UIImage(data: data!) {
                            
                            productimages.append(selectedimage2)
                            
                        }
                        
                    } catch let error {
                        
                        
                        
                    }
                    
                }
            }
            
            
            
            //
            //
            //            if var author2 = value?["Packaging"] as? String {
            //
            //                if author2 != "-" {
            //
            //                    selectedpackaging = author2
            //
            //                } else {
            //
            //                    selectedpackaging = "Original Packaging"
            //
            //                }
            //
            //            } else {
            //
            //                selectedpackaging = "None"
            //
            //            }
            
            //            self.prices2.rev
            
            self.loadprogressview()
        }
            
        )
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBOutlet weak var buttonlabel: UIButton!
    
    @IBOutlet weak var responsetimelabel: UILabel!
    @IBOutlet weak var biolabel: UILabel!
    @IBOutlet weak var pricelabel: UILabel!
    @IBOutlet weak var locationlabel: UILabel!
    @IBOutlet weak var heightlabel: UILabel!
    @IBOutlet weak var agelabel: UILabel!
    @IBOutlet weak var namelabel: UILabel!
}


