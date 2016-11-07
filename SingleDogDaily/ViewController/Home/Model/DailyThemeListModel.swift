//
//  DailyThemeListModel.swift
//  SingleDogDaily
//
//  Created by Tommy on 2016/11/7.
//  Copyright © 2016年 Tommy. All rights reserved.
//

import UIKit
import ObjectMapper

class DailyThemeListModel: NSObject, Mappable {
    var limit: Int?
    var subscribed: String?
    var others: [DailyThemeModel]?
    
    required init?(map: Map) {
        
    }
    
    // Mappable
    func mapping(map: Map) {
        limit       <- map["limit"]
        subscribed  <- map["subscribed"]
        others      <- map["others"]
    }
}
