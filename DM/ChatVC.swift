//  MIT License

//  Copyright (c) 2017 Haik Aslanyan

//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:

//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.

//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.


import UIKit
import Photos
import Firebase
import CoreLocation
import FirebaseAuth

var uid = String()

var selectedimage = UIImage()

class ChatVC: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate,  UINavigationControllerDelegate, UIImagePickerControllerDelegate, CLLocationManagerDelegate {
    
    //MARK: Properties
    @IBOutlet var inputBar: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    override var inputAccessoryView: UIView? {
        get {
            self.inputBar.frame.size.height = self.barHeight
            self.inputBar.clipsToBounds = true
            return self.inputBar
        }
    }
    override var canBecomeFirstResponder: Bool{
        return true
    }
    let locationManager = CLLocationManager()
    var items = [Message]()
    let imagePicker = UIImagePickerController()
    let barHeight: CGFloat = 50
    var currentUser: User?
    var canSendLocation = true
    
    
    //MARK: Methods
    func customization() {
        self.imagePicker.delegate = self
        self.tableView.estimatedRowHeight = self.barHeight
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.contentInset.bottom = self.barHeight
        self.tableView.scrollIndicatorInsets.bottom = self.barHeight
        self.navigationItem.title = self.currentUser?.name
        self.navigationItem.setHidesBackButton(true, animated: false)
        let icon = UIImage.init(named: "back")?.withRenderingMode(.alwaysOriginal)
        let backButton = UIBarButtonItem.init(image: icon!, style: .plain, target: self, action: #selector(self.dismissSelf))
        self.navigationItem.leftBarButtonItem = backButton
        self.locationManager.delegate = self
    }
    
    
    
    
    var selectedid = String()
    
    //Downloads messages
    @objc func fetchData2(_ notification: Notification) {
        
        if uid == "rmmMbNlS5ZPoE2OPTOetUVYBWqf2" {
            
            selectedid = selecteduserid
            
        } else {
            
            selectedid = "rmmMbNlS5ZPoE2OPTOetUVYBWqf2"
        }
        
        print(selectedid)
        Message.downloadAllMessages(forUserID: selectedid, completion: {[weak weakSelf = self] (message) in
            
            
            
            weakSelf?.items.append(message)
            weakSelf?.items.sort{ $0.timestamp < $1.timestamp }
            DispatchQueue.main.async {
                if let state = weakSelf?.items.isEmpty, state == false {
                    weakSelf?.tableView.reloadData()
                    weakSelf?.tableView.scrollToRow(at: IndexPath.init(row: self.items.count - 1, section: 0), at: .bottom, animated: false)
                    
                    
                } else {
                    
                    //                let content = "Hi, welcome to Help! I'm Alek, your consultation coach. I'll be explaining how Help works and guiding you through our subscription options for working with a weight loss coach here. When you're ready to start being coached, I'll help you find a coach who is best suited to your specific health needs. Would you please share your name, age, and what health concerns you would like to work on?"
                    
                    let content = "Hi, welcome to Heal! I'm Alek, your physical therapy coach. I'll be explaining how Heal works and guiding you throuhg our subscription options. When you're ready to start, I'll be here to make sure you have a program that best suites your needs. Would you please share what health concerns you'd like to work on?"
                    
                    let values = ["type": "text", "content": content, "fromID": "rmmMbNlS5ZPoE2OPTOetUVYBWqf2", "toID": uid, "timestamp": Int(Date().timeIntervalSince1970), "isRead": false] as [String : Any]
                    
                    Database.database().reference().child("conversations").childByAutoId().childByAutoId().setValue(values, withCompletionBlock: { (error, reference) in
                        let data = ["location": reference.parent!.key]
                        Database.database().reference().child("users").child("rmmMbNlS5ZPoE2OPTOetUVYBWqf2").child("conversations").child(uid).setValue(data)
                        Database.database().reference().child("users").child(uid).child("conversations").child("rmmMbNlS5ZPoE2OPTOetUVYBWqf2").setValue(data)
                        //
                        NotificationCenter.default.post(name: Notification.Name(rawValue: "disconnectPaxiSockets"), object: nil)
                        
                    })

                    
                }
            }
        })
        
        
        if items.count == 0 {
            
            
            
        }
        
        
        Message.markMessagesRead(forUserID: selectedid)
    }
    
    func fetchData() {
        
        if uid == "rmmMbNlS5ZPoE2OPTOetUVYBWqf2" {
            
            selectedid = selecteduserid
            
        } else {
            
            selectedid = "rmmMbNlS5ZPoE2OPTOetUVYBWqf2"
        }
        
        Message.downloadAllMessages(forUserID: selectedid, completion: {[weak weakSelf = self] (message) in
            
            
            
            weakSelf?.items.append(message)
            weakSelf?.items.sort{ $0.timestamp < $1.timestamp }
            DispatchQueue.main.async {
                if let state = weakSelf?.items.isEmpty, state == false {
                    weakSelf?.tableView.reloadData()
                    weakSelf?.tableView.scrollToRow(at: IndexPath.init(row: self.items.count - 1, section: 0), at: .bottom, animated: false)
                    
                    
                } else {
                    
                    
                    let content = "Hi, welcome to Heal! I'm Alek, your physical therapy coach. I'll be explaining how Heal works and guiding you throuhg our subscription options. When you're ready to start, I'll be here to make sure you have a program that best suites your needs. Would you please share what health concerns you'd like to work on?"
                    
                    let values = ["type": "text", "content": content, "fromID": "rmmMbNlS5ZPoE2OPTOetUVYBWqf2", "toID": uid, "timestamp": Int(Date().timeIntervalSince1970), "isRead": false] as [String : Any]
                    
                    Database.database().reference().child("conversations").childByAutoId().childByAutoId().setValue(values, withCompletionBlock: { (error, reference) in
                        let data = ["location": reference.parent!.key]
                        Database.database().reference().child("users").child("rmmMbNlS5ZPoE2OPTOetUVYBWqf2").child("conversations").child(uid).setValue(data)
                        Database.database().reference().child("users").child(uid).child("conversations").child("rmmMbNlS5ZPoE2OPTOetUVYBWqf2").setValue(data)
                        //
                        NotificationCenter.default.post(name: Notification.Name(rawValue: "disconnectPaxiSockets"), object: nil)
                        
                    })
                    
                }
            }
        })
        
        
        if items.count == 0 {
            
            
            
        }
        
        
        Message.markMessagesRead(forUserID: selectedid)
    }
    //Hides current viewcontroller
    @objc func dismissSelf() {
        if let navController = self.navigationController {
            navController.popViewController(animated: true)
        }
    }
    
    func composeMessage(type: MessageType, content: Any)  {
        
        
        if uid == "rmmMbNlS5ZPoE2OPTOetUVYBWqf2" {
            
            selectedid = selecteduserid
            
        } else {
            
            selectedid = "rmmMbNlS5ZPoE2OPTOetUVYBWqf2"
        }
        
        let message = Message.init(type: type, content: content, owner: .sender, timestamp: Int(Date().timeIntervalSince1970), isRead: false)
        Message.send(message: message, toID: selectedid, completion: {(_) in
        })
        
        
        
    }
    
    func checkLocationPermission() -> Bool {
        var state = false
        switch CLLocationManager.authorizationStatus() {
        case .authorizedWhenInUse:
            state = true
        case .authorizedAlways:
            state = true
        default: break
        }
        return state
    }
    
    func animateExtraButtons(toHide: Bool)  {
        switch toHide {
        case true:
            self.bottomConstraint.constant = 0
            UIView.animate(withDuration: 0.3) {
                self.inputBar.layoutIfNeeded()
            }
        default:
            self.bottomConstraint.constant = -50
            UIView.animate(withDuration: 0.3) {
                self.inputBar.layoutIfNeeded()
            }
        }
    }
    
    @IBAction func showMessage(_ sender: Any) {
        self.animateExtraButtons(toHide: true)
    }
    
    @IBAction func selectGallery(_ sender: Any) {
        self.animateExtraButtons(toHide: true)
        let status = PHPhotoLibrary.authorizationStatus()
        if (status == .authorized || status == .notDetermined) {
            self.imagePicker.sourceType = .savedPhotosAlbum;
            self.present(self.imagePicker, animated: true, completion: nil)
        }
        
    }
    
    @IBAction func selectCamera(_ sender: Any) {
        self.animateExtraButtons(toHide: true)
        let status = AVCaptureDevice.authorizationStatus(for: AVMediaType.video)
        if (status == .authorized || status == .notDetermined) {
            self.imagePicker.sourceType = .camera
            self.imagePicker.allowsEditing = false
            self.present(self.imagePicker, animated: true, completion: nil)
        }
    }
    
    @IBAction func selectLocation(_ sender: Any) {
        self.canSendLocation = true
        self.animateExtraButtons(toHide: true)
        if self.checkLocationPermission() {
            self.locationManager.startUpdatingLocation()
        } else {
            self.locationManager.requestWhenInUseAuthorization()
        }
    }
    
    @IBAction func showOptions(_ sender: Any) {
        self.animateExtraButtons(toHide: false)
    }
    
    @IBAction func sendMessage(_ sender: Any) {
        if let text = self.inputTextField.text {
            if text.count > 0 {
                self.composeMessage(type: .text, content: self.inputTextField.text!)
                self.inputTextField.text = ""
            }
        }
    }
    
    //MARK: NotificationCenter handlers
    @objc func showKeyboard(notification: Notification) {
        if let frame = notification.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let height = frame.cgRectValue.height
            self.tableView.contentInset.bottom = height
            self.tableView.scrollIndicatorInsets.bottom = height
            if self.items.count > 0 {
                self.tableView.scrollToRow(at: IndexPath.init(row: self.items.count - 1, section: 0), at: .bottom, animated: true)
            } else {
                
                
            }
        }
    }
    
    @IBAction func tapShowTip(_ sender: Any) {
        
   
        
        if tippressed {
            
            inputBar.alpha = 1
            hidetipping()
            tapshowtip.alpha = 1
            tippressed = false
        } else {
            showtipping()
            tapshowtip.alpha = 0.5
            inputBar.alpha = 0
            tippressed = true
        }
    }
    
    @IBOutlet weak var backlabel: UILabel!
    var tippressed = Bool()
    @IBOutlet weak var tapshowtip: UIButton!
    func hidetipping() {
        taptip.alpha = 0
        b2.alpha = 0
        b1.alpha = 0
        b3.alpha = 0
        backlabel.alpha = 0
    }
    
    
    func showtipping() {
        taptip.alpha = 1
        b2.alpha = 1
        b1.alpha = 1
        b3.alpha = 1
        backlabel.alpha = 1
    }
    @IBAction func tapPlus(_ sender: Any) {
    }
    @IBAction func tapMinus(_ sender: Any) {
    }
    @IBAction func tapTip(_ sender: Any) {
    }
    @IBOutlet weak var taptip: UIButton!
    @IBOutlet weak var tapplus: UIButton!
    @IBOutlet weak var pricelabel: UILabel!

    @IBOutlet weak var b2: UIButton!
    @IBOutlet weak var b3: UIButton!
    @IBOutlet weak var b1: UIButton!
    
    //MARK: Delegates
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if tableView.isDragging {
            cell.transform = CGAffineTransform.init(scaleX: 0.5, y: 0.5)
            UIView.animate(withDuration: 0.3, animations: {
                cell.transform = CGAffineTransform.identity
            })
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch self.items[indexPath.row].owner {
        case .receiver:
            let cell = tableView.dequeueReusableCell(withIdentifier: "Receiver", for: indexPath) as! ReceiverCell
            cell.clearCellData()
            switch self.items[indexPath.row].type {
            case .text:
                cell.message.text = self.items[indexPath.row].content as! String
            case .photo:
                if let image = self.items[indexPath.row].image {
                    cell.messageBackground.image = image
                    cell.message.isHidden = true
                } else {
                    cell.messageBackground.image = UIImage.init(named: "loading")
                    self.items[indexPath.row].downloadImage(indexpathRow: indexPath.row, completion: { (state, index) in
                        if state == true {
                            DispatchQueue.main.async {
                                self.tableView.reloadData()
                            }
                        }
                    })
                }
            case .location:
                cell.messageBackground.image = UIImage.init(named: "location")
                cell.message.isHidden = true
            }
            return cell
        case .sender:
            let cell = tableView.dequeueReusableCell(withIdentifier: "Sender", for: indexPath) as! SenderCell
            cell.clearCellData()
            cell.profilePic.image = self.currentUser?.profilePic
            switch self.items[indexPath.row].type {
            case .text:
                cell.message.text = self.items[indexPath.row].content as! String
            case .photo:
                if let image = self.items[indexPath.row].image {
                    cell.messageBackground.image = image
                    cell.message.isHidden = true
                } else {
                    cell.messageBackground.image = UIImage.init(named: "loading")
                    self.items[indexPath.row].downloadImage(indexpathRow: indexPath.row, completion: { (state, index) in
                        if state == true {
                            DispatchQueue.main.async {
                                self.tableView.reloadData()
                            }
                        }
                    })
                }
            case .location:
                cell.messageBackground.image = UIImage.init(named: "location")
                cell.message.isHidden = true
            }
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.inputTextField.resignFirstResponder()
        switch self.items[indexPath.row].type {
        case .photo:
            if let photo = self.items[indexPath.row].image {
                let info = ["viewType" : ShowExtraView.preview, "pic": photo] as [String : Any]
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "showExtraView"), object: nil, userInfo: info)
                self.inputAccessoryView?.isHidden = true
            }
        case .location:
            let coordinates = (self.items[indexPath.row].content as! String).components(separatedBy: ":")
            let location = CLLocationCoordinate2D.init(latitude: CLLocationDegrees(coordinates[0])!, longitude: CLLocationDegrees(coordinates[1])!)
            let info = ["viewType" : ShowExtraView.map, "location": location] as [String : Any]
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "showExtraView"), object: nil, userInfo: info)
            self.inputAccessoryView?.isHidden = true
        default: break
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: NSDictionary) {
        
        
        if let pickedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            
            self.composeMessage(type: .photo, content: pickedImage)
        } else {
            
            
            let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
            self.composeMessage(type: .photo, content: pickedImage)
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        self.locationManager.stopUpdatingLocation()
        if let lastLocation = locations.last {
            if self.canSendLocation {
                let coordinate = String(lastLocation.coordinate.latitude) + ":" + String(lastLocation.coordinate.longitude)
                let message = Message.init(type: .location, content: coordinate, owner: .sender, timestamp: Int(Date().timeIntervalSince1970), isRead: false)
                Message.send(message: message, toID: self.currentUser!.id, completion: {(_) in
                })
                self.canSendLocation = false
            }
        }
    }
    
    @IBAction func tapJourney(_ sender: Any) {
        
        self.performSegue(withIdentifier: "ChatToAccount", sender: self)
    }
    
    @IBAction func tapProfile(_ sender: Any) {
        
        self.performSegue(withIdentifier: "ChatToProfile", sender: self)
    }
    //MARK: ViewController lifecycle
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.inputBar.alpha = 1
        self.inputBar.backgroundColor = UIColor.white
        self.view.layoutIfNeeded()
        NotificationCenter.default.addObserver(self, selector: #selector(ChatVC.showKeyboard(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
    }
    
    @IBAction func tapBack(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        
        self.inputBar.alpha = 0
        NotificationCenter.default.removeObserver(self)
        Message.markMessagesRead(forUserID: uid)
    }
    
    @IBOutlet weak var profileimage: UIImageView!
    @IBOutlet weak var nametext: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        

        taptip.layer.cornerRadius = 22.0
        taptip.layer.masksToBounds = true
        
        ref = Database.database().reference()
        hidetipping()
        tippressed = false
        profileimage.layer.masksToBounds = false
        profileimage.layer.cornerRadius = profileimage.frame.height/2
        profileimage.clipsToBounds = true
        tableView.layer.cornerRadius = 5.0
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.fetchData2(_:)), name: Notification.Name(rawValue: "disconnectPaxiSockets"), object: nil)

        nametext.text = "Alek"
//        profileimage.image = selectedimage
        
//                let content = "Hi, welcome to Help! I'm Alek, your consultation coach. I'll be explaining how Help works and guiding you through our subscription options for working with a weight loss coach here. When you're ready to start being coached, I'll help you find a coach who is best suited to your specific health needs. Would you please share your name, age, and what health concerns you would like to work on?"
                
        
        if uid == "rmmMbNlS5ZPoE2OPTOetUVYBWqf2" {
            
            selectedid = selecteduserid
            self.customization()
            self.fetchData()
            
        } else {
            
            selectedid = "rmmMbNlS5ZPoE2OPTOetUVYBWqf2"
            self.customization()
            self.fetchData()
        }

    }
}
