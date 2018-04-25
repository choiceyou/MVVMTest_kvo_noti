//
//  TestModel.swift
//  MVVMTest_kvo_noti
//
//  Created by xfg on 2018/4/25.
//  Copyright © 2018年 xfg. All rights reserved.
//  MVVM中的：M

import Foundation
import UIKit

class TestModel: NSObject {
    
    var colorName: String?
    @objc dynamic var color: UIColor?
    
    /// 模拟Model的更新
    func requestData() {
        
        let red = CGFloat(arc4random()%256)/255.0
        let green = CGFloat(arc4random()%256)/255.0
        let blue = CGFloat(arc4random()%256)/255.0
        
        self.colorName = String(describing: red)
        self.color = UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }
}
