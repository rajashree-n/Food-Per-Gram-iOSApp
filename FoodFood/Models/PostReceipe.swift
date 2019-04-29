//
//  PostReceipe.swift
//  FoodFood
//
//  Created by Rajashree Naik on 4/24/19.
//  Copyright © 2019 Rajashree Naik. All rights reserved.
//

import Foundation
import UIKit
class PostReceipe {
    
    var username : String
    var email : String
    var strMeal : String
    var strCategory : String
    var strInstructions : String
    var strMealThumb : String
    var strYoutube : String
    
    init(_ dictionary: [String: Any]) {
        self.username = dictionary["username"] as? String ?? ""
        self.email = dictionary["email"] as? String ?? ""
        self.strMeal = dictionary["rName"] as? String ?? ""
        self.strCategory = dictionary["rCatg"] as? String ?? ""
        self.strInstructions = dictionary["rInst"] as? String ?? ""
        self.strMealThumb = dictionary["rImg"] as? String ?? ""
        self.strYoutube = dictionary["username"] as? String ?? ""
    }
    
    func addDefault(idMeal : String) {
        self.strMeal = "test"
        self.strMeal =  "test"
        self.strCategory = "test"
        self.strInstructions = "test"
        self.strMealThumb = "https://www.themealdb.com/images/media/meals/g373701551450225.jpg"
        self.strYoutube = "test"
    
    }
    
}
