//
//  TestView.swift
//  MVVMTest_kvo_noti
//
//  Created by xfg on 2018/4/25.
//  Copyright © 2018年 xfg. All rights reserved.
//  MVVM中的：V

import Foundation
import UIKit

class TestView: UIView {
    
    var testViewModel: TestViewModel!
    
    private lazy var btn: UIButton = {
        
        let btn = UIButton(type: .custom)
        btn.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        btn.setTitle("更换背景色", for: .normal)
        btn.backgroundColor = UIColor.lightGray
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.addTarget(self, action: #selector(btnAction), for: .touchUpInside)
        return btn
    }()
    
    init(viewModel: TestViewModel) {
        super.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        
        self.testViewModel = viewModel
        
        // 添加子视图
        self.setupSubViews()
        
        // 绑定ViewModel
        self.bindingViewModel()
        
        // 模拟请求数据
        self.testViewModel.requestData()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        self.removeObserver(self, forKeyPath: "currentColor")
    }
}

extension TestView {
    
    /// 添加子视图
    func setupSubViews() {
        
        self.addSubview(btn)
    }
    
    /// 绑定ViewModel，这边使用KVO、Notification（RxSwift，KVO，Notification，block，delegate和target-action都可以使用）
    func bindingViewModel() {
        
        // 方法一
        self.testViewModel.addObserver(self, forKeyPath: "currentColor", options: [.new, .old], context: nil)
        
        // 方法二
        //        NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: "kTestViewChangeBgColor"), object: nil, queue: OperationQueue.main) { (notify) in
        //            self.backgroundColor = self.testViewModel.currentColor
        //        }
    }
    
    @objc func btnAction() {
        
        self.testViewModel.requestData()
    }
}

extension TestView {
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        
        if keyPath == "currentColor" {
            self.backgroundColor = self.testViewModel.currentColor
        }
    }
}
