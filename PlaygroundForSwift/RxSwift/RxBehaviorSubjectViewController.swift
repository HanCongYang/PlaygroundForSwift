//
//  RxBehaviorSubjectViewController.swift
//  PlaygroundForSwift
//
//  Created by 李爱红 on 2018/12/19.
//  Copyright © 2018年 LAH. All rights reserved.
//

import UIKit
import RxSwift

class RxBehaviorSubjectViewController: RxRootViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        introduceImageViewA.image = UIImage.init(named: "BehaviorSubjectA")
        explainLabelA.text = "当观察者对 BehaviorSubject 进行订阅时，它会将源 Observable 中最新的元素发送出来（如果不存在最新的元素，就发出默认元素）。然后将随后产生的元素发送出来。"
        introduceImageViewB.image = UIImage.init(named: "BehaviorSubjectB")
        explainLabelB.text = "如果源 Observable 因为产生了一个 error 事件而中止， BehaviorSubject 就不会发出任何元素，而是将这个 error 事件发送出来。"

        stack.addArrangedSubview(introduceImageViewA)
        stack.addArrangedSubview(explainLabelA)
        stack.addArrangedSubview(introduceImageViewB)
        stack.addArrangedSubview(explainLabelB)

        let disposeBag = DisposeBag()
        let subject = BehaviorSubject(value: "🔴")
        
        subject
            .subscribe { print("Subscription: 1 Event:", $0) }
            .disposed(by: disposeBag)
        
        subject.onNext("🐶")
        subject.onNext("🐱")
        
        subject
            .subscribe { print("Subscription: 2 Event:", $0) }
            .disposed(by: disposeBag)
        
        subject.onNext("🅰️")
        subject.onNext("🅱️")
        
        subject
            .subscribe { print("Subscription: 3 Event:", $0) }
            .disposed(by: disposeBag)
        
        subject.onNext("🍐")
        subject.onNext("🍊")
        
    }

}
