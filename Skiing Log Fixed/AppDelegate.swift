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
    let skiLog = SkiLog()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        
        
        
        let navController = window!.rootViewController as! UINavigationController
        let dayController = navController.topViewController as! DayViewController
        
        dayController.skiLog = skiLog
        
        return true
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        let success = skiLog.saveChanges()
        if(success) {
            print("Saved all of the days")
        }else{
            print("Could not save the days")
        }
    }


}

