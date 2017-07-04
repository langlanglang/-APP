//
//  PageTitleView.swift
//  斗鱼直播
//
//  Created by YPYKJ on 2017/7/4.
//  Copyright © 2017年 LXY. All rights reserved.
//

import UIKit

// MARK:- 定义常量
private let kScrollLineH : CGFloat = 2
private let kNormalColor : (CGFloat, CGFloat, CGFloat) = (85, 85, 85)
private let kSelectColor : (CGFloat, CGFloat, CGFloat) = (255, 128, 0)

class PageTitleView: UIView {
    
     fileprivate var titles :[String]
       // MARK:-懒加载
    
      fileprivate lazy var titleLabels : [UILabel] = [UILabel]()

       lazy var scrollview :UIScrollView = {
        let scrollview = UIScrollView()
        scrollview.showsHorizontalScrollIndicator = false
        scrollview.scrollsToTop = false
        scrollview.bounces = false
        return scrollview
    }()
    
    fileprivate lazy var scrollLine : UIView = {
        let scrollLine = UIView()
        scrollLine.backgroundColor = UIColor.orange
        return scrollLine
    }()
    
    
    // MARK:-自定义构造函数
     init(frame: CGRect,titles :[String]) {
        self.titles = titles
        super.init(frame: frame)
        // 设置 UI界面
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension PageTitleView{
    fileprivate func setupUI(){
        // 添加 UIscrollview
        addSubview(scrollview)
        scrollview.frame = bounds
        setUpTitleLabels()
        // 设置底线和滚动的滑块
        setupBottomLine()
    }
    
    func setupBottomLine() {
        // 1.添加底线
        let bottomLine = UIView()
        bottomLine.backgroundColor = UIColor.lightGray
        let lineH : CGFloat = 0.5
        bottomLine.frame = CGRect(x: 0, y: frame.height - lineH, width: frame.width, height: lineH)
        addSubview(bottomLine)
        
        // 2.添加scrollLine
        // 2.1.获取第一个Label
        guard let firstLabel = titleLabels.first else { return }
        firstLabel.textColor = UIColor.orange
        // 2.2.设置scrollLine的属性
        scrollview.addSubview(scrollLine)
        scrollLine.frame = CGRect(x: firstLabel.frame.origin.x, y: frame.height - kScrollLineH, width: firstLabel.frame.width, height: kScrollLineH)
    }
    
    fileprivate func setUpTitleLabels(){
        let labelW :CGFloat = frame.width / CGFloat(titles.count)
        let lableH :CGFloat = frame.height - kScrollLineH
        let lableY :CGFloat = 0

        for(index,title) in titles.enumerated(){
            let label = UILabel()
            label.text = title
            label.tag = index
            label.font = UIFont.systemFont(ofSize: 16)
            label.textColor = UIColor.darkGray
            label.textAlignment = .center
            
            // 设置 frame
            let lableX :CGFloat = labelW * CGFloat(index)
            label.frame = CGRect(x: lableX, y: lableY, width: labelW, height: lableH)
            scrollview.addSubview(label)
        }
        
    }
}
