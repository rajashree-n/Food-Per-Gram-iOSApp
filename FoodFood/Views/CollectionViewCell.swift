//
//  CollectionViewCell.swift
//  FoodFood
//
//  Created by Rajashree Naik on 4/25/19.
//  Copyright © 2019 Rajashree Naik. All rights reserved.
//

import UIKit

class SCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var scimg: UIImageView!
    var img: String?
    override func awakeFromNib() {
        super.awakeFromNib()
        var im : URL?
        print("--------------------------------------------xxxxxxxxx")
        im = URL(string: "https://www.themealdb.com/images/media/meals/xrrtss1511555269.jpg")
        print(im!)
        
        if let d1 = try? Data(contentsOf: im!)
        {
            print(d1)
            scimg.image = UIImage(data: d1)
        }
        
        // Initialization code
    }
    func displayContent(img: String) {
        var im : URL?
        print("--------------------------------------------xxxxxxxxx")
        im = URL(string: img)
        print(im!)

        if let d1 = try? Data(contentsOf: im!)
        {
            print(d1)
            scimg.image = UIImage(data: d1)
        }
        
        
    }
}
