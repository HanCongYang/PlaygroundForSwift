//
//  WhereViewController.swift
//  PlaygroundForSwift
//
//  Created by 李爱红 on 2018/10/17.
//  Copyright © 2018年 LAH. All rights reserved.
//

import UIKit

class WhereViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let array = ["one", "two", "three"]
        for str in array where str.hasPrefix("o") {
            print(str)
        }
        
        let arrayOption : [String?] = ["one", nil, "two"]
        for str in arrayOption where str != nil {
            print(str!)
        }
        
        
    }
}
