//
//  MTHomeViewController.swift
//  ManchurianTiger
//
//  Created by 李爱红 on 2019/6/21.
//  Copyright © 2019 LAH. All rights reserved.
//

import UIKit

let ScreenWidth  = UIScreen.main.bounds.width
let ScreenHeight = UIScreen.main.bounds.height

class MTHomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    var collectionView: UICollectionView?
    let Identifier       = "CollectionViewCell"
    let headerIdentifier = "CollectionHeaderView"
    let footIdentifier   = "CollectionFootView"
    var dataSource: NSMutableArray?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "UICollectionView小解"
        self.view.backgroundColor = UIColor.white
        // 初始化
        let layout = UICollectionViewFlowLayout.init()
        layout.itemSize = CGSize(width: (UIScreen.main.bounds.width - 10) / 3.0, height: (UIScreen.main.bounds.width - 10) / 3.0)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets.init(top: 5, left: 5, bottom: 5, right: 5)
        // 设置分区头视图和尾视图宽高
        layout.headerReferenceSize = CGSize.init(width: ScreenWidth, height: 80)
        layout.footerReferenceSize = CGSize.init(width: ScreenWidth, height: 80)
        
        collectionView = UICollectionView.init(frame: UIScreen.main.bounds, collectionViewLayout: layout)
        collectionView?.backgroundColor = UIColor.white
        collectionView?.delegate = self
        collectionView?.dataSource = self
        self.view.addSubview(collectionView!)
        self.view.backgroundColor = UIColor.white;
        
        dataSource = []
        let m = MTCollectionCellModel()
        m.title = "Swift取地址符"
        dataSource?.add(m)
        // 注册cell
        collectionView?.register(UINib.init(nibName: "MTHomeCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: Identifier)

    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource!.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let m: MTCollectionCellModel = dataSource![indexPath.row] as! MTCollectionCellModel
        
        let cell: MTHomeCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: Identifier, for: indexPath) as! MTHomeCollectionViewCell
        cell.titleLabel.text = m.title
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
    }
    
    func armColor()->UIColor{
        let red = CGFloat(arc4random()%256)/255.0
        let green = CGFloat(arc4random()%256)/255.0
        let blue = CGFloat(arc4random()%256)/255.0
        return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
