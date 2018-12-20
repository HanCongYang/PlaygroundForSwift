//
//  ScaledHeightImageView.swift
//  PlaygroundForSwift
//
//  Created by 李爱红 on 2018/12/19.
//  Copyright © 2018年 LAH. All rights reserved.
//

import UIKit

class ScaledHeightImageView: UIImageView {
    
    var preferredMaxLayoutWidth : CGFloat = 0
 
    override var intrinsicContentSize: CGSize {
        
        if let myImage = self.image {
            let myImageWidth = myImage.size.width
            let myImageHeight = myImage.size.height
            let myViewWidth = preferredMaxLayoutWidth
            
            let ratio = preferredMaxLayoutWidth / myImageWidth
            let scaledHeight = myImageHeight * ratio
            
            return CGSize(width: myViewWidth, height: scaledHeight)
        }
        
        return CGSize(width: -1.0, height: -1.0)
    }

}
