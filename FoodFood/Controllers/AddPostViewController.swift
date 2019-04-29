//
//  AddPostViewController.swift
//  FoodFood
//
//  Created by Rajashree Naik on 4/25/19.
//  Copyright © 2019 Rajashree Naik. All rights reserved.
//

import UIKit
import Firebase
import AssetsLibrary
class AddPostViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate  {

    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var catg: UITextField!
    @IBOutlet weak var inc: UITextField!
    @IBOutlet weak var instr: UITextView!
    @IBOutlet weak var upload: UIButton!
    @IBOutlet weak var imgPick: UIButton!
    var url: String?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
     @IBAction func AddPost(_ sender: Any) {
        
        if name.text?.isEmpty ?? true || catg.text?.isEmpty ?? true || inc.text?.isEmpty ?? true || instr.text?.isEmpty ?? true {
            let alert = UIAlertController(
                title: " Unable to save post",
                message: " TextField is Empty! ",
                preferredStyle: .alert)
            
            
            
            // Add a "cancel" button to the alert. This one doesn't need a handler
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            
            // Add a "OK" button to the alert. The handler calls addNewToDoItem()
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return
        }
        else {
            
            if url?.isEmpty ?? true {
                url = "http://www.worlddiscoveries.net/wp-content/uploads/2015/08/how-to-make-orange-chicken-recip.jpg"
            }
        
        let db = Firestore.firestore()
        
        db.collection("posts").document(act[0].email).collection(act[0].email).addDocument(data: [
            "email": act[0].email,
            "rName": name.text!,
            "rCatg": catg.text!,
            "rImg" : url!,
            "rInst" : instr.text!,
            "username" : act[0].name
        ])
        db.collection("feedposts").addDocument(data: [
            "email": act[0].email,
            "rName": name.text!,
            "rCatg": catg.text!,
            "rImg" : url!,
            "rInst" : instr.text!,
            "username" : act[0].name
            ])
        { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("Document posted")
            }
        }
        let alert = UIAlertController(
            title: "Successfully posted Data",
            message: " Thank you!! ",
            preferredStyle: .alert)
        
        
        
        // Add a "cancel" button to the alert. This one doesn't need a handler
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        // Add a "OK" button to the alert. The handler calls addNewToDoItem()
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        // Present the alert to the user
        self.present(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func AddImage(_ sender: Any) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        let actionSheet = UIAlertController(title: "Photo Source",message: "Choose a source" ,preferredStyle: .actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "Camera", style: .default, handler: { (action:UIAlertAction) in
            if UIImagePickerController.isSourceTypeAvailable(.camera) {
                imagePickerController.sourceType = .camera
                self.present(imagePickerController, animated: true, completion: nil)}
            else {
                print("Camera not available")
            }
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: { (action:UIAlertAction) in
            imagePickerController.sourceType = .photoLibrary
            self.present(imagePickerController, animated: true, completion: nil)
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil ))
        self.present(actionSheet, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        print("xxxxxxxxxxxxxxxxxxx")
        let imageUrl          = info[UIImagePickerController.InfoKey.imageURL] as! NSURL
        let imageName         = imageUrl.lastPathComponent
        let documentDirectory = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first as String!
        let photoURL          = NSURL(fileURLWithPath: documentDirectory!)
        let localPath         = photoURL.appendingPathComponent(imageName!)!
        //let photoURL = NSURL(fileURLWithPath: documentDirectory!)
        url = localPath.absoluteString
        print(localPath.absoluteString)
        let image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        print("immmmmmmmmmmmmmmmmm")
        print(imageUrl)
        img.image = image
        picker.dismiss(animated: true, completion: nil)
        
        
    }
    

    
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
        
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
