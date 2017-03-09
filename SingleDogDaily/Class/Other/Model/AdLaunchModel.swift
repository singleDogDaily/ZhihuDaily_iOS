//
//  AdLaunchModel.swift
//  SingleDogDaily
//
//  Created by Tommy on 2017/3/8.
//  Copyright © 2017年 Tommy. All rights reserved.
//

import UIKit
import ObjectMapper

class AdLaunchModel: Mappable {
    var id: String?
    var type: Int?
    var url: String?
    var text: String?
    var impression_tracks: [String?]?
    
    required init?(map: Map) {
    }
    
    // Mappable
    func mapping(map: Map) {
        id              <- map["id"]
        type            <- map["type"]
        url             <- map["url"]
        text            <- map["text"]
        impression_tracks   <- map["impression_tracks"]
    }
}

class AdLaunchModelList: BaseModel {
    var creatives: [AdLaunchModel]?
    
    required init?(map: Map) {
        super.init(map: map)
    }
    
    // Mappable
    override func mapping(map: Map) {
        creatives   <- map["creatives"]
    }
}
