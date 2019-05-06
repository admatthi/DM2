//
//  BrowseViewController.swift
//  DM
//
//  Created by Alek Matthiessen on 4/22/19.
//  Copyright © 2019 The Matthiessen Group, LLC. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseCore

var peopleimages = [String:UIImage]()
var peopleids = [String]()
var peoplenames = [String:String]()
var responsetimes = [String:String]()
var ages = [String:String]()
var selectedtime = String()
var selectedage = String()
var selectedname2 = String()
var heights = [String:String]()
var hometowns = [String:String]()
var bios = [String:String]()
var selectedheight = String()
var selectedbio = String()
var selectedhometown = String()
var prices = [String:String]()
var selectedplanid = String()

class BrowseViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
        selectedtitle = "Day \(indexPath.row+1)"
        
        selecteddayid = "Day \(indexPath.row+1)"
        
        if indexPath.row > 4 {
            
            selecteddayid = "Day 2"
        }
        
        selectedplanid = selectedmusclegroup
        
        self.performSegue(withIdentifier: "BrowseToWatch", sender: self)
        
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 28
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Persons", for: indexPath) as! PersonsCollectionViewCell
        
        cell.peopleimage.layer.cornerRadius = 5.0
        cell.peopleimage.clipsToBounds = true
        
        cell.layer.cornerRadius = 5.0
        cell.layer.masksToBounds = true
//        cell.peopleimage.image = peopleimages[peopleids[indexPath.row]]
//        cell.namelabel.text = "\(peoplenames[peopleids[indexPath.row]]!), \(ages[peopleids[indexPath.row]]!)"
        
        
//        cell.namelabel.text = "\(peoplenames[peopleids[indexPath.row]]!)"
        cell.namelabel.text = "Day \(indexPath.row+1)"

        cell.headline.text = "Day \(indexPath.row+1)"
        
        
//        cell.responsetime.text = responsetimes[peopleids[indexPath.row]]
        cell.responsetime.text = times[indexPath.row]
        
        return cell
    }
    
    var times = [String]()
    func queryforids(completed: @escaping (() -> ()) ) {
        
        collectionView.alpha = 1
        
        var functioncounter = 0
        
        peopleids.removeAll()
        peopleimages.removeAll()
        responsetimes.removeAll()
        ages.removeAll()
        heights.removeAll()
        hometowns.removeAll()
        bios.removeAll()
        prices.removeAll()
        
        
        ref?.child("Plans").child(selectedmusclegroup).observeSingleEvent(of: .value, with: { (snapshot) in
            
            var value = snapshot.value as? NSDictionary
            
            if let snapDict = snapshot.value as? [String:AnyObject] {
                
                for each in snapDict {
                    
                    let ids = each.key
                    
                    peopleids.append(ids)
                    functioncounter += 1

                    }
                    
                
                    if functioncounter == snapDict.count {
   
                        completed()
                        
                    }
                    
                    
                }
        })
    }
    
    @IBOutlet weak var planlabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    func createvalues() {
        
        var selectedplanboom = String()
        
        selectedplanboom = "Shoulder"
        
        var i = 1
        
        while i < 29 {
            
        
        ref?.child("Plans").child(selectedplanboom).child("Day \(i)").childByAutoId().updateChildValues(["URL" : "x"])
        
       ref?.child("Plans").child(selectedplanboom).child("Day \(i)").childByAutoId().updateChildValues(["URL" : "x"])
            
    ref?.child("Plans").child(selectedplanboom).child("Day \(i)").childByAutoId().updateChildValues(["URL" : "x"])
            
            i += 1
        }
        
        
        
        

    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        ref = Database.database().reference()

//    createvalues()
        times.removeAll()
        times.append("12 mins")
        times.append("12 mins")
        times.append("12 mins")
        times.append("12 mins")
        times.append("12 mins")
        times.append("12 mins")
        times.append("12 mins")
        times.append("15 mins")
        
         times.append("15 mins")
         times.append("15 mins")
         times.append("15 mins")
         times.append("15 mins")
         times.append("15 mins")
         times.append("15 mins")
        times.append("20 mins")
        times.append("20 mins")
        times.append("20 mins")
        times.append("20 mins")
        times.append("20 mins")
        times.append("20 mins")
        times.append("20 mins")
        times.append("20 mins")
        times.append("20 mins")
        times.append("20 mins")
        times.append("20 mins")
        times.append("20 mins")
        times.append("20 mins")
        times.append("20 mins")
        if selectedmusclegroup != "" {
            
            planlabel.text = selectedmusclegroup

        } else {
            
            selectedmusclegroup = "Wrist"
        }
        
        var screenSize = collectionView.bounds
        var screenWidth = screenSize.width
        var screenHeight = screenSize.height
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 1, left: 0, bottom: 1, right: 0)
        layout.itemSize = CGSize(width: screenWidth/2, height: screenWidth/1.2)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        
        collectionView.layer.cornerRadius = 5.0
        collectionView.clipsToBounds = true
        collectionView!.collectionViewLayout = layout
        
//        queryforids { () -> () in
//
//            self.queryforreviewinfo()
//
//        }
//
        
        
    }
    
    func queryforreviewinfo() {
        
        var functioncounter = 0
        
        for each in peopleids {
            
            
        ref?.child("Plans").child(selectedmusclegroup).child(each).observeSingleEvent(of: .value, with: { (snapshot) in
                
                var value = snapshot.value as? NSDictionary
                
                
            
                if var name = value?["Name"] as? String {
                    
                    peoplenames[each] = name
                    
                }
                
                
            if var productimagee = value?["Image"] as? String {
                
                
                                if productimagee.hasPrefix("http://") || productimagee.hasPrefix("https://") {
                
                                    let url = URL(string: productimagee)
                
                                    let data = try? Data(contentsOf: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
                
                                    if data != nil {
                
                                        let productphoto = UIImage(data: (data)!)
                
                                        //                            matchimages[each] = self.maskRoundedImage(image: productphoto!, radius: 180.0)
                                        let sizee = CGSize(width: 50, height: 50) // CGFloat, Double, Int
                
                                        if productphoto == nil {
                
                                            functioncounter += 1

                                        } else {
                
                                            peopleimages[each] = productphoto!
                                            functioncounter += 1

                                        }
                

                
                
                                    } else {
                                        
                                        functioncounter += 1

                                    }
                
                
                                }
                            }
                
                
                print(functioncounter)
                
                
                
                if functioncounter == peopleids.count {
                    
                    self.collectionView.reloadData()
                }
                
                
            })
            
        }
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

