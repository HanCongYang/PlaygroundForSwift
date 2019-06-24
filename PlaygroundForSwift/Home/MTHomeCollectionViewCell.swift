//
//  MTHomeCollectionViewCell.swift
//  ManchurianTiger
//
//  Created by 李爱红 on 2019/6/21.
//  Copyright © 2019 LAH. All rights reserved.
//

import UIKit

class MTHomeCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var container: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var icon: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.container.layer.cornerRadius = 4.0
        self.container.layer.masksToBounds = true
        
        
    }

}
