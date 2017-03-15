//
//  UIColor+Theme.swift
//  SingleDogDaily
//
//  Created by Tommy on 2017/3/15.
//  Copyright © 2017年 Tommy. All rights reserved.
//

import Foundation

extension UIColor {
    
    class func leftMenuBgColor() -> UIColor {
        return UIColor.normalGreyColor4MenuCell()
    }
    
    /// 左侧菜单cell的默认背景色
    ///
    /// - Returns: UIColor
    class func normalGreyColor4MenuCell() -> UIColor {
        return UIColor.init(colorLiteralRed: 35.0/255.0, green: 42.0/255.0, blue: 48.0/255.0, alpha: 1.0)
    }
    
    /// 左侧菜单cell的选中背景色
    ///
    /// - Returns: UIColor
    class func selectedGreyColor4MenuCell() -> UIColor {
        return UIColor.init(colorLiteralRed: 27.0/255.0, green: 35.0/255.0, blue: 41.0/255.0, alpha: 1.0)
    }
}
