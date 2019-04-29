//
//  NewPostTableViewController.swift
//  FoodFood
//
//  Created by Rajashree Naik on 4/24/19.
//  Copyright © 2019 Rajashree Naik. All rights reserved.
//
//UserPost(id:"1",name:"",email: "", userimg: "",  receipe: PostReceipe(idMeal: "", strMeal: "", strCategory: "", strInstructions: "", strMealThumb: "", strYoutube: ""))
import UIKit
import Firebase
var l3 = [list]()
var objstr = [String]()


class NewPostTableViewController: UITableViewController {
   
    override func viewDidLoad() {
        super.viewDidLoad()
        let db = Firestore.firestore()
        let urlString = "https://www.themealdb.com/api/json/v1/1/filter.php?c=chicken"
        guard let url = URL(string: urlString) else { return }
        l3.removeAll()
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil {
                print("errrrrr"+error!.localizedDescription)
            }
            guard data != nil else { return }
            
            do{
                
                //here dataResponse received from a network request
                db.collection("feedposts").getDocuments()
                    { (querySnapshot, err) in
                    if let err = err {
                        print("Error getting documents: \(err)")
                    } else {
                        feed.removeAll()
                        for document in querySnapshot!.documents {
                            // print("\(document.documentID) => \(document.data())")
                             db.collection("feedposts").document()
                            .addSnapshotListener { documentSnapshot, error in
                                guard let document = documentSnapshot else {
                                    print("Error fetching document: \(error!)")
                                    return
                                }
                                let source = document.metadata.hasPendingWrites ? "Local" : "Server"
                                print("\(source) data: \(document.data() ?? [:])")
                            }

                            feed.append(PostReceipe(document.data()))
                        }
                         self.tableView.reloadData()
                    }
                }
                
                
            } catch let parsingError {
                print("Error", parsingError)
            }
           
            }.resume()
        self.tableView.reloadData()
        tableView.register(UINib(nibName: "NewFeedTableViewCell", bundle: nil), forCellReuseIdentifier: "NewFeedCell")
        self.tableView.rowHeight = 272
        self.tableView.allowsSelection = false
    
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
       
        return feed.count
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let alert = UIAlertController(
            title: "No Movies or User Found!",
            message: " Try Again Later, Thank you!! ",
            preferredStyle: .alert)
        
        
        
        // Add a "cancel" button to the alert. This one doesn't need a handler
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        // Add a "OK" button to the alert. The handler calls addNewToDoItem()
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        // Present the alert to the user
        self.present(alert, animated: true, completion: nil)

    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewFeedCell", for: indexPath) as! NewFeedTableViewCell
        print("inside cell")
        print(feed[indexPath.row].strMealThumb)
        print(feed[indexPath.row].strMeal)
        cell.imageVw(img: feed[indexPath.row].strMealThumb, name: feed[indexPath.row].strMeal, user: feed[indexPath.row].username, userprof: "https://cdn.onlinewebfonts.com/svg/img_332705.png", categ: feed[indexPath.row].strCategory, inst: feed[indexPath.row].strInstructions, yt: feed[indexPath.row].strYoutube)
  
        return cell
    }
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */
    
  
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
   // override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
   // }
    

}
