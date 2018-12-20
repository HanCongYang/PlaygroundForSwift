//
//  RxConcatViewController.swift
//  PlaygroundForSwift
//
//  Created by 李爱红 on 2018/12/19.
//  Copyright © 2018年 LAH. All rights reserved.
//

import UIKit
import RxSwift

class RxConcatViewController: RxRootViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        introduceImageViewA.image = UIImage.init(named: "concat")

        let disposeBag = DisposeBag()
        
        let subject1 = BehaviorSubject(value: "🍎")
        let subject2 = BehaviorSubject(value: "🐶")
        
        let variable = Variable(subject1)
        
        variable.asObservable()
            .concat()
            .subscribe { print($0) }
            .disposed(by: disposeBag)
        
        subject1.onNext("🍐")
        subject1.onNext("🍊")
        
        variable.value = subject2
        
        subject2.onNext("I would be ignored")
        subject2.onNext("🐱")
        
        subject1.onCompleted()
        
        subject2.onNext("🐭")
    }

}
