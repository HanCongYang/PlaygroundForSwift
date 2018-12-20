//
//  RxBufferViewController.swift
//  PlaygroundForSwift
//
//  Created by 李爱红 on 2018/12/19.
//  Copyright © 2018年 LAH. All rights reserved.
//

import UIKit
import RxSwift

/*
 缓存元素，然后将缓存的元素集合，周期性的发出来
 buffer 操作符将缓存 Observable 中发出的新元素，当元素达到某个数量，或者经过了特定的时间，它就会将这个元素集合发送出来。
 */

class RxBufferViewController: RxRootViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        introduceImageViewA.image = UIImage.init(named: "buffer")
        
        let trigger = Observable<String>.create { (subscriber) -> Disposable in
            
            subscriber.onNext("1")
            subscriber.onNext("2")
            subscriber.onNext("3")
//            subscriber.onError(NSError.init(domain: "test", code: 10086, userInfo: nil))

            DispatchQueue.main.asyncAfter(deadline: .now() + 5, execute: {
                subscriber.onNext("4")
                subscriber.onNext("5")
                subscriber.onNext("6")
                subscriber.onNext("7")
                subscriber.onNext("8")
            })

            return Disposables.create()
        }
        
        trigger.buffer(timeSpan: 3, count: 5, scheduler: MainScheduler.instance).subscribe(onNext: { (datas) in
            print(datas)
        }, onError: { (error) in
            print(error)
        }, onCompleted: {
            print("complete")
        }) {
            print("dispose")
        }.disposed(by: disposeBag)
        

    }
}
