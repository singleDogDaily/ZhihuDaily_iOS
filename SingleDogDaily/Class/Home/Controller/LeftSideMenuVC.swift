//
//  LeftSideMenuVC.swift
//  SingleDogDaily
//
//  Created by Tommy on 2017/3/9.
//  Copyright © 2017年 Tommy. All rights reserved.
//

import UIKit

class LeftSideMenuVC: UIViewController, UITableViewDataSource, UITableViewDelegate  {

    lazy var topView:HomeSideMenuTopView = {
        let view:HomeSideMenuTopView = HomeSideMenuTopView()
        return view
    }()
    
    lazy var list:NSMutableArray = {
        return NSMutableArray()
    }()
    
    /// tableView
    lazy var tableView: UITableView = { [unowned self] in
        let tab = UITableView()
        tab.delegate = self
        tab.dataSource = self
        tab.bounces = false
        // 注册cellID
        tab.separatorStyle = UITableViewCellSeparatorStyle.none
        tab.register(LeftMenuCell.classForCoder(), forCellReuseIdentifier: "left_menu_cell")
        return tab
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.leftMenuBgColor()
        // Do any additional setup after loading the view.
        buildUI()
        self.requestThemeList()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    private func buildUI() {
        view.addSubview(topView)
        topView.snp.makeConstraints { (make) in
            make.top.equalTo(view)
            make.leading.trailing.equalTo(view)
            make.height.equalTo(250)
        }
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.top.equalTo(topView.snp.bottom)
            make.leading.trailing.equalTo(view)
            make.bottom.equalTo(view)
        }
    }
    
    //MARK: - Request List Data
    func requestThemeList() -> Void {
        NetworkTool.themelist(successCallback: { (model) in
            let model:DailyThemeListModel = model as! DailyThemeListModel
            if let data = model.others {
                self.list.removeAllObjects()
                self.list.addObjects(from: data)
                self.tableView.reloadData()
            } else {
                print("数据为空")
            }
        }, failedCallback: { (message, code) in
            print("请求错误:\(code)")
        }, finallyCallback: {
        })
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model:DailyThemeModel = list[indexPath.row] as! DailyThemeModel
        
        let cell:LeftMenuCell = (tableView.dequeueReusableCell(withIdentifier: "left_menu_cell") as? LeftMenuCell)!
//        cell.setThemeModel(model: model)
        cell .setTitleText(text: model.name)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        //
//        print("\(indexPath.row) is selected.")
//        let model:DailyThemeModel = list[indexPath.row] as! DailyThemeModel
//        let storyVC: StoryVC = StoryVC()
//        storyVC.themeModel = model
//        self.navigationController?.pushViewController(storyVC, animated: true)
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
