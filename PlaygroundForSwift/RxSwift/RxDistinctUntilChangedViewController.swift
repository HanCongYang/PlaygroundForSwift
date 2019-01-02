//
//  RxDistinctUntilChangedViewController.swift
//  PlaygroundForSwift
//
//  Created by 李爱红 on 2018/12/29.
//  Copyright © 2018年 LAH. All rights reserved.
//

import UIKit
import RxSwift

struct TestStruct {
    var title = "";
    
    static func == (pre: TestStruct, cur: TestStruct) -> Bool {
        return pre.title == cur.title
    }
}

class TestModel: NSObject {
    var title = "";
}

class RxDistinctUntilChangedViewController: RxRootViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        Observable<TestStruct>.create { (subscriber) -> Disposable in
            
            var struct1 = TestStruct()
            subscriber.onNext(struct1)
            struct1.title = "11111"
            subscriber.onNext(struct1)

            return Disposables.create()
            } .distinctUntilChanged({ (pre, next) -> Bool in
                return (pre == next)
            }).subscribe { (element) in
                print(element)
        }.disposed(by: self.disposeBag)
        
        Observable<TestModel>.create { (subscriber) -> Disposable in
            
            let model = TestModel()
            subscriber.onNext(model)
            model.title = "11111"
            subscriber.onNext(model)
            
            return Disposables.create()
            } .subscribe { (element) in
                print(element)
        }.disposed(by: self.disposeBag)
        
//        Observable.of("🐱", "🐷", "🐱", "🐱", "🐱", "🐵", "🐱")
//            .distinctUntilChanged()
//            .subscribe(onNext: { print($0) })
//            .disposed(by: self.disposeBag)
    }

}
