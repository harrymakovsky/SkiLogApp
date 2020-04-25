//
//  AppDelegate.swift
//  Skiing Log Fixed
//
//  Created by Harry Makovsky on 3/28/20.
//  Copyright © 2020 Harry Makovsky. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let skiLog = SkiLog()
        
        
        let navController = window!.rootViewController as! UINavigationController
        let dayController = navController.topViewController as! DayViewController
        
        dayController.skiLog = skiLog
        
        return true
    }


}

