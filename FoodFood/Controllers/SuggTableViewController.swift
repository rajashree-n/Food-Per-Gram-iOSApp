//
//  SuggTableViewController.swift
//  FoodFood
//
//  Created by Rajashree Naik on 4/25/19.
//  Copyright © 2019 Rajashree Naik. All rights reserved.
//

import UIKit
var l2 = [Receipe]()
class SuggTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let sel = l1[0]
        let urlString = "https://www.themealdb.com/api/json/v1/1/search.php?s="+sel
        guard let url = URL(string: urlString) else { return }
        l2.removeAll()
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil {
                print("errrrrr"+error!.localizedDescription)
            }
            guard data != nil else { return }
            
            do{
                //here dataResponse received from a network request
                let jsonResponse = try JSONSerialization.jsonObject(with:
                    data!, options: JSONSerialization.ReadingOptions.mutableContainers) as AnyObject
                //  print(jsonResponse["Search"]) //Response result
                guard let jsonArray = jsonResponse["meals"] as? [[String: Any]] else {
                    return
                }
                for dic in jsonArray{
                    l2.append(Receipe(dic)) // adding now value in Model array
                }
            } catch let parsingError {
                print("Error", parsingError)
            }
            self.tableView.reloadData()
            }.resume()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        tableView.register(UINib(nibName: "NewFeedTableViewCell", bundle: nil), forCellReuseIdentifier: "NewFeedCell")
        self.tableView.rowHeight = 272
        self.tableView.allowsSelection = false
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return l2.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewFeedCell", for: indexPath) as! NewFeedTableViewCell
    
        cell.imageVw(img: l2[indexPath.row].strMealThumb, name: l2[indexPath.row].strMeal, user: "Suggested", userprof: "https://cdn.onlinewebfonts.com/svg/img_332705.png", categ: "", inst: l2[indexPath.row].strInstructions, yt: "" )
        // Configure the cell...

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
   
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
////        viewDetail.removeAll()
////        viewDetail.append(post[indexPath.row])
//        print("////////////////////////////////////////////////////////////////")
////        let vc2 : DetailViewController = UIStoryboard(name: "DView", bundle: nil).instantiateViewController(withIdentifier: "view2.id") as! DetailViewController
////        
//        //self.performSegue(withIdentifier: "DView", sender: self)
//    }
//    
//    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
//        let vc = DetailViewController()
//        vc.title = "Movie In Detail from Access Button"
//        vc.view.backgroundColor = .black
//        print("8888888888888888888888888888888888")
//        self.navigationController?.show(vc, sender:self)
//    }

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
