//
//  RxKeyboardViewController.swift
//  PlaygroundForSwift
//
//  Created by 李爱红 on 2018/12/29.
//  Copyright © 2018年 LAH. All rights reserved.
//

import UIKit
import RxSwift
import RxKeyboard

class RxKeyboardViewController: RxRootViewController, UIScrollViewDelegate, UITextFieldDelegate {
    
    let textField : UITextField = UITextField()
    let myScrollView : UIScrollView = UIScrollView()
    let containView : UIView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(myScrollView)
        myScrollView.backgroundColor = UIColor.red
        myScrollView.delegate = self
//        myScrollView.contentSize = CGSize(width: UIScreen.main.bounds.size.width,
//                                          height: UIScreen.main.bounds.size.height * 2)
        myScrollView.snp.makeConstraints { (make) in
            make.edges.equalTo(self.view)
        }
        myScrollView.showsVerticalScrollIndicator = true
        
        myScrollView.addSubview(containView)
        containView.backgroundColor = UIColor.blue
        containView.snp.makeConstraints { (make) in
            make.edges.equalTo(myScrollView)
            make.width.equalTo(UIScreen.main.bounds.size.width)
            make.height.equalTo(UIScreen.main.bounds.size.height * 2)
        }

        textField.backgroundColor = UIColor.purple
        textField.delegate = self
        containView.addSubview(textField)
        textField.snp.makeConstraints { (make) in
            make.top.equalTo(containView).offset(UIScreen.main.bounds.size.height)
            make.centerX.equalTo(containView)
            make.width.equalTo(UIScreen.main.bounds.size.width)
            make.height.equalTo(44)
        }

        RxKeyboard.instance.visibleHeight
            .drive(onNext: { keyboardVisibleHeight in
                self.myScrollView.contentInset.bottom = keyboardVisibleHeight
            })
            .disposed(by: disposeBag)

//        let bottomView : UIView = UIView()
//        bottomView.backgroundColor = UIColor.purple
//        myScrollView.addSubview(bottomView)
//        bottomView.snp.makeConstraints { (make) in
//            make.bottom.equalTo(myScrollView)
//            make.centerX.equalTo(myScrollView)
//            make.width.equalTo(UIScreen.main.bounds.size.width)
//            make.height.equalTo(44)
//        }
        
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if string == "\n" {
            self.textField.resignFirstResponder()
        }
        return true
    }
    
    
    
}
