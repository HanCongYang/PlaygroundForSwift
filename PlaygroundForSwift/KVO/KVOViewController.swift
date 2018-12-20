//
//  KVOViewController.swift
//  PlaygroundForSwift
//
//  Created by 李爱红 on 2018/12/11.
//  Copyright © 2018年 LAH. All rights reserved.
//

import UIKit

class KVOModel: NSObject {
    
    var string : String = ""
}

class KVOViewController: UIViewController {
    
    var model : KVOModel?
    var text : String?
    
    var observation: NSKeyValueObservation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        
        model = KVOModel()

        model?.addObserver(self, forKeyPath: "string", options: [.new, .old], context: nil)
        
        model?.string = "1111"
        model?.string = "2222"
        model?.string = "3333"

    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        
        if let obj = object, let newValue = change {
            print(obj, newValue)
        }
        
    }
    

}
