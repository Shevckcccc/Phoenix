//
//  HomeVC.swift
//  LifeSpecial
//
//  Created by YuYongkai on 16/8/19.
//  Copyright © 2016年 Shevckcccc. All rights reserved.
//

import UIKit
import Koloda

class HomeVC: PublicVC {
    var kolodaView: KolodaView!
    var skipButton: UIButton!
    var likeButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configViews()
    }

    func configViews() {
        self.view.backgroundColor = UIColor.whiteColor()
        self.title = "翻牌子"
        self.edgesForExtendedLayout = .None

        kolodaView = KolodaView(frame: CGRectZero)
        self.view.addSubview(kolodaView)
        kolodaView.snp_makeConstraints { (make) in
            make.centerX.equalTo(self.view)
            make.top.equalTo(self.view).offset(20)
            make.right.equalTo(self.view).offset(-20)
            make.left.equalTo(self.view).offset(20)
            make.height.equalTo(self.view.snp_height).multipliedBy(1.8/3)
        }
        kolodaView.dataSource = self
        kolodaView.delegate = self

        let actionsView = UIView()
        self.view.addSubview(actionsView)
        actionsView.snp_makeConstraints { (make) in
            make.centerX.equalTo(self.view)
            make.top.equalTo(self.kolodaView.snp_bottom).offset(20)
            make.right.equalTo(self.view).offset(-20)
            make.left.equalTo(self.view).offset(20)
            make.bottom.equalTo(self.view).offset(-10)
        }

        let quarterWidth = (self.view.frame.size.width - 40)/4.0

        likeButton = UIButton(type: .Custom)
        actionsView.addSubview(likeButton)
        likeButton.snp_makeConstraints { (make) in
            make.centerX.equalTo(actionsView).offset(quarterWidth)
            make.centerY.equalTo(actionsView)
            make.height.width.equalTo(66)
        }
        likeButton.layer.borderWidth = 0.5
        likeButton.layer.borderColor = UIColor.grayColor().CGColor
        likeButton.layer.cornerRadius = 33
        likeButton.clipsToBounds = true
        likeButton.setImage(UIImage(named: "LikeIcon"), forState: .Normal)
        likeButton.setImage(UIImage(named: "LikePressedIcon"), forState: .Highlighted)
        likeButton.addTarget(self, action: #selector(onLikeButtonTapped), forControlEvents: .TouchUpInside)

        skipButton = UIButton(type: .Custom)
        actionsView.addSubview(skipButton)
        skipButton.snp_makeConstraints { (make) in
            make.centerX.equalTo(actionsView).offset(-quarterWidth)
            make.centerY.equalTo(actionsView)
            make.height.width.equalTo(66)
        }
        skipButton.layer.borderWidth = 0.5
        skipButton.layer.borderColor = UIColor.grayColor().CGColor
        skipButton.layer.cornerRadius = 33
        skipButton.clipsToBounds = true
        skipButton.setImage(UIImage(named: "SkipIcon"), forState: .Normal)
        skipButton.setImage(UIImage(named: "SkipPressedIcon"), forState: .Highlighted)
        skipButton.addTarget(self, action: #selector(onSkipButtonTapped), forControlEvents: .TouchUpInside)
    }

    func onLikeButtonTapped() {
        kolodaView?.swipe(SwipeResultDirection.Right)
    }

    func onSkipButtonTapped() {
        kolodaView?.swipe(SwipeResultDirection.Left)
    }
}

extension HomeVC: KolodaViewDelegate {
    func kolodaDidRunOutOfCards(koloda: KolodaView) {
    }

    func koloda(koloda: KolodaView, didSelectCardAtIndex index: UInt) {

    }
}

extension HomeVC: KolodaViewDataSource {

    func kolodaNumberOfCards(koloda:KolodaView) -> UInt {
        return 10
    }

    func koloda(koloda: KolodaView, viewForCardAtIndex index: UInt) -> UIView {
        let v = HomeCell()
        v.setData()
        return v
    }

    func koloda(koloda: KolodaView, viewForCardOverlayAtIndex index: UInt) -> OverlayView? {
        let v = HomeOverlayView()
        return v
    }
}
