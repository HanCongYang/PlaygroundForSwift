//
//  RxDoViewController.swift
//  PlaygroundForSwift
//
//  Created by 李爱红 on 2018/12/29.
//  Copyright © 2018年 LAH. All rights reserved.
//

import UIKit
import RxSwift

class RxDoViewController: RxRootViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        Observable.from(["1", "2", "3", "4", "5", "6"]).do(onNext: { (string) in
            print("onNext" + string)
        }, onError: { (error) in
            
        }, onCompleted: {
            print("onCompleted")
        }, onSubscribe: {
            print("onSubscribe")
        }, onSubscribed: {
            print("onSubscribed")
        }) {
            
            }.subscribe { (event) in
                print(event)
        }.disposed(by: self.disposeBag)

        
        
    }

}
