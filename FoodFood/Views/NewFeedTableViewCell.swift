//
//  NewFeedTableViewCell.swift
//  FoodFood
//
//  Created by Rajashree Naik on 4/24/19.
//  Copyright © 2019 Rajashree Naik. All rights reserved.
//

import UIKit
import Firebase
class NewFeedTableViewCell: UITableViewCell {

    @IBOutlet weak var foodimage: UIImageView!
    @IBOutlet weak var receipeName: UILabel!
    @IBOutlet weak var usr: UILabel!
    @IBOutlet weak var profileview: UIImageView!
    @IBOutlet weak var category: UILabel!
    @IBOutlet weak var detailView: UIButton!
    var img: String?
    var url : String?
    var instr : String?
    var ytb : String?

    @IBOutlet weak var addBtn: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func imageVw (img : String, name : String, user : String, userprof: String, categ : String, inst : String, yt : String) {
        url = img
        instr = inst
        ytb = yt
        var im : URL?
        im = URL(string: img)
        if let d = try? Data(contentsOf: im!)
        {
            foodimage.image = UIImage(data: d)
        }
        receipeName.text = name
        usr?.text = user
        var prof : URL?
        prof = URL(string: userprof)
        if let d = try? Data(contentsOf: prof!)
        {
            profileview.image = UIImage(data: d)
        }
        category.text = categ
    }
    @IBAction func OnclickAdd(_ sender: Any) {
        let db = Firestore.firestore()
       db.collection("saved").document(act[0].email).collection(act[0].email).addDocument(data: [
            "email": usr.text!,
            "rName": receipeName.text!,
            "rCatg": category.text!,
            "rImg" : url!,
            "rInst" : instr!,
            "rYT" : ytb!
        ]) { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("Document added")
            }
        }
        addBtn.backgroundColor = UIColor.green

    }
    
    @IBAction func ViewMore(_ sender: Any) {
        print("view pressed")
//        let controller = DetailViewController()
//        self.addSubview(controller.view)
        let alert = UIAlertController(
            title: "Instruction to Cook",
            message: instr,
            preferredStyle: .alert)
        
        // Add a "OK" button to the alert. The handler calls addNewToDoItem()
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        UIApplication.shared.keyWindow?.rootViewController?.presentedViewController?.present(alert, animated: true, completion: nil)        //performSegueWithIdentifier("showNexController", sender: self)
    }
}
