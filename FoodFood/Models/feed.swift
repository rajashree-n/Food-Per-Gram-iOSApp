//
//  feed.swift
//  FoodFood
//
//  Created by Rajashree Naik on 4/24/19.
//  Copyright © 2019 Rajashree Naik. All rights reserved.
//

import Foundation
import UIKit

struct Feed {
    var idMeal : String
    var strMeal : String
    var strMealThumb : String
   
    
    init(_ dictionary: [String: Any]) {
        self.idMeal = dictionary["idMeal"] as? String ?? ""
        self.strMeal = dictionary["strMeal"] as? String ?? ""
        self.strMealThumb = dictionary["strMealThumb"] as? String ?? ""
    }
    
}
