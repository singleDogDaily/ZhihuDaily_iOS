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
    lazy var lineLabel:UILabel? = UILabel()
    
    // Xib 初始化
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    // Class 初始化
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(mainImageView!)
        mainImageView?.contentMode = .scaleToFill
        mainImageView?.snp.makeConstraints({ make in
            make.top.equalToSuperview().offset(10.0)
            make.trailing.equalToSuperview().offset(-10.0)
            make.height.width.equalTo(40.0)
        })
        
        contentView.addSubview(titleLabel!)
        titleLabel?.numberOfLines = 0
        titleLabel?.font = UIFont.systemFont(ofSize: 14.0)
        titleLabel?.textColor = UIColor.darkGray
        titleLabel?.contentMode = .topLeft
        titleLabel?.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10.0)
            make.leading.equalToSuperview().offset(20.0)
            make.trailing.equalTo(mainImageView!.snp.leading).offset(10.0)
            make.height.equalTo(20.0)
        }
        
        contentView.addSubview(lineLabel!);
        lineLabel?.numberOfLines = 0;
        lineLabel?.backgroundColor = UIColor.hexInt(0x999999)
        lineLabel?.snp.makeConstraints({ make in
            make.bottom.equalToSuperview();
            make.height.equalTo(0.5);
            make.leading.equalToSuperview();
            make.trailing.equalToSuperview();
        })
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setModel(model:DailyThemeModel) -> Void {
        titleLabel?.text = model.name
        mainImageView?.kf.setImage(with: URL(string: model.thumbnail!))
    }

}
