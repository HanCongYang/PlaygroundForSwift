//
//  StringsAndCharactersViewController.swift
//  PlaygroundForSwift
//
//  Created by 李爱红 on 2018/10/17.
//  Copyright © 2018年 LAH. All rights reserved.
//

import UIKit

class StringsAndCharactersViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let greeting = "Guten Tag!"
        greeting[greeting.startIndex]
        // G
        greeting[greeting.index(before: greeting.endIndex)]
        // !
        greeting[greeting.index(after: greeting.startIndex)]
        // u
        let index = greeting.index(greeting.startIndex, offsetBy: 7)
        greeting[index]
        // a

    }


    func comparingStrings(_ s1 : String, _s2 : String) -> Bool {
        return false
    }
}
