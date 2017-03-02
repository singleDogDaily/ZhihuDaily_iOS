//
//  AnimatedCycleView.swift
//  SingleDogDaily
//
//  Created by Tommy on 2017/3/2.
//  Copyright © 2017年 Tommy. All rights reserved.
//

import UIKit

class AnimatedCycleView: UIView {

//    override func init(frame: CGRect) ->  {
//        if self = super.init(frame: frame) {
//            self.backgroundColor = UIColor.clearColor;
//            self.layer.cornerRadius = 10;
//            self.layer.borderColor = [UIColor whiteColor].CGColor;
//            self.layer.borderWidth = 1;
//        }
//        return self;
//    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.clear
        self.layer.cornerRadius = 10
        self.layer.borderColor = UIColor.white.cgColor
        self.layer.borderWidth = 1
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
//        let radius:CGFloat = 12
//        let context:CGContext = UIGraphicsGetCurrentContext()!
//        addArc(context)
//        CGContextAddArc(context, self.bounds.size.width * 0.5, self.bounds.size.width * 0.5, radius, CGFloat(M_PI/2.0), 0, 0)
//        CGContextSetLineWidth(context, 5)
//        CGContextStrokePath(context)
        
    }

}
