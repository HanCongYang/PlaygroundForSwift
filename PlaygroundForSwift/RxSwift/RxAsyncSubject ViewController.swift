//
//  RxAsyncSubject ViewController.swift
//  PlaygroundForSwift
//
//  Created by 李爱红 on 2018/12/19.
//  Copyright © 2018年 LAH. All rights reserved.
//

import UIKit
import RxSwift

class RxAsyncSubject_ViewController: RxRootViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        introduceImageViewA.image = UIImage.init(named: "BehaviorSubjectA")
        explainLabelA.text = "AsyncSubject 将在源 Observable 产生完成事件后，发出最后一个元素（仅仅只有最后一个元素），如果源 Observable 没有发出任何元素，只有一个完成事件。那 AsyncSubject 也只有一个完成事件。"
        introduceImageViewB.image = UIImage.init(named: "BehaviorSubjectB")
        explainLabelB.text = "它会对随后的观察者发出最终元素。如果源 Observable 因为产生了一个 error 事件而中止， AsyncSubject 就不会发出任何元素，而是将这个 error 事件发送出来。"
        
        let disposeBag = DisposeBag()
        let subject = AsyncSubject<String>()
        
        subject
            .subscribe { print("Subscription: 1 Event:", $0) }
            .disposed(by: disposeBag)
        
        subject.onNext("🐶")
        subject.onNext("🐱")
        subject.onNext("🐹")
        subject.onCompleted()
    }

}
