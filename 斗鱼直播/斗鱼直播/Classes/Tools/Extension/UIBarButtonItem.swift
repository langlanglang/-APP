//
//  UIBarButtonItem.swift
//  斗鱼直播
//
//  Created by YPYKJ on 2017/7/4.
//  Copyright © 2017年 LXY. All rights reserved.
//

import UIKit

extension UIBarButtonItem{
    /*
    // 类方法
     class func createItem(imageName : String, highImageName : String, size : CGSize) -> UIBarButtonItem {
        
     let btn = UIButton()
     btn.setImage(UIImage(named: imageName), for: .normal)
     btn.setImage(UIImage(named: highImageName), for: .highlighted)
     btn.frame = CGRect(origin: CGPoint.zero, size: size)
     return UIBarButtonItem(customView: btn)
        
     }
     */
    
    // 便利构造函数: 1> convenience开头 2> 在构造函数中必须明确调用一个设计的构造函数(self)
    convenience init(imageName : String, highImageName : String = "", size : CGSize = CGSize.zero)  {
        // 1.创建UIButton
        let btn = UIButton()
        
        // 2.设置btn的图片
        btn.setImage(UIImage(named: imageName), for: UIControlState())
        if highImageName != "" {
            btn.setImage(UIImage(named: highImageName), for: .highlighted)
        }
        
        // 3.设置btn的尺寸
        if size == CGSize.zero {
            btn.sizeToFit()
        } else {
            btn.frame = CGRect(origin: CGPoint.zero, size: size)
        }
        
        // 4.创建UIBarButtonItem
        self.init(customView : btn)
    }
    
    
    
    
}
