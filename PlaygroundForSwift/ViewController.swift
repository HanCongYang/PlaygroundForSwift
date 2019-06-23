//
//  ViewController.swift
//  PlaygroundForSwift
//
//  Created by 李爱红 on 2018/10/17.
//  Copyright © 2018年 LAH. All rights reserved.
//

import UIKit
import Alamofire
import var CommonCrypto.CC_MD5_DIGEST_LENGTH
import func CommonCrypto.CC_MD5
import typealias CommonCrypto.CC_LONG

func MD5(string: String) -> Data {
    let length = Int(CC_MD5_DIGEST_LENGTH)
    let messageData = string.data(using:.utf8)!
    var digestData = Data(count: length)
    
    _ = digestData.withUnsafeMutableBytes { digestBytes -> UInt8 in
        messageData.withUnsafeBytes { messageBytes -> UInt8 in
            if let messageBytesBaseAddress = messageBytes.baseAddress, let digestBytesBlindMemory = digestBytes.bindMemory(to: UInt8.self).baseAddress {
                let messageLength = CC_LONG(messageData.count)
                CC_MD5(messageBytesBaseAddress, messageLength, digestBytesBlindMemory)
            }
            return 0
        }
    }
    return digestData
}


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let tb : UITableView = UITableView(frame: CGRect.zero)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tb.delegate = self;
        tb.dataSource = self;
        tb.frame = self.view.frame
        tb.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.view.addSubview(tb)
        
        var temp = 10;
        add(a: &temp)
        print(temp)
        
        let urlA = URL(string: "http://www.baidu.com")
//        print(urlA.hashValue)
        print(MD5(string: urlA!.absoluteString).base64EncodedString())
        
        let urlB = URL(string: "http://www.baidu.com")
//        print(urlB.hashValue)
        print(MD5(string: urlB!.absoluteString).base64EncodedString())

        let urlC = URL(string: "http://www.google.com")
//        print(urlC.hashValue)
        print(MD5(string: urlC!.absoluteString).base64EncodedString())

    }
    
    override func viewWillAppear(_ animated: Bool) {

    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1000
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        switch indexPath.row {
        case 0:
            cell.textLabel?.text = "1.Swift Language Guide"
        case 1:
            cell.textLabel?.text = "2.RxSwift"
        case 2:
            cell.textLabel?.text = "3.Block"
        case 3:
            cell.textLabel?.text = "4.字符串索引"

        default:
            cell.textLabel?.text = "null"
            break
        }
        return cell;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var vc : UIViewController?
        switch indexPath.row {
        case 0:
            vc = SwiftGuideHomeViewController()
        case 1:
            vc = RxHomeViewController()
        case 2:
            vc = SwiftBlockViewController()
        case 3:
            vc = SwiftStringGuideListViewController()
            
        default: break
            
        }
        
        if let vc : UIViewController = vc {
            self.navigationController?.pushViewController(vc, animated:true)
        }
        
    }
    
//    var temp = 10
    func add( a: inout Int){
        a += 10
    }
    
    func otherAdd(a: Int){
    }

//    add(&temp)
//    temp // 11
}
