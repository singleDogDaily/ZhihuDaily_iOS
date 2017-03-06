//
//  AdBottomView.swift
//  SingleDogDaily
//
//  Created by Tommy on 2017/3/6.
//  Copyright © 2017年 Tommy. All rights reserved.
//

import UIKit

class AdBottomView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    lazy var cycleView:AnimatedCycleView = {
        let view = AnimatedCycleView()
        return view
    }()
    
    lazy var titleLabel:UILabel = {
        let title = UILabel()
        return title
    }()
    
    lazy var descLabel:UILabel = {
        let desc = UILabel()
        return desc
    }()
    
    func buildUI() {
        self.addSubview(cycleView)
        cycleView.backgroundColor = UIColor.clear
        cycleView.snp.makeConstraints { (make) in
            make.centerY.equalTo(self)
            make.left.equalTo(20)
            make.height.width.equalTo(40)
        }
        cycleView.timer.fire()
    
        self.addSubview(titleLabel)
        titleLabel.font = UIFont.systemFont(ofSize: 18)
        titleLabel.textColor = UIColor.white
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(cycleView)
            make.leading.equalTo(cycleView.snp.trailing).offset(10)
            make.height.equalTo(18)
            make.width.greaterThanOrEqualTo(40)
        }
        titleLabel.text = "单身狗日报"
    
        self.addSubview(descLabel)
        descLabel.font = UIFont.systemFont(ofSize: 14)
        descLabel.textColor = UIColor.lightText
        descLabel.snp.makeConstraints { (make) in
            make.bottom.equalTo(cycleView)
            make.leading.equalTo(cycleView.snp.trailing).offset(10)
            make.height.equalTo(14)
            make.width.greaterThanOrEqualTo(40)
        }
        descLabel.text = "每天几次都随你"
    }

}
