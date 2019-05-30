//
//  SwiftStringIndexViewController.swift
//  PlaygroundForSwift
//
//  Created by 李爱红 on 2019/5/29.
//  Copyright © 2019 LAH. All rights reserved.
//

import UIKit

class SwiftStringIndexViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // https://stackoverflow.com/questions/39676939/how-does-string-index-work-in-swift/39676940#39676940

        var string = "Hello World"
        print(string[string.startIndex])
        // print(string[string.endIndex])//  String index is out of bounds
        var range = string.startIndex..<string.endIndex
        print(string[range])
        
        /*
         With Swift 4's one-sided ranges, the range can be simplified to one of the following forms.
         let range = str.startIndex...
         let range = ..<str.endIndex
         I will use the full form in the follow examples for the sake of clarity, but for the sake of readability, you will probably want to use the one-sided ranges in your code.
         */

        // index
        // character
        let index = string.index(before: string.endIndex)
        print(string[index]) // d
        
        // range
        range = string.startIndex..<string.index(before: string.endIndex)
        print(string[range]) // Hello, playgroun
    }

}
