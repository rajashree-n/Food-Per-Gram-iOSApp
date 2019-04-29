//
//  DetailViewController.swift
//  FoodFood
//
//  Created by Rajashree Naik on 4/26/19.
//  Copyright © 2019 Rajashree Naik. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var foodImg: UIImageView!
    @IBOutlet weak var profImg: UIImageView!
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var receipeName: UILabel!
    @IBOutlet weak var category: UILabel!
    @IBOutlet weak var instr: UILabel!
    @IBOutlet var v1: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        print("INSIDE DETAIL VIEW CONTROLLER...........")
       // var im : URL?
        //im = URL(string: viewDetail[0].receipe.strMealThumb)
//        if let d1 = try? Data(contentsOf: im!)
//        {
//            //print(d1)
//            foodImg.image = UIImage(data: d1)
//        }
//      //  im = URL(string: viewDetail[0].userimg)
//        if let d1 = try? Data(contentsOf: im!)
//        {
//            //print(d1)
//            profImg.image = UIImage(data: d1)
//        }
        v1?.backgroundColor = UIColor.gray
       username?.text = "viewDetail[0].name"
        receipeName?.text = "viewDetail[0].receipe.strMeal"
        category?.text = "viewDetail[0].receipe.strCategory"
        instr?.text = "viewDetail[0].receipe.strInstructions"
        //v1?.didMoveToSuperview()
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
