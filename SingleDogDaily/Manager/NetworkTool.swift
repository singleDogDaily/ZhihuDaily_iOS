//
//  NetworkTool.swift
//  SingleDogDaily
//
//  Created by Tommy on 2017/3/1.
//  Copyright © 2017年 Tommy. All rights reserved.
//

import UIKit

class NetworkTool: NSObject {
    
    /// 主题日报列表
    static func themelist(successCallback:@escaping SuccessBlock, failedCallback:@escaping FailedBlock, finallyCallback:@escaping FinallyBlock) {
        let url = "https://news-at.zhihu.com/api/4/themes"
        NetworkManager.GET(url: url, params: [:], responseCallback: { (responseText) in
            if let responseText = responseText {
                let model:DailyThemeListModel? = Mapper<DailyThemeListModel>().map(JSONString: responseText)
                successCallback(model)
            } else {
                failedCallback(nil, 500)
            }
        }, failedCallback: { (message, code) in
            failedCallback(message, code)
        }) {
            finallyCallback()
        }
    }
    
    //MARK: - Data Request
    func request(url:String!, params:Any!) -> Void {
        // 主题日报列表查看
        
    }
}
