//
//  SchCollectionViewCell.swift
//  FoodFood
//
//  Created by Rajashree Naik on 4/25/19.
//  Copyright © 2019 Rajashree Naik. All rights reserved.
//

import UIKit
import Firebase
class SchCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var Searchimg: UIImageView!
    @IBOutlet weak var detailView: UIButton!
    @IBOutlet weak var delete: UIButton!
    var recipe : String!
    var instruction : String!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    func displayContent(img: String, inst: String, name: String) {
        recipe = name
        instruction = inst
        var im : URL?
        im = URL(string: img)        
        if let d1 = try? Data(contentsOf: im!)
        {
            //print("photo view!!!!!!!!!!!!!!!!!!!")
            //print(d1)
            Searchimg.image = UIImage(data: d1)
        }
        
        
    }
    @IBAction func OnClickView(_ sender: Any) {
        
        let alert = UIAlertController(
            title: recipe,
            message: instruction,
            preferredStyle: .alert)
        
        // Add a "OK" button to the alert. The handler calls addNewToDoItem()
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        UIApplication.shared.keyWindow?.rootViewController?.presentedViewController?.present(alert, animated: true, completion: nil)
        
    }
    
    @IBAction func DeleteRecipe(_ sender: Any) {
        let db = Firestore.firestore()
        db.collection("saved").document(act[0].email).collection(act[0].email).document().delete() { err in
            if let err = err {
                print("Error removing document: \(err)")
            } else {
                print("Document successfully removed!")
            }
        }

    }
}
