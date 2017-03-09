//
//  HomeSideMenuTopView.swift
//  SingleDogDaily
//
//  Created by Tommy on 2017/3/9.
//  Copyright © 2017年 Tommy. All rights reserved.
//

import UIKit

class HomeSideMenuTopView: UIView {

    lazy var photoImageView:UIImageView = {
        let imageView = UIImageView()
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
            make.leading.equalTo(userView)
            make.bottom.equalTo(userView)
            make.height.width.equalTo(30)
        }
        
        userNameLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(photoImageView.snp.trailing).offset(16)
            make.centerY.equalTo(photoImageView)
            make.height.greaterThanOrEqualTo(14)
            make.width.greaterThanOrEqualTo(40)
        }
        
    }

}
