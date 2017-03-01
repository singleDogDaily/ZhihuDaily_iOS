//
//  DailyThemeModel.swift
//  SingleDogDaily
//
//  Created by Tommy on 2016/11/3.
//  Copyright © 2016年 Tommy. All rights reserved.
//

import UIKit
import ObjectMapper

class DailyThemeModel: BaseModel {
    
    var id: Int?
    var color: Int?
    var thumbnail: String?
    var desc: String?
    var name: String?
    
    required init?(map: Map) {
        super.init(map:map)
    }
    
    // Mappable
    override func mapping(map: Map) {
        super.mapping(map:map)
        id              <- map["id"]
        color           <- map["color"]
        thumbnail       <- map["thumbnail"]
        desc            <- map["description"]
        name            <- map["name"]
    }
}
