//
//  ViewController.swift
//  PlaygroundForSwift
//
//  Created by 李爱红 on 2018/10/17.
//  Copyright © 2018年 LAH. All rights reserved.
//

import UIKit
import Alamofire

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
