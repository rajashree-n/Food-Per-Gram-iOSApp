//
//  MenuController.swift
//  FoodFood
//
//  Created by Rajashree Naik on 4/23/19.
//  Copyright © 2019 Rajashree Naik. All rights reserved.
//

import UIKit

class MenuController: UIViewController {

    @IBOutlet weak var MenuBtn: UIButton!
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
                    

                }
            } catch let parsingError {
                print("Error", parsingError)
            }
            
            }.resume()

        // Do any additional setup after loading the view.
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
