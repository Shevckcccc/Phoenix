//
//  HomeOverlayView.swift
//  Phoenix
//
//  Created by YuYongkai on 16/8/21.
//  Copyright © 2016年 Shevckcccc. All rights reserved.
//

import UIKit
import Koloda

private let overlayRightImageName = "OverlayLikeIcon"
private let overlayLeftImageName = "OverlaySkipIcon"


class HomeOverlayView: OverlayView {

    lazy var overlayImageView: UIImageView! = {
        [unowned self] in

        var imageView = UIImageView(frame: self.bounds)
        self.addSubview(imageView)

        return imageView
        }()

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override var overlayState: SwipeResultDirection?  {
        didSet {
            switch overlayState {
            case .Left? :
                overlayImageView.image = UIImage(named: overlayLeftImageName)
            case .Right? :
                overlayImageView.image = UIImage(named: overlayRightImageName)
            default:
                overlayImageView.image = nil
            }

        }
    }
}
