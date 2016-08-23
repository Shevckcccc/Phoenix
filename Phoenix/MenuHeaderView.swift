//
//  ProfileHeaderView.swift
//  Phoenix
//
//  Created by YuYongkai on 16/8/20.
//  Copyright © 2016年 Shevckcccc. All rights reserved.
//

import UIKit
import SDWebImage

class MenuHeaderView: UIView {

    var avatarImageView: UIImageView!
    var nicknameLabel: UILabel!
    var tipsLabel: UILabel!

    override init(frame: CGRect) {
        super.init(frame: frame)

        self.backgroundColor = UIColor.clearColor()

        avatarImageView = UIImageView(superview: self) { v, s in
            v.snp_makeConstraints { (make) in
                make.centerX.equalTo(self)
                make.centerY.equalTo(self).offset(-10)
                make.width.height.equalTo(65)
            }
            v.layer.borderColor = UIColor.whiteColor().CGColor
            v.layer.borderWidth = 0.5
            v.layer.cornerRadius = 65/2
            v.clipsToBounds = true
        }

        nicknameLabel = UILabel(superview: self) { v, s in
            v.snp_makeConstraints { (make) in
                make.centerX.equalTo(self)
                make.top.equalTo(self.avatarImageView.snp_bottom).offset(10)
            }
            v.text = "Shevckcccc"
            v.font = UIFont.systemFontOfSize(15)
            v.textColor = UIColor.whiteColor()
        }


        tipsLabel = UILabel(superview: self) { v, s in
            v.snp_makeConstraints { (make) in
                make.centerX.equalTo(self)
                make.top.equalTo(self.nicknameLabel.snp_bottom).offset(5)
            }
            v.text = "点击查看/编辑"
            v.font = UIFont.systemFontOfSize(11)
            v.textColor = UIColor.grayColor()
        }

    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setAvatar(avatarUrl: String) {
        let url = NSURL(string: avatarUrl)
        self.avatarImageView.sd_setImageWithURL(url)
    }
}
