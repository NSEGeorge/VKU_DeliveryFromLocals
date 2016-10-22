//
//  CityModel.swift
//  DeliveryFromLocals
//
//  Created by Georgij on 19.10.16.
//  Copyright © 2016 Georgii Emeljanow. All rights reserved.
//

import Foundation
import SwiftyJSON

class CityModel {
    var cityName: String?
    var cityDescription: String?
    var cityImageLink: String?
    
    var foodArray = [FoodModel]()
    
    init(dict: JSON) {
        self.cityName = dict["cityname"].string
        self.cityDescription = dict["description"].string
        self.cityImageLink = dict["image"].string
        
        if let food = dict["food"].array {
            for element in food {
                let f = FoodModel.init(dict: element)
                self.foodArray.append(f)
            }
        }
    }
}
