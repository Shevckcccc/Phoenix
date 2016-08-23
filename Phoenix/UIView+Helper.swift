//
//  UIView+Helper.swift
//  Phoenix
//
//  Created by YuYongkai on 16/8/20.
//  Copyright © 2016年 Shevckcccc. All rights reserved.
//

import UIKit


extension UIView {
    convenience init(superview: UIView, closure: (v: UIView, s: UIView) -> Void) {
        self.init()

        superview.addSubview(self)
        closure(v: self, s: superview)
    }
}

extension UILabel {
    convenience init(superview: UIView, closure: (v: UILabel, s: UIView) -> Void) {
        self.init()

        superview.addSubview(self)
        closure(v: self, s: superview)
    }
}

extension UIButton {
    convenience init(superview: UIView, closure: (v: UIButton, s: UIView) -> Void) {
        self.init()

        superview.addSubview(self)
        closure(v: self, s: superview)
    }
}

extension UITextField {
    convenience init(superview: UIView, closure: (v: UITextField, s: UIView) -> Void) {
        self.init()

        superview.addSubview(self)
        closure(v: self, s: superview)
    }
}

extension UIImageView {
    convenience init(superview: UIView, closure: (v: UIImageView, s: UIView) -> Void) {
        self.init()

        superview.addSubview(self)
        closure(v: self, s: superview)
    }
}

extension UIPickerView {
    convenience init(superview: UIView, closure: (v: UIPickerView, s: UIView) -> Void) {
        self.init()

        superview.addSubview(self)
        closure(v: self, s: superview)
    }
}

extension UIScrollView {
    convenience init(superview: UIView, closure: (v: UIScrollView, s: UIView) -> Void) {
        self.init()

        superview.addSubview(self)
        closure(v: self, s: superview)
    }
}

extension UITableView {
    convenience init(superview: UIView, style: UITableViewStyle, closure: (v: UITableView, s: UIView) -> Void) {
        self.init(frame: CGRectZero, style: style)

        superview.addSubview(self)
        closure(v: self, s: superview)
    }
}

extension UICollectionView {
    convenience init(superview: UIView, collectionViewLayout: UICollectionViewLayout, closure: (v: UICollectionView, s: UIView) -> Void) {
        self.init(frame: CGRectZero, collectionViewLayout: collectionViewLayout)

        superview.addSubview(self)
        closure(v: self, s: superview)
    }
}
