//
//  AppDelegate.swift
//  PlaygroundForSwift
//
//  Created by 李爱红 on 2018/10/17.
//  Copyright © 2018年 LAH. All rights reserved.
//

import UIKit



@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let homeViewController = MTHomeViewController()
        homeViewController.tabBarItem.title = "首页"
        
        let mineViewController = ViewController()
        mineViewController.tabBarItem.title = "我的"
        
        let tabbarController = UITabBarController()
        tabbarController.viewControllers = [homeViewController, mineViewController]
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = tabbarController
        window?.makeKeyAndVisible()
        
        return true
    }
}

