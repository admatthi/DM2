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
var selectedname2 = String()
class BrowseViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
        selectedname2 = peoplenames[peopleids[indexPath.row]]!
        
        selectedimage = peopleimages[peopleids[indexPath.row]]!
        
        
        self.performSegue(withIdentifier: "BrowseToProfiles", sender: self)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return peopleimages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Persons", for: indexPath) as! PersonsCollectionViewCell
        
        cell.peopleimage.layer.cornerRadius = 5.0
        cell.peopleimage.clipsToBounds = true
        
        cell.layer.cornerRadius = 5.0
        cell.layer.masksToBounds = true
        cell.peopleimage.image = peopleimages[peopleids[indexPath.row]]
        cell.namelabel.text = peoplenames[peopleids[indexPath.row]]
        
        return cell
    }
    
    func queryforids(completed: @escaping (() -> ()) ) {
        
        collectionView.alpha = 1
        
        var functioncounter = 0
        
        peopleids.removeAll()
        peopleimages.removeAll()
        
        
        ref?.child("People").observeSingleEvent(of: .value, with: { (snapshot) in
            
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
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        ref = Database.database().reference()

        
        
        var screenSize = collectionView.bounds
        var screenWidth = screenSize.width
        var screenHeight = screenSize.height
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 1, left: 0, bottom: 1, right: 0)
        layout.itemSize = CGSize(width: screenWidth/2, height: screenWidth/1.2)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        
        collectionView!.collectionViewLayout = layout
        
        queryforids { () -> () in
            
            self.queryforreviewinfo()
            
        }
        
        
        
    }
    
    func queryforreviewinfo() {
        
        var functioncounter = 0
        
        for each in peopleids {
            
            
            ref?.child("People").child(each).observeSingleEvent(of: .value, with: { (snapshot) in
                
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

