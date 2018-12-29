//
//  RxTakeFamilyViewController.swift
//  PlaygroundForSwift
//
//  Created by 李爱红 on 2018/12/27.
//  Copyright © 2018年 LAH. All rights reserved.
//

import UIKit
import RxSwift

class RxTakeFamilyViewController: RxRootViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        take()
        takeLast()
        takeUntil()
        takeWhile()

    }

    func take() {
        Observable.of("🐱", "🐰", "🐶", "🐸", "🐷", "🐵")
            .take(3)
            .subscribe(onNext: { print($0) })
            .disposed(by: disposeBag)
    }
    
    func takeLast() {
        Observable.of("🐱", "🐰", "🐶", "🐸", "🐷", "🐵")
            .takeLast(3)
            .subscribe(onNext: { print($0) })
            .disposed(by: disposeBag)
    }
    
    func takeUntil() {
        
        /*
         takeUntil 操作符将镜像源 Observable，它同时观测第二个 Observable。一旦第二个 Observable 发出一个元素或者产生一个终止事件，那个镜像的 Observable 将立即终止。
         */
        
        let sourceSequence = PublishSubject<String>()
        let referenceSequence = PublishSubject<String>()
        
        sourceSequence
            .takeUntil(referenceSequence)
            .subscribe { print($0) }
            .disposed(by: disposeBag)
        
        sourceSequence.onNext("🐱")
        sourceSequence.onNext("🐰")
        sourceSequence.onNext("🐶")
        
        referenceSequence.onNext("🔴")
        
        sourceSequence.onNext("🐸")
        sourceSequence.onNext("🐷")
        sourceSequence.onNext("🐵")
    }
    
    func takeWhile() {
        
        /*
         takeWhile 操作符将镜像源 Observable 直到某个元素的判定为 false。此时，这个镜像的 Observable 将立即终止。
         */
        
        Observable.of(1, 2, 3, 4, 3, 2, 1)
            .takeWhile { $0 < 4 }
            .subscribe(onNext: { print($0) })
            .disposed(by: disposeBag)
    }

}
