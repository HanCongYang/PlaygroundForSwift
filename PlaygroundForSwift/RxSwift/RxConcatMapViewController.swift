//
//  RxConcatMapViewController.swift
//  PlaygroundForSwift
//
//  Created by 李爱红 on 2018/12/26.
//  Copyright © 2018年 LAH. All rights reserved.
//

import UIKit
import RxSwift

class RxConcatMapViewController: RxRootViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        explainLabelA.text = "将 Observable 的元素转换成其他的 Observable，然后将这些 Observables 串连起来"
        introduceImageViewA.image = UIImage.init(named: "concatMap")
        explainLabelB.text = "concatMap 操作符将源 Observable 的每一个元素应用一个转换方法，将他们转换成 Observables。然后让这些 Observables 按顺序的发出元素，当前一个 Observable 元素发送完毕后，后一个 Observable 才可以开始发出元素。等待前一个 Observable 产生完成事件后，才对后一个 Observable 进行订阅。"
        
        stack.addArrangedSubview(explainLabelA)
        stack.addArrangedSubview(introduceImageViewA)
        stack.addArrangedSubview(explainLabelB)
        
        
        let outerObservable = Observable<NSInteger>
            .interval(0.5, scheduler: MainScheduler.instance)
            .take(2)
        
        let combinedObservable = outerObservable.concatMap { value in
            return Observable<NSInteger>
                .interval(0.3, scheduler: MainScheduler.instance)
                .take(3)
                .map { innerValue in
                    print("Outer Value \(value) Inner Value \(innerValue)")
            }
        }
        
        combinedObservable
            .subscribe()
            .disposed(by: disposeBag)
        
//        let disposeBag = DisposeBag()
//
//        let subject1 = BehaviorSubject(value: "🍎")
//        let subject2 = BehaviorSubject(value: "🐶")
//
//        let variable = Variable(subject1)
//
//        variable.asObservable()
//            .concatMap { $0 }
//            .subscribe { print($0) }
//            .disposed(by: disposeBag)
//
//        subject1.onNext("🍐")
//        subject1.onNext("🍊")
//
//        variable.value = subject2
//
//        subject2.onNext("I would be ignored")
//        subject2.onNext("🐱")
//
//        subject1.onCompleted()
//
//        subject2.onNext("🐭")
    }

}
