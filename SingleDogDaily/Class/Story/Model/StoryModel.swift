//
//  StoryModel.swift
//  SingleDogDaily
//
//  Created by Tommy on 2017/3/2.
//  Copyright © 2017年 Tommy. All rights reserved.
//

import UIKit
import ObjectMapper


class StoryModel: Mappable {
    var images: [String]?
    var type: Int?
    var id: Int?
    var title: String?
    
    required init?(map: Map) {
    }
    
    // Mappable
    func mapping(map: Map) {
        images  <- map["images"]
        type    <- map["type"]
        id      <- map["id"]
        title   <- map["title"]
    }
}

class StoryListModel: BaseModel {
    var stories: [StoryModel]?
    
    required init?(map: Map) {
        super.init(map: map)
    }
    
    // Mappable
    override func mapping(map: Map) {
        super.mapping(map: map)
        stories <- map["stories"]
    }
}
