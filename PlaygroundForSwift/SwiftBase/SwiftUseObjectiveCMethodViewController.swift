//
//  SwiftUseObjectiveCMethodViewController.swift
//  ManchurianTiger
//
//  Created by 李爱红 on 2019/6/25.
//  Copyright © 2019 LAH. All rights reserved.
//

import UIKit

// swift版本的mark
// MARK: -  Section management
class SwiftUseObjectiveCMethodViewController: UIViewController {
    
    // 懒加载
    fileprivate lazy var longPressRecognizer: UILongPressGestureRecognizer = {
        return UILongPressGestureRecognizer(target: self, action: #selector(longPress))
    }()
    
    @objc fileprivate func longPress(_ longPressGestureRecognizer: UILongPressGestureRecognizer) {
        
        // 防止重复
        guard longPressGestureRecognizer.state == .began else { return }
        
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
    }
    

}
