//
//  HomeVC.swift
//  SingleDogDaily
//
//  Created by Tommy on 2016/11/3.
//  Copyright © 2016年 Tommy. All rights reserved.
//

import UIKit
import SnapKit
import ObjectMapper

class HomeVC: UIViewController, UITableViewDataSource, UITableViewDelegate {

    lazy var centerLabel = UILabel()
    lazy var tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "Home"
        self.automaticallyAdjustsScrollViewInsets = false
        self.buildUI()
        self.request(params: {})
    }
    
    //MARK: - Data Request
    func request(params:Any!) -> Void {
        // 主题日报列表查看
        let url = "https://news-at.zhihu.com/api/4/themes"
        NetworkManager.GET(url: url, body:params as AnyObject?, succeed: { (responseObject:Any?) in
            //
            print("success.")
        }) { (error:Error?) in
            print("fail:" + error.debugDescription)
        }
        
        let json = "{\"color\": 15007, \"thumbnail\": \"http://pic3.zhimg.com/0e71e90fd6be47630399d63c58beebfc.jpg\", \"description\": \"了解自己和别人，了解彼此的欲望和局限。\", \"id\": 13, \"name\": \"日常心理学\"}"
        let theme : DailyThemeModel? = DailyThemeModel(JSONString:json)
        print("name:\(theme!.name)")
    }
    
    func buildUI() {
        print(#function + "--- start build home ui.")
        self.view.addSubview(centerLabel)
        centerLabel.snp.makeConstraints { (make) in
            make.width.equalTo(200.0)
            make.height.equalTo(50.0)
            make.center.equalTo(self.view)
        }
        centerLabel.textAlignment = NSTextAlignment.center
        centerLabel.text = "Welcome to SingleDog's Daily"
        centerLabel.textColor = UIColor.blue
        centerLabel.numberOfLines = 0
        
        self.view .addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.top.equalTo(self.view)
            make.left.equalTo(self.view)
            make.bottom.equalTo(self.view)
            make.right.equalTo(self.view)
        }
        tableView.delegate = self
        tableView.dataSource = self
        
        print(#function + "--- ui build completed.")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        static let reuseIdentifier = "default_cell"
        let cell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "default_cell")
        cell.textLabel?.text = "Hello Swift"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //
        print("\(indexPath.row) is selected.")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //
        return 10
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        //
        return 44.0
    }

}
