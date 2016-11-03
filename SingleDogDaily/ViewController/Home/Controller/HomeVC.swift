//
//  HomeVC.swift
//  SingleDogDaily
//
//  Created by Tommy on 2016/11/3.
//  Copyright © 2016年 Tommy. All rights reserved.
//

import UIKit
import SnapKit

class HomeVC: UIViewController {

    lazy var centerLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "Home"
        self.buildUI()
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
        
        print(#function + "--- ui build completed.")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
