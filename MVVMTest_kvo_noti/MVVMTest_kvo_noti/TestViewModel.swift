//
//  TestViewModel.swift
//  MVVMTest_kvo_noti
//
//  Created by xfg on 2018/4/25.
//  Copyright © 2018年 xfg. All rights reserved.
//  MVVM中的：VM

import Foundation
import UIKit

class TestViewModel: NSObject {
    
    var testModel: TestModel!
    @objc dynamic var currentColor: UIColor?
    
    override init() {
        super.init()
        
        self.testModel = TestModel()
        self.testModel.addObserver(self, forKeyPath: "color", options: [.old, .new], context: nil)
    }
    
    
    /// 模拟网络请求操作
    public func requestData() {
        
        self.testModel.requestData()
    }
    
    deinit {
        self.removeObserver(self, forKeyPath: "color")
    }
}

extension TestViewModel {
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        
        if keyPath == "color" {
            // 方法一
            currentColor = testModel.color
            
            // 方法二
            //            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "kTestViewChangeBgColor"), object: nil, userInfo: nil)
        }
    }
}
