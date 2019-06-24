//
//  MTCollectionCellModel.swift
//  ManchurianTiger
//
//  Created by 李爱红 on 2019/6/22.
//  Copyright © 2019 LAH. All rights reserved.
//

import UIKit

class MTCollectionCellModel: NSObject {
    
    init(iconName: String, title: String) {
     
        self.iconName = iconName
        self.title = title
    }
    
    var iconName: String?
    var title: String?

}
