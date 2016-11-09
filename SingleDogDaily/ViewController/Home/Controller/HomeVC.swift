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
import Alamofire
import MJRefresh

class HomeVC: UIViewController, UITableViewDataSource, UITableViewDelegate {

    lazy var tableView = UITableView()
    var list:NSMutableArray = NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "Theme List"
        self.automaticallyAdjustsScrollViewInsets = false
        self.buildUI()
        self.requestThemeList()
    }
    
    func buildUI() {
        print(#function + "--- start build home ui.")
        
        self.view .addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.top.equalTo(64)
            make.left.equalTo(self.view)
            make.bottom.equalTo(self.view)
            make.right.equalTo(self.view)
        }
        tableView.delegate = self
        tableView.dataSource = self
        
        print(#function + "--- ui build completed.")
    }
    
    //MARK: - Request List Data
    func requestThemeList() -> Void {
        NetworkManager.login(userName:"username", password:"password", callback:{ response in
            let model:DailyThemeListModel = response as! DailyThemeListModel
            if let data = model.others {
                self.list.addObjects(from: data)
                self.tableView .reloadData()
            } else {
                print("返回列表数据为空")
            }
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        static let reuseIdentifier = "default_cell"
        let model:DailyThemeModel = self.list[indexPath.row] as! DailyThemeModel
        let cell = BasicCell(style: UITableViewCellStyle.value1, reuseIdentifier: "basic_cell")
        cell.setModel(model: model)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //
        print("\(indexPath.row) is selected.")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //
        return self.list.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        //
        return 60.0
    }

}
