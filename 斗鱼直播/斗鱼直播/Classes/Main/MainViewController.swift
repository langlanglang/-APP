//
//  MainViewController.swift
//  斗鱼直播
//
//  Created by YPYKJ on 2017/7/3.
//  Copyright © 2017年 LXY. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        addChildrenVc(sbName: "Home");
        addChildrenVc(sbName: "Live");
        addChildrenVc(sbName: "Follow");
        addChildrenVc(sbName: "Profile");
    }

    private func addChildrenVc(sbName:String){
        let childVc = UIStoryboard(name: sbName, bundle: nil).instantiateInitialViewController()!
        
        addChildViewController(childVc)
        
    }

}
