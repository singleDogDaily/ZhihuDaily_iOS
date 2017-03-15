//
//  LeftMenuCell.swift
//  SingleDogDaily
//
//  Created by Tommy on 2017/3/15.
//  Copyright © 2017年 Tommy. All rights reserved.
//

import UIKit

class LeftMenuCell: UITableViewCell {

    lazy var titleLabel:UILabel? = UILabel()
    lazy var rightButton:UIButton? = UIButton()
    
    // Xib 初始化
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    // Class 初始化
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(titleLabel!)
        contentView.addSubview(rightButton!)
        
//        rightButton?.backgroundColor = UIColor.green
        rightButton?.setImage(UIImage.init(named: "message_white"), for: .normal)
        rightButton?.setImage(UIImage.init(named: "message_white"), for: .highlighted)
        rightButton?.snp.makeConstraints({ (make) in
            make.height.width.equalTo(20)
            make.centerY.equalTo(contentView)
            make.trailing.equalTo(contentView).offset(-10)
        })
        
        titleLabel?.numberOfLines = 0
        titleLabel?.font = UIFont.systemFont(ofSize: 14.0)
        titleLabel?.textColor = UIColor.lightText
        titleLabel?.contentMode = .topLeft
        titleLabel?.snp.makeConstraints { make in
            make.centerY.equalTo(contentView)
            make.leading.equalToSuperview().offset(10.0)
            make.trailing.equalTo(rightButton!.snp.leading).offset(10.0)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
        titleLabel?.textColor = selected ? UIColor.white : UIColor.lightText
        contentView.backgroundColor = selected ? UIColor.selectedGreyColor4MenuCell() : UIColor.normalGreyColor4MenuCell()
    }
    
    func setTitleText(text:String?) {
        titleLabel?.text = text
    }

}
