
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
        tab.delegate = self
        tab.dataSource = self
        // 注册cellID
        tab.separatorStyle = UITableViewCellSeparatorStyle.none
        tab.register(BasicCell.classForCoder(), forCellReuseIdentifier: "basic_cell")
        tab.mj_header = MJRefreshNormalHeader.init( refreshingBlock: {
            self.requestThemeList();
        })
        return tab
    }()
    
    var list:NSMutableArray = NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "Theme List"
        automaticallyAdjustsScrollViewInsets = false
        buildUI()
        setupSideMenu()
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
    
    //MARK: - Side Menu
    
    fileprivate func setupSideMenu() {
        // Define the menus
        let menuLeftNavigationController = UISideMenuNavigationController(rootViewController: LeftSideMenuVC())
        menuLeftNavigationController.leftSide = true
        // UISideMenuNavigationController is a subclass of UINavigationController, so do any additional configuration
        // of it here like setting its viewControllers. If you're using storyboards, you'll want to do something like:
        // let menuLeftNavigationController = storyboard!.instantiateViewController(withIdentifier: "LeftMenuNavigationController") as! UISideMenuNavigationController
        SideMenuManager.menuLeftNavigationController = menuLeftNavigationController
        
        // Enable gestures. The left and/or right menus must be set up above for these to work.
        // Note that these continue to work on the Navigation Controller independent of the view controller it displays!
        SideMenuManager.menuAddPanGestureToPresent(toView: self.navigationController!.navigationBar)
        SideMenuManager.menuAddScreenEdgePanGesturesToPresent(toView: self.navigationController!.view)
    }

}
