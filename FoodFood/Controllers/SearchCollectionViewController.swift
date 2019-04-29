//
//  SearchCollectionViewController.swift
//  FoodFood
//
//  Created by Rajashree Naik on 4/24/19.
//  Copyright © 2019 Rajashree Naik. All rights reserved.
//

import UIKit
var menu1 = [Menu]()
private let reuseIdentifier = "Cell"

class SearchCollectionViewController: UICollectionViewController {

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
                    menu1.append(Menu(dic)) // adding now value in Model array
                   
                }
            } catch let parsingError {
                print("Error", parsingError)
            }
            self.collectionView.reloadData()
            
            }.resume()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return menu1.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        var im : URL?
        im = URL(string: menu[indexPath.row].strCategoryThumb)
        // Configure the cell
        if let d = try? Data(contentsOf: im!)
        {
            //cell.contentView = UIImage(data: d)
        }
        
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
