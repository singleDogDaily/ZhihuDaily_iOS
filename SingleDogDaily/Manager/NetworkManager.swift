//
//  NetworkManager.swift
//  SingleDogDaily
//
//  Created by Tommy on 2016/10/31.
//  Copyright © 2016年 Tommy. All rights reserved.
//

import UIKit
import Alamofire

typealias SuccessBlock = (_ model:AnyObject?)->Void

/// This is HttpManager of this project.
/// ```swift
/// hello
class NetworkManager: NSObject {
    
    // login method.
    static func login(userName:String, password:String, callback:@escaping SuccessBlock) {
        let url = "https://news-at.zhihu.com/api/4/themes"
        NetworkManager.GET(url: url, params: [:], callback: callback)
    }
    
    //普通get网络请求
    class private func GET(url:String!, params:Parameters, callback:@escaping SuccessBlock) {
        Alamofire.request(url, method:.get, parameters:params).responseJSON { response in
            print(response.request)  // original URL request
            print(response.response) // HTTP URL response
            print(response.data)     // server data
            print(response.result)   // result of response serialization
            print("Error: \(response.result.error)")
            
            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                let jsonModel : DailyThemeListModel? = DailyThemeListModel(JSONString:utf8Text)
                callback(jsonModel)
            }
        }
    }
    
    //MARK: - Data Request
    func request(url:String!, params:Any!) -> Void {
        // 主题日报列表查看
        
    }
}
