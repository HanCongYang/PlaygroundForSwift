//
//  ClassViewController.swift
//  PlaygroundForSwift
//
//  Created by 李爱红 on 2018/10/30.
//  Copyright © 2018年 LAH. All rights reserved.
//

import UIKit

class ClassViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
}

final class Train : NSObject {
    public var name : String
    public let price : String
    init(_ name : String) {
        self.name = name
        self.price = "10"
    }
}


