//
//  SwiftEscapeViewController.swift
//  ManchurianTiger
//
//  Created by 李爱红 on 2019/6/25.
//  Copyright © 2019 LAH. All rights reserved.
//

import UIKit

class SwiftEscapeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        
        testFunctionWithNonescapingClosure {
            print("非逃逸闭包执行")
        }
        print("viewDidLoad finish")

//        changedMap { (source) in
//            print("逃逸闭包拿到的结果是\(source)")
//        }
//        print("viewDidLoad执行完毕")
    }
    
    func testFunctionWithNonescapingClosure(closure:() -> Void) {
        closure()
    }
    
//    func changedMap(block: @escaping (_ result: Int) ->Swift.Void){
//        DispatchQueue.global().async {
//            print("逃逸闭包异步的走\(Thread.current)")
//            DispatchQueue.main.async {
//                print("逃逸闭包主线程的走\(Thread.current)")
//                block(99)
//            }
//        }
//        print("逃逸闭包结束了")
//    }
    
}
