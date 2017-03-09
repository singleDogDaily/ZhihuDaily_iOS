//
//  AnimatedCycleView.swift
//  SingleDogDaily
//
//  Created by Tommy on 2017/3/2.
//  Copyright © 2017年 Tommy. All rights reserved.
//

import UIKit

class AnimatedCycleView: UIView {
    
    var playOverCallback:generalCallback?
    let maxCount = 100
    private var count:Int = 0
    
    
    lazy var timer:Timer = { [unowned self] in
        let timer = Timer.init(timeInterval: 0.035, target: self, selector: #selector(AnimatedCycleView.timerAction), userInfo: nil, repeats: true)
        return timer
    } ()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.clear
        self.layer.cornerRadius = 10
        self.layer.borderColor = UIColor.white.cgColor
        self.layer.borderWidth = 1
        self.layer.masksToBounds = true
        
        RunLoop.main.add(timer, forMode: .commonModes)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func timerAction() {
        if count == maxCount {
            timer.invalidate()
            if let playOver = playOverCallback {
                playOver()
            }
            return
        } else {
            count += 1;
            self.setNeedsDisplay()
        }
    }
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        
        //context就相当于是画布
        let context:CGContext = UIGraphicsGetCurrentContext()!
        //线的宽度
        context.setLineWidth(4.0)
        //线条圆角
        context.setLineCap(.round)
        //线的颜色
        UIColor.lightGray.set()
        //参数分别为：哪个画布，圆点坐标x，圆点坐标y，半径，开始的弧度，结束的弧度，clockwise 0为顺时针，1为逆时针。
        //添加一个圆
        let endAngle = CGFloat(M_PI/2)
        let startAngle:CGFloat = endAngle + CGFloat(2*M_PI * 0.75 * Double(count)/Double(maxCount))
        
        context.addArc(center: CGPoint(x:self.bounds.size.width * 0.5, y:self.bounds.size.width * 0.5), radius: self.bounds.size.width * 0.5 - 9, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        
        //绘制路径
        context.drawPath(using: CGPathDrawingMode.stroke)
        
    }

}
