//
//  DailyThemeListModel.swift
//  SingleDogDaily
//
//  Created by Tommy on 2016/11/7.
//  Copyright © 2016年 Tommy. All rights reserved.
//

import UIKit
import ObjectMapper

class DailyThemeListModel: BaseModel {
    var limit: Int?
    var subscribed: String?
    var others: [DailyThemeModel]?
    
    required init?(map: Map) {
        super.init(map: map)
    }
    
    // Mappable
    override func mapping(map: Map) {
        super.mapping(map: map)
        limit       <- map["limit"]
        subscribed  <- map["subscribed"]
        others      <- map["others"]
    }
}
