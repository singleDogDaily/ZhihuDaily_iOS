//
//  NetworkTool.swift
//  SingleDogDaily
//
//  Created by Tommy on 2017/3/1.
//  Copyright © 2017年 Tommy. All rights reserved.
//

import UIKit

class NetworkTool: NSObject {
    
    /// luanch页面数据
    static func launchAdvertData(successCallback:@escaping SuccessBlock, failedCallback:@escaping FailedBlock, finallyCallback:@escaping FinallyBlock) {
        let url = "http://news-at.zhihu.com/api/7/prefetch-launch-images/1080*1920"
        NetworkManager.GET(url: url, params: [:], responseCallback: { (responseText) in
            if let responseText = responseText {
                let model:AdLaunchModelList? = Mapper<AdLaunchModelList>().map(JSONString: responseText)
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
    
    /// 内容Story列表
    static func themeStoryList(themeId:Int, successCallback:@escaping SuccessBlock, failedCallback:@escaping FailedBlock, finallyCallback:@escaping FinallyBlock) {
        let url = "http://news-at.zhihu.com/api/4/theme/\(themeId)";
        NetworkManager.GET(url: url, params: [:], responseCallback: { (responseText) in
            if let responseText = responseText {
                let model:StoryListModel? = Mapper<StoryListModel>().map(JSONString: responseText)
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
    
    /// 内容Story详情
    static func storyDetail(storyId:Int, successCallback:@escaping SuccessBlock, failedCallback:@escaping FailedBlock, finallyCallback:@escaping FinallyBlock) {
        let url = "http://news-at.zhihu.com/api/4/news/\(storyId)";
        NetworkManager.GET(url: url, params: [:], responseCallback: { (responseText) in
            if let responseText = responseText {
                let model:ArticleModel? = Mapper<ArticleModel>().map(JSONString: responseText)
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
}
