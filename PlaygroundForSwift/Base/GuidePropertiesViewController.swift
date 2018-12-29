//
//  GuidePropertiesViewController.swift
//  PlaygroundForSwift
//
//  Created by 李爱红 on 2018/12/28.
//  Copyright © 2018年 LAH. All rights reserved.
//

import UIKit

class DataImporter {
    /*
     DataImporter is a class to import data from an external file.
     The class is assumed to take a nontrivial amount of time to initialize.
     */
    var filename = "data.txt"
    // the DataImporter class would provide data importing functionality here
}

class DataManager {
    lazy var importer = DataImporter()
    var data = [String]()
    // the DataManager class would provide data management functionality here
}



class GuidePropertiesViewController: SwiftGuideRootViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let manager = DataManager()
        
        manager.data.append("Some data")
        manager.data.append("Some more data")
        

        // Do any additional setup after loading the view.
    }
    

}
