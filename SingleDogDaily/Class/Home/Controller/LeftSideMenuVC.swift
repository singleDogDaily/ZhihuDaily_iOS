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
        // 注册cellID
        tab.separatorStyle = UITableViewCellSeparatorStyle.none
        tab.register(BasicCell.classForCoder(), forCellReuseIdentifier: "basic_cell")
        return tab
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.init(colorLiteralRed: 35.0/255.0, green: 42.0/255.0, blue: 48.0/255.0, alpha: 1.0)
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
        self.navigationController?.pushViewController(storyVC, animated: true)
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
