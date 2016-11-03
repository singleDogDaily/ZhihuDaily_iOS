//
//  NetworkManager.swift
//  SingleDogDaily
//
//  Created by Tommy on 2016/10/31.
//  Copyright © 2016年 Tommy. All rights reserved.
//

import UIKit
import AFNetworking

class NetworkManager: NSObject {
    static var interestRate : Double = 0.668    // 利率
    static var sharedInstance:NetworkManager {
        get {
            if sharedInstance == nil {
                
            }
            return NetworkManager()
        }
        set {
            print("set")
        }
    }
    
    // login method.
    func login(userName:String, password:String) {
        print("login completed.")
    }
}
