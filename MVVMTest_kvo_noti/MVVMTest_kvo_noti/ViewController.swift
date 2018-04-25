//
//  ViewController.swift
//  MVVMTest_kvo_noti
//
//  Created by xfg on 2018/4/25.
//  Copyright © 2018年 xfg. All rights reserved.
//  MVVM中的：V

import UIKit

class ViewController: UIViewController {
    
    private lazy var testView: TestView = {
        
        let testView = TestView(viewModel: self.testViewModel)
        testView.frame = self.view.bounds
        return testView
    }()
    
    private lazy var testViewModel: TestViewModel = {
        
        let testViewModel = TestViewModel()
        return testViewModel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(self.testView)
    }
}

