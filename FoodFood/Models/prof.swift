//
//  prof.swift
//  FoodFood
//
//  Created by Rajashree Naik on 4/26/19.
//  Copyright © 2019 Rajashree Naik. All rights reserved.
//

import Foundation

struct prof {
    var name : String
    var userimg : String
    var email : String
    
    init(_ dictionary: [String: Any]) {
        self.name = dictionary["username"] as? String ?? ""
        self.email = dictionary["email"] as? String ?? ""
        self.userimg = dictionary["profileURL"] as? String ?? ""

    }
    
    
}
