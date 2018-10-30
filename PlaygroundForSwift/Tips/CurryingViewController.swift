//
//  CurryingViewController.swift
//  PlaygroundForSwift
//
//  Created by 李爱红 on 2018/10/26.
//  Copyright © 2018年 LAH. All rights reserved.
//

import UIKit

class CurryingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let addToFour = addTwoNumbers(a: 4)
        let result = addToFour(5)
        print(result)
        
        
    }
    
    func addTwoNumbers(a : Int) -> (Int) -> Int {
        return {
            (b : Int) -> Int in
            return a + b
        }
    }

}
