//
//  RxSwiftObservableViewController.swift
//  PlaygroundForSwift
//
//  Created by 李爱红 on 2018/12/3.
//  Copyright © 2018年 LAH. All rights reserved.
//

import UIKit
import RxSwift

class RxSwiftObservableViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let observable = Observable.of("A", "B", "C")
        
        observable.do(onNext: { element in
                print("Intercepted Next：", element)
            }, onError: { error in
                print("Intercepted Error：", error)
            }, onCompleted: {
                print("Intercepted Completed")
            }, onDispose: {
                print("Intercepted Disposed")
            })
            .subscribe(onNext: { element in
                print(element)
            }, onError: { error in
                print(error)
            }, onCompleted: {
                print("completed")
            }, onDisposed: {
                print("disposed")
            })
        
    }

}
