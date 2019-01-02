//
//  RxControlFlowViewController.swift
//  PlaygroundForSwift
//
//  Created by 李爱红 on 2018/12/29.
//  Copyright © 2018年 LAH. All rights reserved.
//

import UIKit

class RxControlFlowViewController: RxRootViewController {

    override func viewDidLoad() {
        super.viewDidLoad()


        /*
         For-In Loops
         */
        // 字典遍历
        let names = ["Anna", "Alex", "Brian", "Jack"]
        for name in names {
            print("Hello, \(name)!")
        }
    }

}
