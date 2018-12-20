//
//  RxRootViewController.swift
//  PlaygroundForSwift
//
//  Created by 李爱红 on 2018/12/19.
//  Copyright © 2018年 LAH. All rights reserved.
//

import UIKit
import SnapKit
import RxSwift
import FDStackView

class RxRootViewController: UIViewController {

    let disposeBag : DisposeBag = DisposeBag()
    let stack : FDStackView = FDStackView()
    let scrollView : UIScrollView = UIScrollView()
    
    let introduceImageViewA : ScaledHeightImageView = ScaledHeightImageView()
    let introduceImageViewB : ScaledHeightImageView = ScaledHeightImageView()

    let explainLabelA : UILabel = UILabel()
    let explainLabelB : UILabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isTranslucent = false
        
        view.addSubview(scrollView)
        scrollView.showsVerticalScrollIndicator = false;
        scrollView.snp.makeConstraints { (make) in
            make.edges.equalTo(self.view)
            make.width.equalTo(self.view)
        }

        stack.axis = NSLayoutConstraint.Axis.vertical
        stack.spacing = 10;
        scrollView.addSubview(stack)
        stack.snp.makeConstraints { (make) in
            make.top.left.bottom.equalTo(scrollView)
            make.width.equalTo(self.view).priority(ConstraintPriority.high)
        }

        stack.addArrangedSubview(introduceImageViewA)
        
        explainLabelA.numberOfLines = 0;
        explainLabelA.preferredMaxLayoutWidth = view.frame.size.width
        explainLabelB.numberOfLines = 0;
        explainLabelB.preferredMaxLayoutWidth = view.frame.size.width

        
        view.backgroundColor = UIColor.white
        introduceImageViewA.backgroundColor = UIColor.white
        introduceImageViewA.contentMode = UIView.ContentMode.scaleAspectFit
        introduceImageViewA.preferredMaxLayoutWidth = view.frame.size.width

        introduceImageViewB.backgroundColor = UIColor.white
        introduceImageViewB.contentMode = UIView.ContentMode.scaleAspectFit
        introduceImageViewB.preferredMaxLayoutWidth = view.frame.size.width

        scrollView.snp.makeConstraints { (make) in
            make.bottom.equalTo(stack)
        }
    }

}
