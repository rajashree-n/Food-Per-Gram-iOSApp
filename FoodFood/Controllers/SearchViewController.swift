//
//  SearchViewController.swift
//  
//
//  Created by Rajashree Naik on 4/24/19.
//

import UIKit
import Firebase
var objstr1:[String] = ["https://www.themealdb.com/images/media/meals/qxytrx1511304021.jpg","https://www.themealdb.com/images/media/meals/1529444113.jpg"]
private let reuseIdentifier = "Cello"

class SearchViewController: UIViewController, UICollectionViewDelegate,UICollectionViewDataSource{
    
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var profile: UIImageView!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var editProfile: UIButton!
    //
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return  post.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
 
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cello", for: indexPath) as! SchCollectionViewCell
        print("pic in coll post")
        print(post[indexPath.row].strMealThumb)
        cell.displayContent(img: post[indexPath.row].strMealThumb, inst: post[indexPath.row].strInstructions, name: post[indexPath.row].strMeal)
        return cell
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView!.register(UINib(nibName: "SchCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "Cello")
        collectionView.delegate = self
        collectionView.dataSource = self
        username.text = act[0].name
        email.text = act[0].email
        var im : URL?
        im = URL(string: act[0].userimg)
        if let d1 = try? Data(contentsOf: im!)
        {
            profile.image = UIImage(data: d1)
        }
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func UpdateProfile(_ sender: Any) {
        
        let db = Firestore.firestore()
        db.collection("users").document(email.text!).setData([
            "email": email.text!,
            "username": username.text!,
            "profileURL" : "https://cdn.onlinewebfonts.com/svg/img_332705.png"
        ]) { err in
            
            
            if err == nil {
                activeUser.append(User(name: self.username.text!, email: self.email.text!, userimg: "https://cdn.onlinewebfonts.com/svg/img_332705.png"))
                let alertController = UIAlertController(title: "Profile Updated1", message: err?.localizedDescription, preferredStyle: .alert)
                let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                
                alertController.addAction(defaultAction)
                self.present(alertController, animated: true, completion: nil)
               // self.performSegue(withIdentifier: "signedup", sender: self)
            }
            else{
                let alertController = UIAlertController(title: "Error", message: err?.localizedDescription, preferredStyle: .alert)
                let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                
                alertController.addAction(defaultAction)
                self.present(alertController, animated: true, completion: nil)
            }
        }
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
  //  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
   // }
    

}

