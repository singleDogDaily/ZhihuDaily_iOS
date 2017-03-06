
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

    /// tableView
    lazy var tableView: UITableView = { [unowned self] in
        let tab = UITableView()
        // 注册cellID
        tab.separatorStyle = UITableViewCellSeparatorStyle.none
        tab.register(BasicCell.classForCoder(), forCellReuseIdentifier: "basic_cell")
        tab.mj_header = MJRefreshNormalHeader.init( refreshingBlock: {
            self.requestThemeList();
        })
        return tab
    }()
    
    lazy var blackView: UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var cycleView:AnimatedCycleView = {
        let view = AnimatedCycleView()
        return view
    }()
    
    var list:NSMutableArray = NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "Theme List"
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
        
        view.addSubview(blackView)
        blackView.backgroundColor = UIColor.black
        blackView.snp.makeConstraints { (make) in
            make.bottom.equalTo(view)
            make.left.equalTo(view)
            make.right.equalTo(view)
            make.centerX.equalTo(view)
            make.height.equalTo(80)
        }
        
        blackView.addSubview(cycleView)
        cycleView.backgroundColor = UIColor.clear
        cycleView.snp.makeConstraints { (make) in
            make.centerY.equalTo(blackView)
            make.left.equalTo(20)
            make.height.width.equalTo(40)
        }
        cycleView.timer.fire()
        
        let titleLabel:UILabel = UILabel()
        blackView.addSubview(titleLabel)
        titleLabel.font = UIFont.systemFont(ofSize: 18)
        titleLabel.textColor = UIColor.white
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(cycleView)
            make.leading.equalTo(cycleView.snp.trailing).offset(10)
            make.height.equalTo(18)
            make.width.greaterThanOrEqualTo(40)
        }
        titleLabel.text = "单身狗日报"
        
        let descLabel:UILabel = UILabel()
        blackView.addSubview(descLabel)
        descLabel.font = UIFont.systemFont(ofSize: 14)
        descLabel.textColor = UIColor.lightText
        descLabel.snp.makeConstraints { (make) in
            make.bottom.equalTo(cycleView)
            make.leading.equalTo(cycleView.snp.trailing).offset(10)
            make.height.equalTo(14)
            make.width.greaterThanOrEqualTo(40)
        }
        descLabel.text = "每天几次都随你"
        
        print(#function + "--- ui build completed.")
    }
    
    //MARK: - Request List Data
    func requestThemeList() -> Void {
        NetworkTool.themelist(successCallback: { (model) in
            let model:DailyThemeListModel = model as! DailyThemeListModel
            if let data = model.others {
                self.list.removeAllObjects();
                self.list.addObjects(from: data)
                self.tableView.reloadData()
            } else {
                print("数据为空")
            }
        }, failedCallback: { (message, code) in
            print("请求错误:\(code)")
        }, finallyCallback: {
            self.tableView.mj_header.endRefreshing();
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model:DailyThemeModel = list[indexPath.row] as! DailyThemeModel
        
        let cell:BasicCell = (tableView.dequeueReusableCell(withIdentifier: "basic_cell") as? BasicCell)!
        cell.setThemeModel(model: model)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //
        print("\(indexPath.row) is selected.")
        let model:DailyThemeModel = list[indexPath.row] as! DailyThemeModel
        let storyVC: StoryVC = StoryVC()
        storyVC.themeModel = model
        self.navigationController?.pushViewController(storyVC, animated: true);
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
