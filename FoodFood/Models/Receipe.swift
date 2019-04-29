//
//  Receipe.swift
//  FoodFood
//
//  Created by Rajashree Naik on 4/24/19.
//  Copyright © 2019 Rajashree Naik. All rights reserved.
//

import Foundation
import UIKit
struct Receipe {
    
    var idMeal : String
    var strMeal : String
    var strCategory : String
    var strInstructions : String
    var strMealThumb : String
    var strYoutube : String
    
    init(_ dictionary: [String: Any]) {
        self.idMeal = dictionary["idMeal"] as? String ?? ""
        self.strMeal = dictionary["strMeal"] as? String ?? ""
        self.strCategory = dictionary["strCategory"] as? String ?? ""
        self.strInstructions = dictionary["strInstructions"] as? String ?? ""
        self.strMealThumb = dictionary["strMealThumb"] as? String ?? ""
        self.strYoutube = dictionary["strYoutube"] as? String ?? ""
    }

}
