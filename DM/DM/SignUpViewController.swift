//
//  SignUpViewController.swift
//  
//
//  Created by Alek Matthiessen on 4/25/19.
//

import UIKit

class SignUpViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate, UITextFieldDelegate {

    @IBOutlet weak var tapNewPhoto: UIButton!
    @IBOutlet weak var propic: UIImageView!
    @IBOutlet weak var agetf: UITextField!
    @IBOutlet weak var passtf: UITextField!
    @IBOutlet weak var emailtf: UITextField!
    @IBOutlet weak var usertf: UITextField!
    
    let imagePicker = UIImagePickerController()

    
//    func openPhotoPickerWith(source: PhotoSource) {
//        switch source {
//        case .camera:
//            let status = AVCaptureDevice.authorizationStatus(for: AVMediaType.video)
//            if (status == .authorized || status == .notDetermined) {
//                self.imagePicker.sourceType = .camera
//                self.imagePicker.allowsEditing = true
//                self.present(self.imagePicker, animated: true, completion: nil)
//            }
//        case .library:
//            let status = PHPhotoLibrary.authorizationStatus()
//            if (status == .authorized || status == .notDetermined) {
//                self.imagePicker.sourceType = .savedPhotosAlbum
//                self.imagePicker.allowsEditing = true
//                self.present(self.imagePicker, animated: true, completion: nil)
//            }
//        }
//    }
//
//    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
//        if let pickedImage = info[UIImagePickerControllerEditedImage] as? UIImage {
//            self.profilePicView.image = pickedImage
//        }
//        picker.dismiss(animated: true, completion: nil)
//    }
    
//    @IBAction func selectPic(_ sender: Any) {
//        let sheet = UIAlertController(title: nil, message: "Select the source", preferredStyle: .actionSheet)
//        let cameraAction = UIAlertAction(title: "Camera", style: .default, handler: {
//            (alert: UIAlertAction!) -> Void in
//            self.openPhotoPickerWith(source: .camera)
//        })
//        let photoAction = UIAlertAction(title: "Gallery", style: .default, handler: {
//            (alert: UIAlertAction!) -> Void in
//            self.openPhotoPickerWith(source: .library)
//        })
//        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
//        sheet.addAction(cameraAction)
//        sheet.addAction(photoAction)
//        sheet.addAction(cancelAction)
//        self.present(sheet, animated: true, completion: nil)
//    }
//
    //MARK: Delegates
  
    
    override func viewDidLoad() {
        super.viewDidLoad()

        usertf.attributedPlaceholder = NSAttributedString(string: "Username", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        passtf.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        emailtf.attributedPlaceholder = NSAttributedString(string: "Email address", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        agetf.attributedPlaceholder = NSAttributedString(string: "Age", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])

        
        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.view.endEditing(true)
        
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
