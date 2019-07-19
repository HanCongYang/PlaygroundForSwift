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
        
        createDataSource()
        
        self.view.backgroundColor = UIColor.white
        
        let layout = UICollectionViewFlowLayout.init()
        layout.itemSize = CGSize(width: (UIScreen.main.bounds.width - 10) / 3.0, height: (UIScreen.main.bounds.width - 10) / 3.0)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets.init(top: 5, left: 5, bottom: 5, right: 5)
        
        collectionView = UICollectionView.init(frame: UIScreen.main.bounds, collectionViewLayout: layout)
        collectionView?.backgroundColor = UIColor.white
        collectionView?.delegate = self
        collectionView?.dataSource = self
        self.view.addSubview(collectionView!)
        self.view.backgroundColor = UIColor.white;
        
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
        cell.icon.image = UIImage(named: m.iconName!)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        switch indexPath.row {
        case 0:
            let vc = MTDictionaryDemoViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        case 1:
            let vc = SwiftTupleDemoViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        case 2:
            let vc = SwiftPromiseDemoViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        case 3:
            let vc = SwiftUseObjectiveCMethodViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        case 4:
            let vc = SwiftEscapeViewController()
            self.navigationController?.pushViewController(vc, animated: true)
            
        default: break
            
        }
        
        
    }
    
    func armColor()->UIColor{
        let red = CGFloat(arc4random()%256)/255.0
        let green = CGFloat(arc4random()%256)/255.0
        let blue = CGFloat(arc4random()%256)/255.0
        return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }
    
    
    func createDataSource() {
        
        dataSource = []
        dataSource?.add(MTCollectionCellModel(iconName: "爆米花", title: "字典操作"))
        dataSource?.add(MTCollectionCellModel(iconName: "秤", title: "元组"))
        dataSource?.add(MTCollectionCellModel(iconName: "蛋糕", title: "Promise"))
        dataSource?.add(MTCollectionCellModel(iconName: "啤酒", title: "Swift使用OC方法"))
        dataSource?.add(MTCollectionCellModel(iconName: "柠檬茶", title: "逃逸闭包\n非逃逸闭包"))

        
    }
    
}
