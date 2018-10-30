//
//  ProtocolsViewController.swift
//  PlaygroundForSwift
//
//  Created by 李爱红 on 2018/10/17.
//  Copyright © 2018年 LAH. All rights reserved.
//

import UIKit

protocol FullyNamed {
    var fullName: String { get }
}

struct Person: FullyNamed {
    var fullName: String
}

protocol Vehicle
{
    var numberOfWheels : Int {get}
    var color : UIColor {get set}
    
    mutating func changeColor()
}

struct MyCar : Vehicle {
    let numberOfWheels = 4
    var color = UIColor.blue
    
    // mutating关键字修饰方法是为了能在方法中修改struct或enum变量
    // class不需要
    mutating func changeColor() {
        color = UIColor.red
    }
}


class ProtocolsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let john = Person(fullName: "John Appleseed")

    }


    /*
     Property Requirements
     */


}
