//
//  HomeCell.swift
//  Phoenix
//
//  Created by YuYongkai on 16/8/21.
//  Copyright © 2016年 Shevckcccc. All rights reserved.
//

import UIKit

class HomeCell: UIView {
    var coverImageView: UIImageView!
    var bottomView: UIView!
    var nameLabel: UILabel!
    var bioLabel: UILabel!

    override init(frame: CGRect) {
        super.init(frame: frame)

        coverImageView = UIImageView(superview: self) { v, s in
           v.snp_makeConstraints(closure: { (make) in
                make.right.top.left.equalTo(s)
                make.height.equalTo(s).multipliedBy(0.8)
           })
           v.clipsToBounds = true
           v.contentMode = .ScaleAspectFill
        }

        bottomView = UIView(superview: self) { v, s in
            v.snp_makeConstraints(closure: { (make) in
                make.right.left.bottom.equalTo(s)
                make.top.equalTo(self.coverImageView.snp_bottom)
            })
        }

        nameLabel = UILabel(superview: bottomView) { v, s in
            v.snp_makeConstraints(closure: { (make) in
                make.left.equalTo(10)
                make.top.equalTo(10)
                make.width.equalTo(self).inset(20)
            })
            v.font = UIFont.systemFontOfSize(16)
            v.textColor = UIColor.blackColor()
        }

        bioLabel = UILabel(superview: bottomView) { v, s in
            v.snp_makeConstraints(closure: { (make) in
                make.left.equalTo(10)
                make.top.equalTo(self.nameLabel.snp_bottom).offset(10)
                make.width.equalTo(self).inset(20)
            })
            v.font = UIFont.systemFontOfSize(12)
            v.textColor = UIColor.grayColor()
        }

        self.layer.cornerRadius = 5
        self.layer.borderColor = UIColor.grayColor().CGColor
        self.layer.borderWidth = 0.5
        self.clipsToBounds = true
        self.backgroundColor = UIColor.whiteColor()

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setData() {
        coverImageView.sd_setImageWithURL(NSURL(string: "http://ww3.sinaimg.cn/mw600/6df9a478jw1e4d53mwdgmj20cz0jg43k.jpg"))
        nameLabel.text = "Gloria, 23"
        bioLabel.text = "设计师，点融网（500m）"
    }

}
