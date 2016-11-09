//
//  BasicCell.swift
//  SingleDogDaily
//
//  Created by Tommy on 2016/11/9.
//  Copyright © 2016年 Tommy. All rights reserved.
//

import UIKit
import Kingfisher

class BasicCell: UITableViewCell {
    
    lazy var titleLabel:UILabel? = UILabel()
    lazy var mainImageView:UIImageView? = UIImageView()
    
    // Xib 初始化
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.backgroundColor = UIColor.red
    }
    
    // Class 初始化
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(self.mainImageView!)
        self.mainImageView?.contentMode = .scaleToFill
        self.mainImageView?.snp.makeConstraints({ make in
            make.top.equalToSuperview().offset(10.0)
            make.trailing.equalToSuperview().offset(-10.0)
            make.height.width.equalTo(40.0)
        })
        
        self.contentView.addSubview(self.titleLabel!)
        self.titleLabel?.numberOfLines = 0
        self.titleLabel?.font = UIFont.systemFont(ofSize: 14.0)
        self.titleLabel?.textColor = UIColor.darkGray
        self.titleLabel?.contentMode = .topLeft
        self.titleLabel?.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10.0)
            make.leading.equalToSuperview().offset(20.0)
            make.trailing.equalTo(self.mainImageView!.snp.leading).offset(10.0)
            make.height.equalTo(20.0)
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setModel(model:DailyThemeModel) -> Void {
        self.titleLabel?.text = model.name
        self.mainImageView?.kf.setImage(with: URL(string: model.thumbnail!))
    }

}
