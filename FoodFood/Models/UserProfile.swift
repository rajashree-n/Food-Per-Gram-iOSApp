//
//  UserProfile.swift
//  FoodFood
//
//  Created by Rajashree Naik on 4/25/19.
//  Copyright © 2019 Rajashree Naik. All rights reserved.
//

import Foundation
import UIKit
import Firebase
struct UserProfile {
    var ref: DatabaseReference!
    var email : String
    var receipe : PostReceipe
    
    init(email : String,receipe : PostReceipe ) {
        self.email = email
        self.receipe = receipe
    }


}
