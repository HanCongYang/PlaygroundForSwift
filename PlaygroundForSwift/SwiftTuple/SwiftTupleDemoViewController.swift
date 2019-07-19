//
//  SwiftTupleDemoViewController.swift
//  ManchurianTiger
//
//  Created by 李爱红 on 2019/6/24.
//  Copyright © 2019 LAH. All rights reserved.
//

import UIKit

typealias PersonTuple = (age: Int, isTall: Bool, name: String)

class SwiftTupleDemoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "元组"

        self.view.backgroundColor = UIColor.white
        
        let andyy = getMultipleValues()
        print(andyy.age)    // print: "28"
        print(andyy.isTall) // print: "false"
        print(andyy.name)   // print: "Andyy"
        
    }
    
    func getMultipleValues() -> PersonTuple {
        
        let person: PersonTuple = (age: 28, isTall: false, name: "Andyy")
        return person
    }


}
