//
//  ArticleModel.swift
//  SingleDogDaily
//
//  Created by Tommy on 2017/3/2.
//  Copyright © 2017年 Tommy. All rights reserved.
//

import UIKit
import ObjectMapper

class ArticleModel: BaseModel {
    
    var id: Int?
    var type: Int?
    var body: String?
    var image_source: String?
    var title: String?
    var image: String?
    var theme: DailyThemeModel?
    var ga_prefix: String?
    var share_url: String?
    var js: [String]?
    var images: [String]?
    var css: [String]?
    
    required init?(map: Map) {
        super.init(map: map)
    }
    
    // Mappable
    override func mapping(map: Map) {
        super.mapping(map: map)
        id              <- map["id"]
        type            <- map["type"]
        body            <- map["body"]
        image_source    <- map["image_source"]
        title           <- map["title"]
        image           <- map["image"]
        theme           <- map["theme"]
        ga_prefix       <- map["ga_prefix"]
        share_url       <- map["share_url"]
        js              <- map["js"]
        images          <- map["images"]
        css             <- map["css"]
    }
}
