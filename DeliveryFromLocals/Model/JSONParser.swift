//
//  JSONParser.swift
//  DeliveryFromLocals
//
//  Created by Georgij on 13.10.16.
//  Copyright © 2016 Georgii Emeljanow. All rights reserved.
//

import UIKit
import SwiftyJSON

class JSONParser {
    
    var json: JSON?
    
    init() {
        self.json = parse()
    }
    
    func parse() -> JSON {
        if let bundlePath = Bundle.main.path(forResource: "food", ofType: "json") {
            let data = NSData(contentsOfFile: bundlePath)
            let json = JSON(data: data as! Data)

            return json
        }
        
        return nil
    }
}
