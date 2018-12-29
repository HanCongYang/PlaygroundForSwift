//
//  GuideStructAndClassViewController.swift
//  PlaygroundForSwift
//
//  Created by 李爱红 on 2018/12/28.
//  Copyright © 2018年 LAH. All rights reserved.
//

import UIKit

struct Resolution {
    var width = 0
    var height = 0
}
class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}

class GuideStructAndClassViewController: SwiftGuideRootViewController {
    
    func incrementor(ptr: UnsafeMutablePointer<Int>) {
        ptr.pointee += 1
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var vga = Resolution(width: 200, height: 200)

    }
    



}
