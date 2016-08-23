//
//  MenuVC.swift
//  Phoenix
//
//  Created by YuYongkai on 16/8/19.
//  Copyright © 2016年 Shevckcccc. All rights reserved.
//

import UIKit
import SnapKit

class MenuVC: UIViewController {

    var tableView: UITableView!

    let rowData: [[String]] = [
        ["翻牌子", "MenuMessageIcon"],
        ["消息", "MenuMessageIcon"],
        ["设置", "MenuMessageIcon"]
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        configViews()
        configData()
    }


    // MARK: 初始化界面
    private func configViews() {
        configBaseView()
        configTableView()
        configHeaderView()
    }

    // MARK: 初始化数据
    private func configData() {

    }

    // MARK: 界面方法
    func configBaseView() {
        let backgrounImageView = UIImageView(superview: self.view) { v, s in
            v.snp_makeConstraints(closure: { (make) in
                make.edges.equalTo(s)
            })
        }
        backgrounImageView.sd_setImageWithURL(NSURL(string: "http://tva2.sinaimg.cn/crop.0.0.180.180.180/7dfdf1c5jw1e8qgp5bmzyj2050050aa8.jpg"))
        self.view.backgroundColor = UIColor.clearColor()

        let blurEffect = UIBlurEffect(style: .Dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)

        blurEffectView.frame = self.view.bounds
        self.view.addSubview(blurEffectView)
    }

    func configTableView() {
        tableView = UITableView(superview: self) { v, s in
            v.snp_makeConstraints { make in
                make.edges.equalTo(s)
            }
        }
        tableView.registerCell(MenuCell.self)
        tableView.backgroundColor = UIColor.clearColor()
        tableView.tableFooterView = UIView()
        tableView.separatorStyle = .None
        tableView.rowHeight = 68.0
    }

    func configHeaderView() {
        let frame = CGRectMake(0, 0, tableView.frame.size.width, MenuProfileHeaderHeight)
        let header = MenuHeaderView(frame: frame)
        tableView.tableHeaderView = header

        // 设置头像
        header.setAvatar("http://tva2.sinaimg.cn/crop.0.0.180.180.180/7dfdf1c5jw1e8qgp5bmzyj2050050aa8.jpg")
        
    }
}

extension MenuVC: UITableViewDelegate, UITableViewDataSource {

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rowData.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(MenuCell.self, forIndexPath: indexPath) as! MenuCell

        cell.setData(rowData[indexPath.row])

        return cell
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
}
