//
//  RxRetryViewController.swift
//  PlaygroundForSwift
//
//  Created by 李爱红 on 2018/12/27.
//  Copyright © 2018年 LAH. All rights reserved.
//

import UIKit
import RxSwift

/*
 retry 操作符将不会将 error 事件，传递给观察者，然而，它会从新订阅源 Observable，给这个 Observable 一个重试的机会，让它有机会不产生 error 事件。retry 总是对观察者发出 next 事件，即便源序列产生了一个 error 事件，所以这样可能会产生重复的元素（如上图所示）。
 */

class RxRetryViewController: RxRootViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        situationOne()

    }
    
    func situationOne() {
        
        let disposeBag = DisposeBag()
        var count = 1
        
        let sequenceThatErrors = Observable<String>.create { observer in
            observer.onNext("🍎")
            observer.onNext("🍐")
            observer.onNext("🍊")
            
            
            if count < 3 {
                observer.onError(NSError(domain: "error", code: 10086, userInfo: nil))
                print("Error encountered")
                count += 1
            }
            
            observer.onNext("🐶")
            observer.onNext("🐱")
            observer.onNext("🐭")
            observer.onCompleted()
            
            return Disposables.create()
        }
        
        sequenceThatErrors
            .retry()
            .subscribe(onNext: { print($0) })
            .disposed(by: disposeBag)
    }
    
    
    func situationTwo() {
        
        let disposeBag = DisposeBag()
        var count = 1
        
        let sequenceThatErrors = Observable<String>.create { observer in
            observer.onNext("🍎")
            observer.onNext("🍐")
            observer.onNext("🍊")
            
            if count < 5 {
                observer.onError(NSError(domain: "error", code: 10086, userInfo: nil))
                print("Error encountered")
                count += 1
            }
            
            observer.onNext("🐶")
            observer.onNext("🐱")
            observer.onNext("🐭")
            observer.onCompleted()
            
            return Disposables.create()
        }
        
        sequenceThatErrors
            .retry(3)
            .subscribe(onNext: { print($0) })
            .disposed(by: disposeBag)
        
    }

}
