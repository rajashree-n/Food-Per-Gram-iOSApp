//
//  User.swift
//  FoodFood
//
//  Created by Rajashree Naik on 4/25/19.
//  Copyright © 2019 Rajashree Naik. All rights reserved.
//

import Foundation
import UIKit
struct User {
    var name : String
    var userimg : String
    var email : String
    
    init( name : String, email : String, userimg : String) {
        self.name = name
        self.email = email
        self.userimg = userimg
       // "https://cdn.onlinewebfonts.com/svg/img_332705.png"
    }
    
}
