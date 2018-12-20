//
//  RxBehaviorRelayViewController.swift
//  PlaygroundForSwift
//
//  Created by 李爱红 on 2018/12/19.
//  Copyright © 2018年 LAH. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class BehaviorRelayTestModel: NSObject {
    var _title : String = ""
    
    init(title : String) {
        _title = title
    }
}

class RxBehaviorRelayViewController: RxRootViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let disposeBag = DisposeBag()
        
        let model = BehaviorRelay<BehaviorRelayTestModel>(value: BehaviorRelayTestModel(title: "11111"))
        model.accept(BehaviorRelayTestModel(title: "222222"))
        model.accept(BehaviorRelayTestModel(title: "333333"))

        model.asObservable().subscribe(onNext: { (model) in
            print("第1次订阅：",model._title)
        }).disposed(by: disposeBag)
        
        model.accept(BehaviorRelayTestModel(title: "444444"))
        model.accept(BehaviorRelayTestModel(title: "555555"))

        model.asObservable().subscribe(onNext: { (model) in
            print("第2次订阅：",model._title)
        }).disposed(by: disposeBag)
        
        //创建一个初始值为111的BehaviorRelay
        
        let subject = BehaviorRelay<String>(value: "111")
        
        //修改value值
        subject.accept("222")
        
        //第1次订阅
        subject.asObservable().subscribe {
            print("第1次订阅：", $0)
            }.disposed(by: disposeBag)
        
        //修改value值
        subject.accept("333")
        
        //第2次订阅
        subject.asObservable().subscribe {
            print("第2次订阅：", $0)
            }.disposed(by: disposeBag)
        
        //修改value值
        subject.accept("444")
        
    }
    
    func test() {
        
        let disposeBag = DisposeBag()
        
        //创建一个初始值为包含一个元素的数组的BehaviorRelay
        let subject = BehaviorRelay<[String]>(value: ["1"])
        
        //修改value值
        subject.accept(subject.value + ["2", "3"])
        
        //第1次订阅
        subject.asObservable().subscribe {
            print("第1次订阅：", $0)
            }.disposed(by: disposeBag)
        
        //修改value值
        subject.accept(subject.value + ["4", "5"])
        
        //第2次订阅
        subject.asObservable().subscribe {
            print("第2次订阅：", $0)
            }.disposed(by: disposeBag)
        
        //修改value值
        subject.accept(subject.value + ["6", "7"])
    }
    
}
