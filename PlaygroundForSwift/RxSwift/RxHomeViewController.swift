//
//  RxHomeViewController.swift
//  PlaygroundForSwift
//
//  Created by 李爱红 on 2018/12/19.
//  Copyright © 2018年 LAH. All rights reserved.
//

import UIKit
import RxSwift

class RxHomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let db = DisposeBag()
    let tb : UITableView = UITableView(frame: CGRect.zero)
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        
//        
//        
//        Observable<Int>.interval(1.0, scheduler: MainScheduler.instance)
//            .debug("interval")
//            .subscribe(onNext: {
//                print($0)
//            })
//            .addDisposableTo(db)
        
        
        tb.delegate = self;
        tb.dataSource = self;
        tb.frame = self.view.frame
        tb.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.view.addSubview(tb)
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
            cell.textLabel?.text = "1.amb"
        case 1:
            cell.textLabel?.text = "2.buffer"
        case 2:
            cell.textLabel?.text = "3.catchError"
        case 3:
            cell.textLabel?.text = "4.concat"
        case 4:
            cell.textLabel?.text = "5.behaviorSubject"
        case 5:
            cell.textLabel?.text = "6.Variable"
        case 6:
            cell.textLabel?.text = "7.BehaviorRelay"
        case 7:
            cell.textLabel?.text = "8.Schedulers - 调度器"
        case 8:
            cell.textLabel?.text = "9.Network"
        case 9:
            cell.textLabel?.text = "10.concatMap"
        case 10:
            cell.textLabel?.text = "11.connect"
        case 11:
            cell.textLabel?.text = "12.from"
        case 12:
            cell.textLabel?.text = "13.take family"
        case 13:
            cell.textLabel?.text = "14.retry"
        case 14:
            cell.textLabel?.text = "15.flatMap"
        case 15:
            cell.textLabel?.text = "16.shareReplay"
        case 16:
            cell.textLabel?.text = "17.do"
        case 17:
            cell.textLabel?.text = "18.distinctUntilChanged"
        case 18:
            cell.textLabel?.text = "19.Keyboard Avoid"
            
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
            vc = RxAmbViewController()
        case 1:
            vc = RxBufferViewController()
        case 2:
            vc = RxCatchErrorViewController()
        case 3:
            vc = RxConcatViewController()
        case 4:
            vc = RxBehaviorSubjectViewController()
        case 5:
            vc = RxVariableViewController()
        case 6:
            vc = RxBehaviorRelayViewController()
        case 7:
            vc = RxSchedulersViewController()
        case 8:
            vc = RxSwiftNetworkViewController()
        case 9:
            vc = RxConcatMapViewController()
        case 10:
            vc = RxConnectViewController()
        case 11:
            vc = RxFromViewController()
        case 12:
            vc = RxTakeFamilyViewController()
        case 13:
            vc = RxRetryViewController()
        case 14:
            vc = RxFlatMapViewController()
        case 15:
            vc = RxShareReplayViewController()
        case 16:
            vc = RxDoViewController()
        case 17:
            vc = RxDistinctUntilChangedViewController()
        case 18:
            vc = RxKeyboardViewController()
            
        default: break
            
        }
        
        if let vc : UIViewController = vc {
            self.navigationController?.pushViewController(vc, animated:true)
        }
        
    }

}
