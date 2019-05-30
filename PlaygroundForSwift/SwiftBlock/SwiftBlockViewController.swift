//
//  SwiftBlockViewController.swift
//  PlaygroundForSwift
//
//  Created by 李爱红 on 2019/5/29.
//  Copyright © 2019 LAH. All rights reserved.
//

import UIKit

class SwiftBlockViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // swift block 作为变量

        var sumClosure:((Int, Int) -> Int)
        
        // 实现swift block
        sumClosure = { (a: Int, b: Int) -> Int in
            return a + b
        }
        
        print(sumClosure(1, 2))
        
    }

}
