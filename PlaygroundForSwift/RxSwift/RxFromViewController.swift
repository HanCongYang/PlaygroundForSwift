//
//  RxFromViewController.swift
//  PlaygroundForSwift
//
//  Created by 李爱红 on 2018/12/27.
//  Copyright © 2018年 LAH. All rights reserved.
//

import UIKit
import RxSwift

class RxFromViewController: RxRootViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let numbers = Observable.from([0, 1, 2])
        
        numbers.subscribe { (event) in
            print(event)
        }.disposed(by: disposeBag)

        
    }

}
