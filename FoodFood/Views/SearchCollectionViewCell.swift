//
//  SearchCollectionViewCell.swift
//  FoodFood
//
//  Created by Rajashree Naik on 4/24/19.
//  Copyright © 2019 Rajashree Naik. All rights reserved.
//

import UIKit

class SearchCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var image: UIImageView!
    
    func displayContent(img: String) {
        var im : URL?
        print("--------------------------------------------xxxxxxxxx")
        print(img)
        im = URL(string: img)
        if let d = try? Data(contentsOf: im!)
        {
            image.image = UIImage(data: d)
        }
        
        
    }
}
