//
//  FoodModel.swift
//  DeliveryFromLocals
//
//  Created by Georgij on 19.10.16.
//  Copyright © 2016 Georgii Emeljanow. All rights reserved.
//

import Foundation
import SwiftyJSON

class FoodModel {
    var foodName: String?
    var foodPrice: Int?
    var foodDescription: String?
    var foodImageLink: String?
    
    init(dict: JSON) {
        self.foodName = dict["foodname"].string
        self.foodPrice = dict["price"].int
        self.foodDescription = dict["description"].string
        self.foodImageLink = dict["image"].string
    }
}
