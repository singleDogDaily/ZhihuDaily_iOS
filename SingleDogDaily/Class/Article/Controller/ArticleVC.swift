//
//  ArticleVC.swift
//  SingleDogDaily
//
//  Created by Tommy on 2017/3/2.
//  Copyright © 2017年 Tommy. All rights reserved.
//

import UIKit

class ArticleVC: UIViewController {
    
    public var storyModel:StoryModel?
    
    lazy var webView:UIWebView = { [unowned self] in
        // 创建webview
        let web = UIWebView()
        return web
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.buildUI()
        self.requestThemeList()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func buildUI() {
        view.addSubview(webView)
        webView.snp.makeConstraints { (make) in
            make.edges.equalTo(view)
        }
    }
    
    //MARK: - Request Detail Data
    func requestThemeList() -> Void {
        NetworkTool.storyDetail(storyId: storyModel!.id!, successCallback: { (model) in
            let model:ArticleModel = model as! ArticleModel
            if let body = model.body, let css = model.css {
                let html = "<!DOCTYPE html>"
                    + "<html>"
                    + "<head>"
                    + ((css.count > 0) ? "<link rel=\"stylesheet\" href='" + css.first! + "' type=\"text/css\" />" : "")
                    + "<meta charset=\"UTF-8\">"
                    + "<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0\">"
                    + body
                    + "</head>"
                    + "</html>"
                self.webView.loadHTMLString(html, baseURL: nil)
            } else {
                print("body为空")
            }
        }, failedCallback: { (message, code) in
            print("请求错误:\(code)")
        }, finallyCallback: {
        })
    }

}
