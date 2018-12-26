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
        
        
        provider.rx.request(.zen).mapObject(PostResponse.self).subscribe { event in
            switch event {
            case let .success(response):
                print("hengheng" + response.requestURL!)
            case let .error(error):
                print(error)
            }
        }.disposed(by: disposeBag)


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
