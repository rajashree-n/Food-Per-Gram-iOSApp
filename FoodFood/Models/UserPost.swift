//
//  UserPost.swift
//  FoodFood
//
//  Created by Rajashree Naik on 4/24/19.
//  Copyright © 2019 Rajashree Naik. All rights reserved.
//

import Foundation
import UIKit
struct UserPost {
    var id : String
    var name : String
    var userimg : String
    var email : String
    var receipe : PostReceipe
    
    init(id: String, name : String, email : String, userimg : String, receipe : PostReceipe) {
        self.id = id
        self.name = name
        self.email = email
        self.userimg = userimg
        self.receipe = receipe
    }

}
