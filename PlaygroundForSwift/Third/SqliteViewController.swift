//
//  SqliteViewController.swift
//  PlaygroundForSwift
//
//  Created by 李爱红 on 2018/12/3.
//  Copyright © 2018年 LAH. All rights reserved.
//

import UIKit
import SQLite

class SqliteViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        

        
        let path = NSSearchPathForDirectoriesInDomains(
            .documentDirectory, .userDomainMask, true
            ).first!
        
        guard let db = try? Connection("\(path)/db.sqlite3") else {
            return
        }
//        let db = try! Connection("\(path)/db.sqlite3")
        print(path)
        let users = Table("users")
        let id = Expression<Int64>("id")
        let name = Expression<String?>("name")
        let email = Expression<String>("email")
        
        try! db.run(users.create(temporary: false, ifNotExists: true, withoutRowid: false, block: { (t) in
            
            t.column(id, primaryKey: true)
            t.column(name)
            t.column(email, unique: true)
            
        })
        )

    }
}
