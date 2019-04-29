//
//  Menu.swift
//  FoodFood
//
//  Created by Rajashree Naik on 4/23/19.
//  Copyright © 2019 Rajashree Naik. All rights reserved.
//

import Foundation
import UIKit

struct Menu {
    var idCategory : String
    var strCategory : String
    var strCategoryThumb : String
    var strCategoryDescription : String
    
    init(_ dictionary: [String: Any]) {
        self.idCategory = dictionary["idCategory"] as? String ?? ""
        self.strCategory = dictionary["strCategory"] as? String ?? ""
        self.strCategoryThumb = dictionary["strCategoryThumb"] as? String ?? ""
        self.strCategoryDescription = dictionary["strCategoryDescription"] as? String ?? ""
    }
    
}
