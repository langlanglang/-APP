//
//  HomeViewController.swift
//  斗鱼直播
//
//  Created by YPYKJ on 2017/7/4.
//  Copyright © 2017年 LXY. All rights reserved.
//

import UIKit

private let KtitleViewH :CGFloat = 40
class HomeViewController: UIViewController {
    
    // MARK:- 懒加载属性
        lazy var pageTitleView:PageTitleView = {
        let titleFrame = CGRect(x: 0, y: kStateBarH + kNavgationBarH, width: kScreenW, height: KtitleViewH)
        let titles = ["推荐","游戏","娱乐","趣玩"]
        let titleView = PageTitleView(frame: titleFrame, titles: titles)
        return titleView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI();
    }

}

// MARK:- 设置 UI 界面
extension HomeViewController{
    
     func setupUI(){
        // 0.不需要调整UIScrollView的内边距
        automaticallyAdjustsScrollViewInsets = false
        // 1。设置导航栏
        setNavBar();
        // 2.添加 titleView
        view.addSubview(pageTitleView)
        
    }
    
    private func setNavBar(){

        navigationItem.leftBarButtonItem = UIBarButtonItem(imageName: "logo")
        
        // 设置右侧 item
        let size = CGSize(width: 30, height: 30)
        let historyItem = UIBarButtonItem(imageName: "image_my_history", highImageName: "Image_my_history_click", size: size)
        let searchItem = UIBarButtonItem(imageName: "btn_search", highImageName: "btn_search_clicked", size: size)
        let qrcodeItem = UIBarButtonItem(imageName: "Image_scan", highImageName: "Image_scan_click", size: size)
        
        navigationItem.rightBarButtonItems = [historyItem,searchItem,qrcodeItem]
    }
    
}
