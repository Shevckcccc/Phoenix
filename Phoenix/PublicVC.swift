//
//  PublicVC.swift
//  Phoenix
//
//  Created by YuYongkai on 16/8/20.
//  Copyright © 2016年 Shevckcccc. All rights reserved.
//

import UIKit

class PublicVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "NavMenuIcon"), style: .Plain, target: self, action: #selector(onToggleMenuVC))
    }

    func onToggleMenuVC() {
        self.evo_drawerController?.toggleDrawerSide(.Left, animated: true, completion: nil)
    }
}
