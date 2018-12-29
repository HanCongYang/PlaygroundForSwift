//
//  RxFlatMapViewController.swift
//  PlaygroundForSwift
//
//  Created by 李爱红 on 2018/12/28.
//  Copyright © 2018年 LAH. All rights reserved.
//

import UIKit
import RxSwift

class RxFlatMapViewController: RxRootViewController {
    
    /*
     flatMap get value from stream and return an Observable of whatever type.
     
     This means you can use flatMap when:
     */

    override func viewDidLoad() {
        super.viewDidLoad()
        
        /**
         Projects each element of an observable sequence to an observable sequence and merges the resulting observable sequences into one observable sequence.
         
         - seealso: [flatMap operator on reactivex.io](http://reactivex.io/documentation/operators/flatmap.html)
         
         - parameter selector: A transform function to apply to each element.
         - returns: An observable sequence whose elements are the result of invoking the one-to-many transform function on each element of the input sequence.
         */
        
        let flat = Observable.from([1, 2, 3])
            .flatMap { (number) -> Observable<String> in
                
                return self.foo(number)
            }
        
        flat.subscribe { (number) in
             print(number)
        }.disposed(by: self.disposeBag)
        
    }
    
    func foo(_ number: Int) -> Observable<String> {
        
        return Observable.from([String(number * 1), String(number * 2), String(number * 3)])
    }

}
