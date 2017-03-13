//
//  HomeSideMenuTopView.swift
//  SingleDogDaily
//
//  Created by Tommy on 2017/3/9.
//  Copyright © 2017年 Tommy. All rights reserved.
//

import UIKit

class HomeSideMenuTopView: UIView {

    // MARK:Properties
    lazy var photoImageView:UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 25
        imageView.layer.masksToBounds = true
        imageView.image = UIImage.init(named: "photo")
        return imageView
    }()
    
    lazy var userNameLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = UIColor.lightGray
        label.numberOfLines = 0
        label.text = "小红N次方"
        return label
    }()
    
    lazy var storeLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor.lightText
        label.textAlignment = .center
        label.text = "收藏"
        return label
    }()
    
    lazy var messageLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor.lightText
        label.textAlignment = .center
        label.text = "消息"
        return label
    }()
    
    lazy var settingLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor.lightText
        label.textAlignment = .center
        label.text = "设置"
        return label
    }()
    
    // MARK:Life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        print("调用了init方法")
        build()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func build() {
        let userView:UIView = UIView()
        self.addSubview(userView)
        
        userView.snp.makeConstraints { (make) in
            make.top.equalTo(self).offset(64)
            make.leading.trailing.equalTo(self)
            make.height.equalTo(64)
        }
        
        userView.addSubview(photoImageView)
        userView.addSubview(userNameLabel)
        
        photoImageView.snp.makeConstraints { (make) in
            make.leading.equalTo(userView).offset(20)
            make.centerY.equalTo(userView)
            make.height.width.equalTo(50)
        }
        
        userNameLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(photoImageView.snp.trailing).offset(16)
            make.centerY.equalTo(photoImageView)
            make.height.greaterThanOrEqualTo(14)
            make.width.greaterThanOrEqualTo(40)
        }
        
        // 组装收藏+消息+设置
        
        let storeView = UIView()
        let messageView = UIView()
        let settingView = UIView()
        self.addSubview(storeView)
        self.addSubview(messageView)
        self.addSubview(settingView)
        
        // 收藏
        storeView.snp.makeConstraints { (make) in
            make.leading.equalTo(self)
            make.trailing.equalTo(messageView.snp.leading)
            make.top.equalTo(userView.snp.bottom).offset(30)
            make.height.equalTo(60)
            make.width.equalTo(messageView)
        }
        
        let storeImageView = UIImageView()
        storeImageView.image = UIImage.init(named: "photo")
        storeView.addSubview(storeImageView)
        storeImageView.snp.makeConstraints { (make) in
            make.centerX.equalTo(storeView)
            make.top.equalTo(storeView)
            make.width.height.equalTo(30)
        }
        
        storeView.addSubview(storeLabel)
        storeLabel.snp.makeConstraints { (make) in
            make.top.equalTo(storeImageView.snp.bottom)
            make.leading.trailing.equalTo(storeView)
            make.bottom.equalTo(storeView)
        }
        
        // 消息
        messageView.snp.makeConstraints { (make) in
            make.leading.equalTo(storeView.snp.trailing)
            make.trailing.equalTo(settingView.snp.leading)
            make.top.equalTo(userView.snp.bottom).offset(30)
            make.height.equalTo(60)
            make.width.equalTo(settingView)
        }
        
        let messageImageView = UIImageView()
        messageImageView.image = UIImage.init(named: "photo")
        messageView.addSubview(messageImageView)
        messageImageView.snp.makeConstraints { (make) in
            make.centerX.equalTo(messageView)
            make.top.equalTo(messageView)
            make.width.height.equalTo(30)
        }
        
        messageView.addSubview(messageLabel)
        messageLabel.snp.makeConstraints { (make) in
            make.top.equalTo(messageImageView.snp.bottom)
            make.leading.trailing.equalTo(messageView)
            make.bottom.equalTo(messageView)
        }
        
        // 设置
        settingView.snp.makeConstraints { (make) in
            make.leading.equalTo(messageView.snp.trailing)
            make.trailing.equalTo(self)
            make.top.equalTo(userView.snp.bottom).offset(30)
            make.height.equalTo(60)
            make.width.equalTo(storeView)
        }
        
        let settingImageView = UIImageView()
        settingImageView.image = UIImage.init(named: "photo")
        messageView.addSubview(settingImageView)
        settingImageView.snp.makeConstraints { (make) in
            make.centerX.equalTo(settingView)
            make.top.equalTo(settingView)
            make.width.height.equalTo(30)
        }
        
        settingView.addSubview(settingLabel)
        settingLabel.snp.makeConstraints { (make) in
            make.top.equalTo(settingImageView.snp.bottom)
            make.leading.trailing.equalTo(settingView)
            make.bottom.equalTo(settingView)
        }
    }

}
