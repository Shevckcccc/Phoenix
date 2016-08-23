//
//  MenuCell.swift
//  Phoenix
//
//  Created by YuYongkai on 16/8/20.
//  Copyright © 2016年 Shevckcccc. All rights reserved.
//

import UIKit

class MenuCell: UITableViewCell {

    var iconImageView: UIImageView!
    var titleLabel: UILabel!

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .None
        self.backgroundColor = UIColor.clearColor()

        iconImageView = UIImageView(superview: self) { v, s in
            v.snp_makeConstraints(closure: { (make) in
                make.width.height.equalTo(20)
                make.centerY.equalTo(s)
                make.left.equalTo(s).offset(40)
            })
        }

        titleLabel = UILabel(superview: self) { v, s in
            v.snp_makeConstraints(closure: { (make) in
                make.centerY.equalTo(s)
                make.left.equalTo(self.iconImageView.snp_right).offset(20)
            })
            v.textColor = UIColor.whiteColor()
            v.font = UIFont.systemFontOfSize(15)
        }

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setData(data: [String]) {
        titleLabel.text = data[0]
        iconImageView.image = UIImage(named: data[1])
    }
}
