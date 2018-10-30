//
//  ViewController.swift
//  PlaygroundForSwift
//
//  Created by 李爱红 on 2018/10/17.
//  Copyright © 2018年 LAH. All rights reserved.
//

import UIKit

//extension String {
//
//
//    func isNotEmpty() -> Bool {
//        return !self.isEmpty
//    }
//}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // defer 推迟
        defer {
            print("view did load finished")
        }
//        print("say something".isNotEmpty())
        userPassword = "123456abc"
        print(userPassword)
        
        guard userPassword.count > 0 else {
            return
        }
        
    }
    
    var _userPassword : String = ""
    var userPassword : String {
        get { return _userPassword }
        set { _userPassword = newValue }
    }



}

