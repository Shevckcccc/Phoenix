//
//  AppDelegate.swift
//  LifeSpecial
//
//  Created by YuYongkai on 16/8/19.
//  Copyright © 2016年 Shevckcccc. All rights reserved.
//

import UIKit
import DrawerController
import LeanCloud

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        configRootVC(application)
        configUI()
        return true
    }

    // 初始化入口VC
    private func configRootVC(application: UIApplication) {
        let leftVC = MenuVC()
        let centerVC = UINavigationController(rootViewController: HomeVC())
        let rightVC = UINavigationController(rootViewController: ChatListVC())

        let rootViewController = DrawerController(centerViewController: centerVC, leftDrawerViewController: leftVC, rightDrawerViewController: rightVC)
        rootViewController.setMaximumLeftDrawerWidth(300, animated: true, completion: nil)
        rootViewController.setMaximumRightDrawerWidth(300, animated: true, completion: nil)
        rootViewController.openDrawerGestureModeMask = .BezelPanningCenterView
        rootViewController.closeDrawerGestureModeMask = .TapCenterView

        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        window?.rootViewController = rootViewController
        window?.makeKeyAndVisible()
    }

    private func configUI() {
        UIApplication.sharedApplication().statusBarStyle = .LightContent

        UINavigationBar.appearance().barTintColor = UIColor.primaryColor()
        UINavigationBar.appearance().tintColor = UIColor.whiteColor()
        UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName : UIColor.whiteColor()]
    }

    private func configLeanCloud() {
         // TODO: 填上你自己的key
         LeanCloud.initialize(applicationID: "", applicationKey: "")
    }

}

