//
//  RxShareReplayViewController.swift
//  PlaygroundForSwift
//
//  Created by 李爱红 on 2018/12/29.
//  Copyright © 2018年 LAH. All rights reserved.
//

import UIKit
import RxSwift

class RxShareReplayViewController: RxRootViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let numberObservable = Observable.from(["1", "2", "3", "4", "5", "6"]).share(replay: 3, scope: SubjectLifetimeScope.forever)
        introduceImageViewA.image = UIImage.init(named: "shareReplay")

        numberObservable.subscribe(onNext: { (string) in
            print("subscribe1" + string)
        }, onError: { (error) in
            print(error)
        }, onCompleted: {
            
        }) {
            
            }.disposed(by: self.disposeBag)
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            
            numberObservable.subscribe(onNext: { (string) in
                print("subscribe2" + string)
            }, onError: { (error) in
                print(error)
            }, onCompleted: {
                
            }) {
                
                }.disposed(by: self.disposeBag)
        }
        
        
        
    }
    
}
