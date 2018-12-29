//
//  RxConnectViewController.swift
//  PlaygroundForSwift
//
//  Created by 李爱红 on 2018/12/26.
//  Copyright © 2018年 LAH. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class RxConnectViewController: RxRootViewController {


    override func viewDidLoad() {
        super.viewDidLoad()
        
        var disposeBag : DisposeBag? = DisposeBag()
        
        

        let intSequence = Observable<Int>.interval(1, scheduler: MainScheduler.instance)
            .publish()
        
        _ = intSequence
            .subscribe(onNext: { print("Subscription 1:, Event: \($0)") }).disposed(by: disposeBag!)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            _ = intSequence.connect().disposed(by: disposeBag!)
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
            _ = intSequence
                .subscribe(onNext: { print("Subscription 2:, Event: \($0)") }).disposed(by: disposeBag!)
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 6) {
            _ = intSequence
                .subscribe(onNext: { print("Subscription 3:, Event: \($0)") }).disposed(by: disposeBag!)
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
            disposeBag = nil
        }


    }

}
