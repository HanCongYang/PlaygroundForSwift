//
//  RxAmbViewController.swift
//  PlaygroundForSwift
//
//  Created by 李爱红 on 2018/12/19.
//  Copyright © 2018年 LAH. All rights reserved.
//

import UIKit
import RxSwift

class RxAmbViewController: RxRootViewController {
    
    /*
     在多个源 Observables 中， 取第一个发出元素或产生事件的 Observable，然后只发出它的元素
     */
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        introduceImageViewA.image = UIImage.init(named: "amb")
        
        let a = Observable<String>.just("one")
        let b = Observable<String>.just("two")
        let c = Observable<String>.just("three")
        
        Observable<String>.amb([a, b, c])
            .subscribe { event in
            switch event {
            case .next(let element):
                print("element:", element)
            case .error(let error):
                print("error:", error)
            case .completed:
                print("completed")
            }}
            .disposed(by: disposeBag)
    }
    
   
}
