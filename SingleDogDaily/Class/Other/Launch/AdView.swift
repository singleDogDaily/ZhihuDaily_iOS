//
//  AdView.swift
//  SingleDogDaily
//
//  Created by Tommy on 2017/3/6.
//  Copyright © 2017年 Tommy. All rights reserved.
//

import UIKit

typealias generalCallback = ()->Void

class AdView: UIView {
    
    var launchFinishedCallback:generalCallback?

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    lazy var bottomView: AdBottomView = {
        let view = AdBottomView()
        view.backgroundColor = UIColor.black
        view.buildUI()
        view.playOverCallback = { [unowned self] in
            if let callback = self.launchFinishedCallback {
                callback()
            }
            
            UIView.animate(withDuration: 1.5, animations: {
                self.alpha = 0;
            }) { (finished) in
                self.removeFromSuperview()
            }
        }
        return view
    }()
    
    lazy var imageView:UIImageView = {
        let imgView = UIImageView()
        imgView.backgroundColor = UIColor.black
        return imgView
    }()
    
    lazy var authorLabel:UILabel = {
        let label = UILabel()
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    public func build() {
        self.addSubview(self.bottomView)
        self.addSubview(self.imageView)
        self.addSubview(self.authorLabel)
        
        self.bottomView.snp.makeConstraints { (make) in
            make.bottom.equalTo(self)
            make.left.equalTo(self)
            make.right.equalTo(self)
            make.centerX.equalTo(self)
            make.height.equalTo(80)
        }
        
        self.imageView.snp.makeConstraints { (make) in
            make.top.equalTo(self)
            make.leading.trailing.equalTo(self)
            make.bottom.equalTo(self.bottomView.snp.top)
        }
        
        self.authorLabel.snp.makeConstraints { (make) in
            make.bottom.equalTo(self.imageView.snp.bottom).offset(-16)
            make.centerX.equalTo(self.bottomView)
            make.height.greaterThanOrEqualTo(14)
            make.width.greaterThanOrEqualTo(40)
        }
        
        NetworkTool.launchAdvertData(successCallback: { (model) in
            let model:AdLaunchModelList = model as! AdLaunchModelList
            if let data = model.creatives {
                if data.count > 0 {
                    let adModel:AdLaunchModel = data[0]
                    if let url = adModel.url, let text = adModel.text {
                        self.authorLabel.text = text
                        self.imageView.kf.setImage(with: URL(string: url))
                    }
                }
            } else {
                print("数据异常")
            }
        }, failedCallback: { (message, code) in
            print("请求错误:\(code),message:\(message)")
        }, finallyCallback: {
            
        })
    }

}
