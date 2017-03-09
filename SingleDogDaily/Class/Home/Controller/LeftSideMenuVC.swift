//
//  LeftSideMenuVC.swift
//  SingleDogDaily
//
//  Created by Tommy on 2017/3/9.
//  Copyright © 2017年 Tommy. All rights reserved.
//

import UIKit

class LeftSideMenuVC: UIViewController {

    lazy var topView:HomeSideMenuTopView = {
        let view:HomeSideMenuTopView = HomeSideMenuTopView()
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.init(colorLiteralRed: 35.0/255.0, green: 42.0/255.0, blue: 48.0/255.0, alpha: 1.0)
        // Do any additional setup after loading the view.
        buildUI()
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
            make.height.equalTo(150)
        }
    }

}
