//
//  SwiftDevideViewController.swift
//  PlaygroundForSwift
//
//  Created by 李爱红 on 2019/5/29.
//  Copyright © 2019 LAH. All rights reserved.
//

import UIKit

class SwiftDevideViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.stringInsertingAndRemoving()
        
        
    }
    
    func stringTrimmingCharacters() {
        
        /*
         CharacterSet 里各个枚举类型的含义如下：
         controlCharacters：控制符
         whitespaces：空格
         newlines：换行符
         whitespacesAndNewlines：空格换行
         decimalDigits：小数
         letters：文字
         lowercaseLetters：小写字母
         uppercaseLetters：大写字母
         nonBaseCharacters：非基础
         alphanumerics：字母数字
         decomposables：可分解
         illegalCharacters：非法
         punctuationCharacters：标点
         capitalizedLetters：大写
         symbols：符号
         */
        
        let string = "http: \\ baidu.com"
        let stripped = string.trimmingCharacters(in: .whitespacesAndNewlines)
        print(stripped)
        
        // 删除前后指定的字符
        let str1 = "<<hangge.com>>"
        //删除前后<>
        let characterSet = CharacterSet(charactersIn: "<>")
        let str2 = str1.trimmingCharacters(in: characterSet)
        
        //打印结果
        print("原字符串：\(str1)")
        print("新字符串：\(str2)")
        
    }
    
    // 字符串的插入和移除
    func stringInsertingAndRemoving() {
        
        var welcome = "hello"
        welcome.insert("!", at: welcome.endIndex)
        print(welcome)
    }
}
