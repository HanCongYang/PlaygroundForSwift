//
//  SwiftPromiseDemoViewController.swift
//  ManchurianTiger
//
//  Created by 李爱红 on 2019/6/24.
//  Copyright © 2019 LAH. All rights reserved.
//

import UIKit
import Alamofire
import PromiseKit

class SwiftPromiseDemoViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        
        firstly {
            Promise.value(1)
            }.map { _ in
                2
            }.then { _ in
                promise3()
            }.done {
                print($0)  // => 3
            }.catch { error in

            }.finally {
        }
    }
}



func promise3() -> Promise<Int> {
    return after(.seconds(1)).map{ 3 }
}
