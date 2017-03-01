//
//  NetworkManager.swift
//  SingleDogDaily
//
//  Created by Tommy on 2016/10/31.
//  Copyright © 2016年 Tommy. All rights reserved.
//

import UIKit
import Alamofire

/// model解析成功后的回调
typealias SuccessBlock = (_ model:BaseModel?)->Void
/// 请求成功后的回调
typealias ResponseBlock = (_ responseText:String?)->Void
/// 请求失败后的回调
typealias FailedBlock = (_ message:String?, _ code:Int?)->Void
/// 必然会执行的回调，用于清理数据，相当于Java的finally语句
typealias FinallyBlock = ()->Void

/// This is HttpManager of this project.
/// ```swift
/// hello, this is a piece of sample code
class NetworkManager: NSObject {
    
    /// 普通GET网络请求
    class public func GET(url:String!,
                          params:Parameters,
                          responseCallback:@escaping ResponseBlock,
                          failedCallback:@escaping FailedBlock,
                          finallyCallback:@escaping FinallyBlock
        ) {
        Alamofire.request(url, method:.get, parameters:params).responseJSON { (response) in
            preHandle(response:response, responseCallback:responseCallback, failedCallback:failedCallback, finallyCallback:finallyCallback)
        }
    }
    
    /// 普通POST网络请求
    class public func POST(url:String!,
                           params:Parameters,
                           responseCallback:@escaping ResponseBlock,
                           failedCallback:@escaping FailedBlock,
                           finallyCallback:@escaping FinallyBlock
        ) {
        Alamofire.request(url, method: .post, parameters: params).responseJSON { (response) in
            preHandle(response:response, responseCallback:responseCallback, failedCallback:failedCallback, finallyCallback:finallyCallback)
        }
    }
    
    /// Response拦截
    class private func preHandle(response:DataResponse<Any>,
                                 responseCallback:@escaping ResponseBlock,
                                 failedCallback:@escaping FailedBlock,
                                 finallyCallback:@escaping FinallyBlock
        ) {
        if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
            responseCallback(utf8Text)
        } else {
            failedCallback(nil, 500)
        }
        finallyCallback()
    }
    
}
