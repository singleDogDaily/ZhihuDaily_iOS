//
//  NetworkManager.swift
//  SingleDogDaily
//
//  Created by Tommy on 2016/10/31.
//  Copyright © 2016年 Tommy. All rights reserved.
//

import UIKit
import AFNetworking

typealias Succeed = (_:Any?)->Void
typealias Failure = (_:Error?)->Void

class NetworkManager: NSObject {
    
    // login method.
    func login(userName:String, password:String) {
        print("login completed.")
    }
    
    //普通get网络请求
    class func GET(url:String!, body:AnyObject?, succeed:@escaping Succeed, failed:@escaping Failure) {
        let mysucceed:Succeed = succeed
        let myfailure:Failure = failed
        
        RequestClient.sharedInstance.get(url, parameters: body, progress: { (progress:Progress) in
            //
            }, success: { (task:URLSessionDataTask!, responseObject:Any?) in
                mysucceed(responseObject!)
            }) { (task:URLSessionDataTask?, error:Error?) in
                myfailure(error!)
        }
    }
}

class RequestClient: AFHTTPSessionManager {
    private static let instance = RequestClient()
        
    class var sharedInstance:RequestClient {
        return instance
    }
}
