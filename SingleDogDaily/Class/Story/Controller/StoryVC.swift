//
//  StoryVC.swift
//  SingleDogDaily
//
//  Created by Tommy on 2017/3/1.
//  Copyright © 2017年 Tommy. All rights reserved.
//

import UIKit
import MJRefresh
import SnapKit

class StoryVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    public var themeModel:DailyThemeModel?

    /// tableView
    lazy var tableView: UITableView = { [unowned self] in
        let tab = UITableView()
        // 注册cellID
        tab.separatorStyle = UITableViewCellSeparatorStyle.none
        tab.register(BasicCell.classForCoder(), forCellReuseIdentifier: "basic_cell")
        tab.mj_header = MJRefreshNormalHeader.init( refreshingBlock: {
            self.requestStoryList();
        })
        return tab
        }()
    
    var list:NSMutableArray = NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        title = themeModel!.name
        automaticallyAdjustsScrollViewInsets = false
        buildUI()
        tableView.mj_header.beginRefreshing();
    }
    
    func buildUI() {
        print(#function + "--- start build home ui.")
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.top.equalTo(64)
            make.left.equalTo(view)
            make.bottom.equalTo(view)
            make.right.equalTo(view)
        }
        tableView.delegate = self
        tableView.dataSource = self
        
        print(#function + "--- ui build completed.")
    }
    
    //MARK: - Request Story List Data
    func requestStoryList() -> Void {
        NetworkTool.themeStoryList(themeId: themeModel!.id!, successCallback: { (model) in
            let model:StoryListModel = model as! StoryListModel
            if let data = model.stories {
                self.list.removeAllObjects();
                self.list.addObjects(from: data)
                self.tableView.reloadData()
            } else {
                print("数据为空")
            }
        }, failedCallback: { (message, code) in
            print("请求错误:\(code)")
        }) {
            self.tableView.mj_header.endRefreshing();
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model:StoryModel = list[indexPath.row] as! StoryModel
        
        let cell:BasicCell = (tableView.dequeueReusableCell(withIdentifier: "basic_cell") as? BasicCell)!
        cell.setStoryModel(model: model)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //
        print("\(indexPath.row) is selected.")
        let model:StoryModel = list[indexPath.row] as! StoryModel
        let articleVC:ArticleVC = ArticleVC()
        articleVC.storyModel = model
        self.navigationController?.pushViewController(articleVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //
        return list.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        //
        return 60.0
    }
    
}
