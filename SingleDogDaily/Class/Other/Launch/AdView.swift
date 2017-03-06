//
//  AdView.swift
//  SingleDogDaily
//
//  Created by Tommy on 2017/3/6.
//  Copyright © 2017年 Tommy. All rights reserved.
//

import UIKit

class AdView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    public init(bounds: CGRect) {
        super.init(frame: bounds)
        NotificationCenter.default.addObserver(self, selector: #selector(AdView.launchFinished), name: NSNotification.Name(rawValue: "adview.finish"), object: nil)
    }
    
    @objc private func launchFinished() {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name(rawValue: "adview.finish"), object: nil)
        UIView.animate(withDuration: 1.5, animations: {
            self.alpha = 0;
        }) { (finished) in
            self.removeFromSuperview()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var bottomView: AdBottomView = {
        let view = AdBottomView()
        view.backgroundColor = UIColor.black
        view.buildUI()
        return view
    }()
    
    lazy var imageView:UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage.init(named: "adimage")
        return imgView
    }()
    
//    var prefersStatusBarHidden: Bool {
//        return true
//    }
    
    public func build() {
        self.addSubview(self.bottomView)
        self.addSubview(self.imageView)
        
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
    }

}
