//
//  AppDelegate.swift
//  PlaygroundForSwift
//
//  Created by 李爱红 on 2018/10/17.
//  Copyright © 2018年 LAH. All rights reserved.
//

import UIKit
import RAMAnimatedTabBarController



@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let homeViewController = MTHomeViewController()
        
        let homeTabBarItem = RAMAnimatedTabBarItem(title: "首页",
                                         image: UIImage(named: "爆米花"),
                                         selectedImage: UIImage(named: "爆米花"))
        homeTabBarItem.animation = RAMBounceAnimation()
        let homeNavigationController = UINavigationController(rootViewController: homeViewController)
        homeNavigationController.tabBarItem = homeTabBarItem
        
        
        let mineViewController = ViewController()
        
        let mineTabBarItem = RAMAnimatedTabBarItem(title: "我的",
                                                   image: UIImage(named: "冰淇淋"),
                                                   selectedImage: UIImage(named: "冰淇淋"))
        mineTabBarItem.animation = RAMBounceAnimation()
        let mineNavigationController = UINavigationController(rootViewController: mineViewController)
        mineNavigationController.tabBarItem = mineTabBarItem
        
        
        let tabbarController = RAMAnimatedTabBarController()
        tabbarController.viewControllers = [homeNavigationController, mineNavigationController]
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = tabbarController
        window?.makeKeyAndVisible()
        
        return true
    }
}

