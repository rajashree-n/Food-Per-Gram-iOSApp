//
//  MenuViewController.swift
//  FoodFood
//
//  Created by Rajashree Naik on 4/23/19.
//  Copyright © 2019 Rajashree Naik. All rights reserved.
//

import UIKit
var index:Int = 0
var menus = [Menu]()
var filterMovie = [Menu]()
var l1 = [String]()

class MenuViewController: UITableViewController, UISearchResultsUpdating {

    let search = UISearchController(searchResultsController: nil)
    override func viewDidLoad() {
        super.viewDidLoad()
        let urlString = "https://www.themealdb.com/api/json/v1/1/categories.php"
        guard let url = URL(string: urlString) else { return }
        
        
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
                guard let jsonArray = jsonResponse["categories"] as? [[String: Any]] else {
                    return
                }
                for dic in jsonArray{
                    menus.append(Menu(dic)) // adding now value in Model array
                }
                
            } catch let parsingError {
                print("Error", parsingError)
            }
            self.tableView.reloadData()
            }.resume()
        self.tableView.allowsSelection = true
        search.searchResultsUpdater = self
        search.obscuresBackgroundDuringPresentation = false
        search.searchBar.placeholder = "Search"
        navigationItem.searchController = search
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

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
        if(isFiltering()) {
            return filterMovie.count
        }
        else {
        return menus.count
        }
    }

 
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         var im : URL?
        let cell = tableView.dequeueReusableCell(withIdentifier: "SavedCell", for: indexPath)
     //   var im : URL?
         if(isFiltering()){
            cell.textLabel?.text = filterMovie[indexPath.row].strCategory
            cell.detailTextLabel?.text = filterMovie[indexPath.row].strCategoryDescription
            im = URL(string: filterMovie[indexPath.row].strCategoryThumb)
            if let d = try? Data(contentsOf: im!)
            {
                cell.imageView?.image = UIImage(data: d)
            }
            cell.textLabel?.text = filterMovie[indexPath.row].strCategory
        }
         else {
            cell.textLabel?.text = menus[indexPath.row].strCategory
            cell.detailTextLabel?.text = menus[indexPath.row].strCategoryDescription
            im = URL(string: menus[indexPath.row].strCategoryThumb)
            if let d = try? Data(contentsOf: im!)
            {
                cell.imageView?.image = UIImage(data: d)
            }
            cell.textLabel?.text = menus[indexPath.row].strCategory
        }
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
   

    func updateSearchResults(for search: UISearchController) {
        guard let text = search.searchBar.text else { return }
        //print(text)
        filterContentforSearchText(text)
    }
    func filterContentforSearchText(_ text:String, scope: String = "All") {
        filterMovie = menus.filter({ (token : Menu) -> Bool in
            
            if ((search.searchBar.text?.isEmpty)!) {
                return true
            }
            else {
                return token.strCategory.lowercased().contains(text.lowercased())
            }
        })
        tableView.reloadData()
    }
    
    func isFiltering() -> Bool {
        return (search.isActive && !(search.searchBar.text?.isEmpty)!)
    }
    //for search delegate
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let text = searchBar.text
        filterContentforSearchText(text!)
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        l1.removeAll()
        l1.append(menus[indexPath.row].strCategory) // adding now value in Model array

        self.performSegue(withIdentifier: "SuggestionList", sender: self)

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
