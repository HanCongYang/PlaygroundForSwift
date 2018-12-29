//
//  RxSwiftNetworkViewController.swift
//  PlaygroundForSwift
//
//  Created by 李爱红 on 2018/12/21.
//  Copyright © 2018年 LAH. All rights reserved.
//

import UIKit
import Moya
import RxSwift
import ObjectMapper
import Moya_ObjectMapper

class RxSwiftNetworkViewController: RxRootViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let provider = MoyaProvider<MyService>()
        
        provider.rx.request(.zen).mapObject(PostResponse.self).flatMap { (response) -> PrimitiveSequence<SingleTrait, PostResponse> in
            
                return provider.rx.request(.zen).mapObject(PostResponse.self)
            
            }.catchError({ (error) -> PrimitiveSequence<SingleTrait, PostResponse> in
                
                return provider.rx.request(.zen).mapObject(PostResponse.self)
                
            }).subscribe { (response) in
                
                print(response)
            }.disposed(by: self.disposeBag)
        
        let provider2 = MoyaProvider<MyService>()
        provider2.rx.request(.zen).mapObject(PostResponse.self).subscribe(onSuccess: { (response) in
            
        }) { (error) in
            
        }.disposed(by: self.disposeBag)
        
        
    }
    
}



class PostResponse: Mappable {
    
    var requestURL : String?
    
    required init?(map: Map){
        
        
    }
    
    func mapping(map: Map) {
        requestURL <- map["url"]
    }
}
