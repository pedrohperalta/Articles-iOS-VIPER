//
//  AppDelegate.swift
//  Challenge
//
//  Created by Pedro Henrique Prates Peralta on 3/16/16.
//  Copyright © 2016 Cheesecake Labs. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder {
    
    var window: UIWindow?
}

extension AppDelegate: UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey : Any]? = nil) -> Bool {
        let appDependencies = AppDependencies()
        appDependencies.installRootViewControllerIntoWindow(window!)
        return true
    }
}
