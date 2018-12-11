//
//  EnumViewController.swift
//  PlaygroundForSwift
//
//  Created by 李爱红 on 2018/11/23.
//  Copyright © 2018年 LAH. All rights reserved.
//

import UIKit

enum Movement {
    case left
    case right
    case top
    case bottom
}

enum Area {
    enum DongGuan {
        case NanCheng
        case DongCheng
    }
    
    enum GuangZhou {
        case TianHe
        case CheBei
    }
}

enum Trade {
    case Buy(stock:String,amount:Int)
    case Sell(stock:String,amount:Int)
}

enum Device {
    case iPad, iPhone, AppleTV, AppleWatch
    func introduced() -> String {
        
        switch self {
        case .iPad: return "iPad"
        case .iPhone: return "iPhone"
        case .AppleWatch: return "AppleWatch"
        case .AppleTV: return "AppleTV"
        }
    }
}


class EnumViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let movement : Movement = .left;
        switch movement {
        case .left:
            print("left")
        default:
            print("")
        }

        print(Area.DongGuan.NanCheng);
        
        let trade = Trade.Buy(stock: "003100", amount: 100)
        
        switch trade {
        case .Buy(let stock,let amount):
            print("stock:\(stock),amount:\(amount)")
        case .Sell(let stock,let amount):
            print("stock:\(stock),amount:\(amount)")
        default:
            ()
        }

        print(Device.iPhone.introduced())
    }
    
}
