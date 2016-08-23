//
//  UITableView+Helper.swift
//  Phoenix
//
//  Created by YuYongkai on 16/8/19.
//  Copyright © 2016年 Shevckcccc. All rights reserved.
//

import UIKit

extension UITableView {

    convenience init<T: UIViewController where T: UITableViewDelegate, T: UITableViewDataSource>(superview: T, style: UITableViewStyle, closure: (v: UITableView, s: UIView) -> Void) {
        self.init(frame: CGRectZero, style: style)

        self.delegate = superview
        self.dataSource = superview
        superview.view.addSubview(self)
        closure(v: self, s: superview.view)
    }

    convenience init<T: UIViewController where T: UITableViewDelegate, T: UITableViewDataSource>(superview: T, closure: (v: UITableView, s: UIView) -> Void) {
        self.init(superview: superview, style: .Plain, closure: closure)
    }


    func registerCell(cellClass: UITableViewCell.Type) {
        self.registerClass(cellClass, forCellReuseIdentifier: cellClass.className())
    }

    func dequeueReusableCell(cellClass: UITableViewCell.Type, forIndexPath: NSIndexPath) -> UITableViewCell {
        let cell =  self.dequeueReusableCellWithIdentifier(cellClass.className(), forIndexPath: forIndexPath)
        return cell
    }
}



extension UITableViewCell {

    class func className() -> String {
        return NSStringFromClass(self)
    }

}

